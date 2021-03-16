<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use DB;

class TransaksiController extends Controller
{

    public function notif()
    {
        $key_demo='db63f52c1a00d33cf143524083dd3ffd025d672e255cc688';
        $url='http://149.28.156.46:8000/demo/send_message';
        $data = array(
        "phone_no"=> '+6289504932111',
        "key"     => $key_demo,
        "message" => 'DEMO AKUN WOOWA. tes woowa api v3.0 mohon di abaikan'
        );

        $data_string = json_encode($data,1);

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_VERBOSE, 0);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, 360);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Content-Length: ' . strlen($data_string),
        'Authorization: Basic dXNtYW5ydWJpYW50b3JvcW9kcnFvZHJiZWV3b293YToyNjM3NmVkeXV3OWUwcmkzNDl1ZA=='
        ));
        echo $res=curl_exec($ch);
        curl_close($ch);

    }




    public function create($slug)
    {
        $campaign = DB::table('campaigns')->where('slug',$slug)->get()->first();   
        $setting = DB::table('setting')->where('key','pixel_id')->get()->first();       
        $data['pixel_id'] = $setting->value;

        $data['campaign'] = $campaign;
        $data['rekening'] =DB::table('rekening')->get(); 
        return view('front.form_donasi',$data);
    }

    public function store(Request $request)
    {

        $cek_lead = DB::table('leads')->where('hp',$request->hp)->get()->first();
     // dd($cek_lead);
        if($cek_lead == null){
            $lead =  DB::table('leads')->insertGetId(
                [
                    'nama' => $request->nama, 
                    'hp' =>$request->hp,
                    'email' => $request->email,
                    //'kota' =>$request->campaign_id,
                    'status' => 'prospek'
                ]
            );
        }else{
            $lead =  $cek_lead->id;
        }

       // dd($lead);
       $kode_unik = rand(100,999);
       $nominal = $request->nominal + $kode_unik;

       $id = DB::table('donasi')->insertGetId(
            [
                
                'status' => "pending",
                'campaigns_id' =>$request->campaign_id,
                'leads_id' =>$lead,
                'rekening_id' =>$request->rekening,
                'nominal' => $nominal, 
                'kode_unik' =>$kode_unik,
                'kode_transaksi' => uniqid(),
            ]
        );

        $kode = DB::table('donasi')->select(['kode_transaksi'])->where('id',$id)->get()->first();       

    return redirect()->route('terimakasih', ['kode' => $kode->kode_transaksi]);

    }


    public function terimakasih($kode)
    {
        $data['transaksi'] = DB::table('donasi')
                            ->select(['donasi.*','rekening.nomor_rekening','rekening.nama_rekening','rekening.bank'])
                            ->join('rekening','rekening_id','rekening.id')
                            ->where('donasi.kode_transaksi',$kode)->get()->first();

        $setting = DB::table('setting')->where('key','pixel_id')->get()->first();       
        $data['pixel_id'] = $setting->value;
        
        return view('front.terimakasih',$data);
    }

    public function getNotif($kode)
    {
        $transaksi = DB::table('donasi')
                ->select(['donasi.*','rekening.nomor_rekening','rekening.nama_rekening','rekening.bank'])
                ->join('rekening','rekening_id','rekening.id')
                ->where('donasi.kode_transaksi',$kode)->get()->first();        

        $this->notif($transaksi->hp);
    }

}

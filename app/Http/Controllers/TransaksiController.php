<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use DB;

class TransaksiController extends Controller
{
    public function create($slug)
    {
        $campaign = DB::table('campaigns')->where('slug',$slug)->get()->first();   

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


        return view('front.terimakasih',$data);
    }

}

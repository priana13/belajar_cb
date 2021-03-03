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

        DB::table('donasi')->insert(
            [
                'nominal' => $request->nominal, 
                'status' => "pending",
                'campaigns_id' =>$request->campaign_id,
                'leads_id' =>$lead,
                'rekening_id' =>$request->rekening
            ]
        );

    return redirect()->route('terimakasih');

    }


    public function terimakasih()
    {
        return view('front.terimakasih');
    }

}

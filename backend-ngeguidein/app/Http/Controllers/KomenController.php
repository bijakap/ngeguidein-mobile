<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\komentar;

class KomenController extends Controller
{
    // public function index(Request $request, $id, $id_user)
    // {
    //     // echo $id;
    //     komentar::create([
    //         'id_destinasi'=>$id,
    //         'id_user'=>$id_user, 
    //         'komen'=>$request->komen,
    //     ]);

    //     return redirect('pilihan/' . $id);
        
    //     // dd(komentar::where('id_destinasi', 1));

    // }

    public function index(Request $request, $id, $id_user)
    {
        // echo $id;
        try{
        komentar::create([
            'id_destinasi'=>$id,
            'id_user'=>$id_user, 
            'komen'=>$request->komen,
        ]);

        return response('success', 200);
        }catch(\Exception $e){
            return response("internal Server Error", 500);
        }
        // dd(komentar::where('id_destinasi', 1));

    }

    public function tampilKomentar($id){
        try{
            $callKomentar = Komentar::where("id_destinasi", $id)->get();
            return response($callKomentar, 200);
        }catch(\Exception $e){
            return response("cek error", 500);
        }
    }
}

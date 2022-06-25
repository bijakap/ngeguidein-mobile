<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\komentar;
use Illuminate\Support\Facades\DB;

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
            // SELECT * FROM komentars JOIN users on komentars.id_user = users.id
            $listKomentar = DB::table('komentars')->select('id_destinasi','komen','name','gambar','komentars.created_at', 'komentars.updated_at')
            ->join('users', function ($join) use($id) {
                $join->on('komentars.id_user', '=', 'users.id')
                ->where('id_destinasi', '=', $id);
            })
            ->get();
            return response($listKomentar, 200);
        }catch(\Exception $e){
            return response($e, 500);
        }
    }
}

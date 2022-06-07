<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\komentar;

class KomenController extends Controller
{
    public function index(Request $request, $id, $id_user)
    {
        // echo $id;
        komentar::create([
            'id_destinasi'=>$id,
            'id_user'=>$id_user, 
            'komen'=>$request->komen,
        ]);

        return redirect('pilihan/' . $id);
        
        // dd(komentar::where('id_destinasi', 1));

    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Destinasi;
use App\Models\Step_destinasi;
use Illuminate\Http\Request;
use App\Models\komentar;

class DestinasiController extends Controller
{
    public function index(){
        return response("testing", 200);
    }

    public function pilihan(){
        try{
            $user = Destinasi::all();
            return response($user,200);
        }catch(\Exception $e){
            return response("Internal Server Error", 500);
        }
    }

    public function destinasi($id){
        // $destinasi = Destinasi::where('id_destinasi', $id)->get();
        // $step = Step_destinasi::select('step_ke')->where('id_step', $id)->get();
        // $img = Step_destinasi::select('src')->where('id_step', $id)->get();
        // $titik = Step_destinasi::select('titik_x', 'titik_y', 'src')->where('id_step', $id)->get();
        // // SELECT * FROM `komentars` INNER JOIN `users` ON `users`.`id` = `komentars`.`id_user`
        // $komen = komentar::join('users', 'users.id', '=', 'komentars.id_user')->where('id_destinasi', $id)->get();
        // return view('destinasi',[
        //     'destinasi' => $destinasi[0],
        //     'step' => $step,
        //     'img' => $img,
        //     'titik' => $titik,
        //     'komen' => $komen
        // ]);
        try{
            $destinasi = Destinasi::where('id_destinasi', $id)->first();
            return response($destinasi,200);
        }catch(\Exception $e){
            return response("Internal Server Error", 500);
        }
    }

    public function storeImage(Request $request){
        try{
            // return response("test", 200);
            $request->validate([
                'image' => 'image|mimes:jpg,png,jpeg,svg|max:2000',
            ]);
            
            // dd($request);
            if ($file = $request->file('file')) {
                $path = $file->store('public/files');
                $name = $file->getClientOriginalName();
    
                //store your file into directory and db
                // $save = new File();
                // $save->save();
                    
                return response()->json([
                    "success" => true,
                    "message" => "File successfully uploaded",
                    "file" => $path,
                    "name" => $name,

                ]);
            }
        }catch(\Exception $e){
            return response("Internal Server Error", 500);
        }
    }
}

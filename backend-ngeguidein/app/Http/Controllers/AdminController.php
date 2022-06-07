<?php

namespace App\Http\Controllers;

use App\Models\Destinasi;
use App\Models\Step_destinasi;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index(){
        return view('admin.admin',[
            'destinasi' => Destinasi::all()
        ]);
    }

    public function view($id){
        $destinasi = Destinasi::where('id_destinasi', $id)->get();
        $step = Step_destinasi::where('id_step', $id)->get();
        // $img = Step_destinasi::select('src')->where('id_step', $id)->get();
        return view('admin.viewdestinasi', [
            'destinasi' => $destinasi[0],
            'step' => $step,
        ]);
    }

    public function tambah(request $request){
        $validatedData = $request->validate([
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2000',
        ]);

        $destinationPath = public_path().'/img' ;
        $request->file('image')->move($destinationPath,$request->file('image')->getClientOriginalName());

        Destinasi::create([
            'nama_tempat' => $request->nama_tempat,
            'deskripsi'=> $request->deskripsi,
            'src' => '/img/' . $request->file('image')->getClientOriginalName()
        ]);

        return redirect('/admin')->with('success','Data Berhasil ditambahkan');
    }

    public function tambahlangkah(request $request, $id){
        $validatedData = $request->validate([
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2000',
        ]);

        $destinationPath = public_path().'/img' ;
        $request->file('image')->move($destinationPath,$request->file('image')->getClientOriginalName());

        Step_destinasi::create([
            'id_step' => $id,
            'step_ke' => $request->langkah,
            'titik_x'=> $request->titik_x,
            'titik_y'=> $request->titik_y,
            'src' => '/img/' . $request->file('image')->getClientOriginalName()
        ]);

        return redirect('/admin/view/'.$id)->with('success','Langkah Berhasil Ditambahkan');
    }

    public function update_destinasi(Request $request, $id){
        
        $validatedData = $request->validate([
            'image' => 'image|mimes:jpg,png,jpeg,gif,svg|max:2000',
        ]);

        if($file = $request->hasFile('image')) {      
            $file = $request->file('image') ;
            $fileName = $file->getClientOriginalName() ;
            $destinationPath = public_path().'/img' ;
            $file->move($destinationPath,$fileName);

            Destinasi::where('id_destinasi', $id)->update([
                'nama_tempat'=>$request->nama_tempat,
                'deskripsi' =>$request->deskripsi,
                'src'=>'/img/' . $fileName,
            ]);
            return redirect('/admin/view/' . $id)->with('success', 'Update Berhasil');
        } else {
            Destinasi::where('id_destinasi', $id)->update([
                'nama_tempat'=>$request->nama_tempat,
                'deskripsi' =>$request->deskripsi,
            ]);
            return redirect('/admin/view/' . $id)->with('success', 'Update Berhasil');
        }
    }

    public function update_step(Request $request, $id, $index){
        
        $validatedData = $request->validate([
            'image' => 'image|mimes:jpg,png,jpeg,gif,svg|max:2000',
        ]);

        // echo $id . " " . $index;
        if($file = $request->hasFile('image')) {      
            $file = $request->file('image') ;
            $fileName = $file->getClientOriginalName() ;
            $destinationPath = public_path().'/img' ;
            $file->move($destinationPath,$fileName);

            Step_destinasi::where('id', $index)->update([
                'step_ke'=>$request->langkah,
                'titik_x' =>$request->titik_x,
                'titik_y' =>$request->titik_y,
                'src'=>'/img/' . $fileName,
            ]);
            return redirect('/admin/view/' . $id)->with('success', 'Update Berhasil');
        } else {
            Step_destinasi::where('id', $index)->update([
                'step_ke'=>$request->langkah,
                'titik_x' =>$request->titik_x,
                'titik_y' =>$request->titik_y,
            ]);
            return redirect('/admin/view/' . $id)->with('success', 'Update Berhasil');
        }
    }

    public function deleteDestinasi($id){
        Destinasi::where('id_destinasi', $id)->delete();
        return redirect('/admin');
    }

    public function deleteLangkah($id, $id_step){
        Step_destinasi::where('id', $id_step)->delete();
        return redirect('/admin/view/'.$id);
    }
}

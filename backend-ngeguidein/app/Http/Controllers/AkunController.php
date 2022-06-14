<?php

namespace App\Http\Controllers;
use App\Models\akun;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AkunController extends Controller
{
    // public function index() {

      
    //   $callAkun = User::where("id", Auth::user()->id)->get();
    //   return view('profile.profile', ["data"=>$callAkun]);
    // }

    // public function tampilkan_data($id)
    // {

    //     $callAkun = User::where("id", $id)->get();
    //     return view('profile.edit', ["data"=>$callAkun, "id"=>$id]);

    // }

    // public function ubah(Request $request, $id)
    // {

    //   $validatedData = $request->validate([
    //     'image' => 'image|mimes:jpg,png,jpeg,gif,svg|max:2000',
    //   ]);

    //   if ($request->password){
    //     if($file = $request->hasFile('image')) {      
    //       $file = $request->file('image') ;
    //       $fileName = $file->getClientOriginalName() ;
    //       $destinationPath = public_path().'/img' ;
    //       $file->move($destinationPath,$fileName);
  
    //       User::where('id', $id)->update([
    //         'name'=>$request->username,
    //         'password' =>Hash::make($request->password),
    //         'email'=>$request->email,
    //         'job'=>$request->job,
    //         'faculty'=>$request->faculty,
    //         'bio'=>$request->bio,
    //         'gambar'=>'/img/' . $fileName,
    //       ]);
    //       return redirect('/profile')->with('success', 'Update Berhasil');
    //     } else {
    //         User::where('id', $id)->update([
    //           'name'=>$request->username,
    //           'password' =>Hash::make($request->password),
    //           'email'=>$request->email,
    //           'job'=>$request->job,
    //           'faculty'=>$request->faculty,
    //           'bio'=>$request->bio,
    //         ]);
    //         return redirect('/profile')->with('success', 'Update Berhasil');
    //     }
    //   } else {
    //     if($file = $request->hasFile('image')) {      
    //       $file = $request->file('image') ;
    //       $fileName = $file->getClientOriginalName() ;
    //       $destinationPath = public_path().'/img' ;
    //       $file->move($destinationPath,$fileName);
  
    //       User::where('id', $id)->update([
    //         'name'=>$request->username,
    //         'email'=>$request->email,
    //         'job'=>$request->job,
    //         'faculty'=>$request->faculty,
    //         'bio'=>$request->bio,
    //         'gambar'=>'/img/' . $fileName,
    //       ]);
    //       return redirect('/profile')->with('success', 'Update Berhasil');
    //     } else {
    //         User::where('id', $id)->update([
    //           'name'=>$request->username,
    //           'email'=>$request->email,
    //           'job'=>$request->job,
    //           'faculty'=>$request->faculty,
    //           'bio'=>$request->bio,
    //         ]);
    //         return redirect('/profile')->with('success', 'Update Berhasil');
    //     }
    //   }

    //   // echo $id . " " . $index;
      

    //   // dd($request->all());
    //   // $data_user = akun::where('id', $id)->get();
    //   // akun::where('id', $id)->update([
    //   //     'username'=>$request->username,
    //   //     'password' =>$request->password,
    //   //     'email'=>$request->email,
    //   //     'job'=>$request->job,
    //   //     'faculty'=>$request->faculty,
    //   //     'bio'=>$request->bio,
    //   // ]);

    //   // $data_user = akun::find($id);
    //   // $data_user->update($request->all());
    //   // return redirect('/profile');
    // }

    public function ubah(Request $request, $id) {
      try{
        $request->validate([
          'image' => 'image|mimes:jpg,png,jpeg,gif,svg|max:2000',
        ]);

        if ($request->password){
          if($file = $request->file('file')) {      
            $file = $request->file('file');
            $path = $file->store('public/files');
            $name = $file->getClientOriginalName();
            // $fileName = $file->getClientOriginalName() ;
            // $destinationPath = public_path().'/img' ;
            // $file->move($destinationPath,$fileName);
    
            User::where('id', $id)->update([
              'name'=>$request->username,
              'password' =>Hash::make($request->password),
              'email'=>$request->email,
              'job'=>$request->job,
              'faculty'=>$request->faculty,
              'bio'=>$request->bio,
              'gambar'=> $path,
            ]);
            return response('Sukses', 200);
          }else {
            User::where('id', $id)->update([
              'name'=>$request->username,
              'password' =>Hash::make($request->password),
              'email'=>$request->email,
              'job'=>$request->job,
              'faculty'=>$request->faculty,
              'bio'=>$request->bio,
            ]);
            return response('Sukses', 200);
          }
        }else {
          if($file = $request->file('file')) {      
            $file = $request->file('file');
            $path = $file->store('public/files');
            $name = $file->getClientOriginalName();
    
            User::where('id', $id)->update([
              'name'=>$request->username,
              'email'=>$request->email,
              'job'=>$request->job,
              'faculty'=>$request->faculty,
              'bio'=>$request->bio,
              'gambar'=>$path,
            ]);
            return response('Sukses', 200);
          }else {
            User::where('id', $id)->update([
              'name'=>$request->username,
              'email'=>$request->email,
              'job'=>$request->job,
              'faculty'=>$request->faculty,
              'bio'=>$request->bio,
            ]);
            return response('Sukses', 200);
          }
        }

      }catch(\Exception $e){
          return response("Internal Server Error", 500);
      }
    }

    public function tampilkan_data($id)
    {
      try{
        $callAkun = User::where("id", $id)->first();
        return response($callAkun,200);
      }catch(\Exception $e){
          return response("cek error", 500);
      }
    }
}

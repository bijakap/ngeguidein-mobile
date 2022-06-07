<?php

namespace Database\Seeders;

use App\Models\Destinasi;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DestinasiTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $destinasi = new Destinasi;
        $destinasi->id_destinasi = 1;
        $destinasi->nama_tempat = "Danau Galau";
        $destinasi->deskripsi = "Danau galau bisa dibilang salah satu titik di Telkom university yang sangat iconic bagi keluarga tel-u. Danau galauy adalah tempat yang menenangkan, tempat sebagai Pelepas penat, tempat berkumpul, swafoto, dan menjadi item menarik Telkom University";
        $destinasi->src = '/img/tempimage.png';
        $destinasi->save();

        $destinasi = new Destinasi;
        $destinasi->id_destinasi = 2;
        $destinasi->nama_tempat = "Tempat Rekomendasi 2";
        $destinasi->deskripsi = "Danau galau bisa dibilang salah satu titik di Telkom university yang sangat iconic bagi keluarga tel-u. Danau galauy adalah tempat yang menenangkan, tempat sebagai Pelepas penat, tempat berkumpul, swafoto, dan menjadi item menarik Telkom University";
        $destinasi->src = '/img/tempimage.png';
        $destinasi->save();

        $destinasi = new Destinasi;
        $destinasi->id_destinasi = 3;
        $destinasi->nama_tempat = "Tempat Rekomendasi 3";
        $destinasi->deskripsi = "Danau galau bisa dibilang salah satu titik di Telkom university yang sangat iconic bagi keluarga tel-u. Danau galauy adalah tempat yang menenangkan, tempat sebagai Pelepas penat, tempat berkumpul, swafoto, dan menjadi item menarik Telkom University";
        $destinasi->src = '/img/tempimage.png';
        $destinasi->save();

        $destinasi = new Destinasi;
        $destinasi->id_destinasi = 4;
        $destinasi->nama_tempat = "Tempat Rekomendasi 4";
        $destinasi->deskripsi = "Danau galau bisa dibilang salah satu titik di Telkom university yang sangat iconic bagi keluarga tel-u. Danau galauy adalah tempat yang menenangkan, tempat sebagai Pelepas penat, tempat berkumpul, swafoto, dan menjadi item menarik Telkom University";
        $destinasi->src = '/img/tempimage.png';
        $destinasi->save();
    }
}

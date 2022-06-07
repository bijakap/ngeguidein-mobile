<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\komentar;
class komentarTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $komentar = new komentar;
        $komentar->id_destinasi = 1;
        $komentar->id_user = 2;
        $komentar->komen = "tempatnya menarik";
        $komentar->save();

        $komentar = new komentar;
        $komentar->id_destinasi = 1;
        $komentar->id_user = 2;
        $komentar->komen = "Tempatnya bagus";
        $komentar->save();
    }
}

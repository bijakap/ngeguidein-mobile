<?php

namespace Database\Seeders;

use App\Models\Step_destinasi;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StepDestinasiTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $titik = [
            [
                [415,320],
                [537,320],
                [537,250],
            ]
        ];

        $latLng = [
            [
                [-6.973935332705242, 107.63257710511881],
                [-6.973904293836273, 107.63163899846339],
                [-6.9733352475404775, 107.63151391757599]
            ]
        ];

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 1;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->latitude = $latLng[0][$i-1][0];
            $step->longitude = $latLng[0][$i-1][1];
            $step->src = '/storage/tempimage.png';
            $step->save();
        }

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 2;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->latitude = $latLng[0][$i-1][0];
            $step->longitude = $latLng[0][$i-1][1];
            $step->src = '/storage/tempimage.png';
            $step->save();
        }

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 3;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->latitude = $latLng[0][$i-1][0];
            $step->longitude = $latLng[0][$i-1][1];
            $step->src = '/storage/tempimage.png';
            $step->save();
        }

        // for ($i = 1; $i < 4; $i++){
        //     $step = new Step_destinasi;
        //     $step->id_step = 4;
        //     $step->step_ke = 'Langkah Ke -' . " ". $i;
        //     $step->titik_x = $titik[0][$i-1][0];
        //     $step->titik_y = $titik[0][$i-1][1];
        //     $step->src = '/storage/tempimage.png';
        //     $step->save();
        // }
    }
}

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
                [-6.973199350750008, 107.63335572892036],
                [-6.974040658533229, 107.63256179504644],
                [-6.976064050838248, 107.63269054107744]
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

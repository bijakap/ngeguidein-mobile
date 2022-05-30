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

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 1;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->src = '/img/tempimage.png';
            $step->save();
        }

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 2;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->src = '/img/tempimage.png';
            $step->save();
        }

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 3;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->src = '/img/tempimage.png';
            $step->save();
        }

        for ($i = 1; $i < 4; $i++){
            $step = new Step_destinasi;
            $step->id_step = 4;
            $step->step_ke = 'Langkah Ke -' . " ". $i;
            $step->titik_x = $titik[0][$i-1][0];
            $step->titik_y = $titik[0][$i-1][1];
            $step->src = '/img/tempimage.png';
            $step->save();
        }
    }
}

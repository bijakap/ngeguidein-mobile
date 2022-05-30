<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        DB::table('users')->insert([
            'name' => "admin",
            'email' => 'admin@gmail.com',
            'password' => '$2y$10$uOerm2hD9fMazbM1zIKG2O.rZfCMDGpXRukv6K99P6x2yl6EEtRCu',
            'Level' => 'admin',
        ]);

        DB::table('users')->insert([
            'name' => "Hashirama Hiro",
            'email' => 'Hiro@gmail.com',
            'password' => '$2y$10$uOerm2hD9fMazbM1zIKG2O.rZfCMDGpXRukv6K99P6x2yl6EEtRCu',
            'job' => 'Anak Kuliah',
            'faculty' => 'Something something',
            'bio' => "I'm interested in Programming",
            'gambar' => '/img/profile.png'
        ]);

        $this->call([
            DestinasiTableSeeder::class,
            StepDestinasiTableSeeder::class,
            komentarTableSeeder::class,
            AkunSeeder::class
        ]);

        // $profile = new User;
        // $profile->name = "Armadhani Hiro";
        // $profile->password = "123456789";
        // $profile->email = "armando@gmail.com";
        // $profile->job = 'Student College';
        // $profile->faculty = 'Informatics';
        // $profile->bio = "I'm interested in programming, I like solving problems and I also like to try new challenging";
        // $profile->gambar = '/img/profile.png';
        // $profile->remember_token = Str::random(10);
        // $profile->save();
    }


}

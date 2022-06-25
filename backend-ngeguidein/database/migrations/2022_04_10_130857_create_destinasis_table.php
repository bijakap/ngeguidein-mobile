<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('destinasis', function (Blueprint $table) {
            $table->id('id_destinasi');
            $table->string('nama_tempat');
            $table->string('deskripsi');
            $table->string('src');
            // <-- Pembaharuan
            $table->string('latitude');
            $table->string('longitude');
            // Pembaharuan -->
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('destinasis');
    }
};

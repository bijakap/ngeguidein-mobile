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
        Schema::create('step_destinasis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_step');
            $table->string('step_ke');
            $table->string('titik_x');
            $table->string('titik_y');
            // <-- Pembaharuan
            $table->string('latitude')->default('-6.973188693551878');
            $table->string('longitude')->default('107.63031264348629');
            // Pembaharuan -->
            $table->string('src');
            $table->timestamps();

            // Foreign Key
            $table->foreign('id_step')->references('id_destinasi')->on('destinasis')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('step_destinasis');
    }
};

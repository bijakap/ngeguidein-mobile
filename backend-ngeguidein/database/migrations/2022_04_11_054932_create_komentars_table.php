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
        Schema::create('komentars', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_destinasi');
            $table->unsignedBigInteger('id_user');
            $table->string('komen');
            $table->timestamps();

            //Foreign Key
            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_destinasi')->references('id_destinasi')->on('destinasis')->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('komentars');
    }
};
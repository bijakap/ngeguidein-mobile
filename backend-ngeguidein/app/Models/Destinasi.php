<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destinasi extends Model
{
    use HasFactory;

    protected $fillable = [
       'nama_tempat',
       'deskripsi',
       'src',
    //    'id_destinasi'
    ];

    public function step_destinasi() {
        return $this->hasMany(Step_destinasi::class);
    }

}

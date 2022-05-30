<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class komentar extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'id_destinasi',
        'id_user',
        'komen',
    ]; 

    public function komentar() {
        return $this->hasMany(User::class);
    }
}

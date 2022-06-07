<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Step_destinasi extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'id_step',
        'step_ke',
        'titik_x',
        'titik_y',
        'src',
    ];
    
    public function destinasi() {
        return $this->belongsTo(Destinasi::class);
    }
}

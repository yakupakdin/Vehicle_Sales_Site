<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderStatus extends Model
{
    use HasFactory;
    protected $table = "siparisDurum";
    protected $fillable=["id","aciklama"];
    public $timestamps=false;
}

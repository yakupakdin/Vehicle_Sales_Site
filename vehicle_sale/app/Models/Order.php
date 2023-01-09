<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = "siparis";
    protected $fillable=["id","kullaniciSiparisId","siparisTarih","fatura","siparisDurum"];
    public $timestamps=false;
}

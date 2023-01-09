<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\User;
use App\Models\Users;
use App\Models\Address;
use App\Models\City;
use App\Models\sepet;
use App\Models\Products;
use App\Models\ProductsModel;
use App\Models\ProductsModelBrand;
use App\Models\Order;
use App\Models\OrderStatus;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Mail;


class UsersMainController extends Controller{
    public function usersMain()
    {

        $data['title'] = "Anasayfa".Session::get('id');
        $data['products'] = Products::get();
        $data['productsmodel'] = ProductsModel::get();
        $data['productsmodelbrand'] = ProductsModelBrand::get();
        return view('userPage.main', $data);
    }
    public function itemCarDetail(Request $request){
        $id=$request->hiddenid;

        $data['title']="Ürün Detayı";
        $data['itemCar']= Products::where("id", $id)->first();


        return view('userPage.itemDetail',$data);




    }
    public function usersDetail(){
        $data['title']="Profil Bilgileri";
        $data['kullanici']=Users::where("eMail", Session::get('UMail'))->first();

        return view('userPage.userDetail',$data);


    }
    public function usersUpdate(Request $request){
        $id=$request->hiddenid;
        if ($request->has('userFrozen')){

            $userFrozen = Users::where("id",$id )->update(array(
                "aktif" => "0",

            ));
            $data['title'] = "Giriş Ekranı";
            return view('layouts.login',$data);

        }
        $data['title']="Profil Güncelle";
        $data['sehirler'] = City::get();
        $data['kullanici']=Users::where('id',$id)->first();


        return view('userPage.userUpdate',$data);

    }
    public function usersUpgrade(Request $request){
        $id = $request->hiddenid;


        $tcno = $request->tcno;
        $isim = $request->isim;
        $soyisim = $request->soyisim;
        $telefon = $request->telefon;
        $dogumTarihi = $request->dogumTarihi;
        $eMail = $request->eMail;
        $pass=$request->pass;

        $adresselect = $request->sehirler;

        $mahalle = $request->mahalle;
        $cadde = $request->cadde;
        $sokak = $request->sokak;
        $binaNo = $request->binaNo;
        $daireNo = $request->daireNo;
        $ilce = $request->ilce;
        $sehirids = City::where("isim", $adresselect)->first();

        $sehirid = $sehirids['plakaKodu'];

        $userAdressUpdate = Address::create([
            "sehirId" => $sehirid,
            "ilce" => $ilce,
            "cadde" => $cadde,
            "mahalle" => $mahalle,
            "sokak" => $sokak,
            "binaNo" => $binaNo,
            "daireNo" => $daireNo,

        ]);

        $userSehirId = DB::table('adresler')->where('ilce', $ilce)
            ->where('cadde', $cadde)
            ->where('mahalle', $mahalle)
            ->where('sokak', $sokak)
            ->where('binaNo', $binaNo)
            ->where('daireNo', $daireNo)
            ->first();

        $usersehir = $userSehirId->id;

        $userUpdate = Users::where("id", $id)->update(array(
            'tcNo' => $tcno,
            'isim' => $isim,
            'soyisim' => $soyisim,
            'telefon' => $telefon,
            'dogumTarihi' => $dogumTarihi,
            'eMail' => $eMail,
            'sifre'=>md5($pass),
            'adresId' => $usersehir,


        ));


        $data['title']="Profil Bilgileri";
        $data['kullanici']=Users::where("eMail", Session::get('UMail'))->first();



        return view('userPage.userDetail',$data);

    }

    public function sepeteEkle(Request $request){
        $musteriid=$request->hiddenmusteriid;
        $urunkodu=$request->hiddenurunkodu;



        if ($request->has('sepeteekleme')){

            $userCreate=sepet::create([
                'musteriNo'=>$musteriid,
                'urunKodu'=>$urunkodu,
                'adet'=>1,


            ]);
        }






        $data['title'] = "Anasayfa".Session::get('id');
        $data['products'] = Products::get();
        $data['productsmodel'] = ProductsModel::get();
        $data['productsmodelbrand'] = ProductsModelBrand::get();
        return view('userPage.main', $data);
    }

    public function sepetegit(Request $request){

        $data['sepet'] = \App\Models\sepet::where("musteriNo", Session::get('id'))->get();
        if ($request->has('siparisver')){

            $siparis=Order::create([
                'kullaniciSiparisId'=>Session::get('id'),
                'siparisTarih'=>"0001-01-01",
                'fatura'=>1,
                'siparisDurum'=>3,
                ]);

            $userUpdate = Users::where("id", Session::get('id'))->update(array(
                'siparisId' => Session::get('id'),
            ));
            $sepetUpdate=sepet::where("musteriNo",Session::get('id'))->update(array(
               'durum'=>1,

            ));

            return redirect('users/sepet')->withErrors(['msg' => 'Sipariş Verildi.','alert'=>'alert-danger']);


        }




        $data['title'] = "Sepet";
        return view('userPage.sepet', $data);


    }

    public function siparisler(){



        $data['products'] = Products::get();
        $data['productsmodel'] = ProductsModel::get();
        $data['productsmodelbrand'] = ProductsModelBrand::get();
        $data['order']=Order::where('kullaniciSiparisId',Session::get('id'))->first();
        $data['sepet']=sepet::where('musteriNo',Session::get('id'))->get();
        $data['orderstatus'] = OrderStatus::get();

        $data['title'] = "Siparişlerim";
        return view('userPage.userOrder', $data);
    }








}

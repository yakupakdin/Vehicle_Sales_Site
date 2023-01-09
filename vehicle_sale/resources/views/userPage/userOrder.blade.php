@extends('index')
@section('body')
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">--}}
    {{--    <!--===============================================================================================-->--}}
    {{--    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">--}}
    {{--    <!--===============================================================================================-->--}}
    {{--    <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">--}}
    <!--===============================================================================================-->
    {{--    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">--}}
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{asset('css/util.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('css/main.css')}}">
    <link href="{{asset('css/style.css')}}" rel="stylesheet">
    <!--===============================================================================================-->
    </head>
    <body class="animsition">

    <!-- Topbar Start -->
    <div class="container-fluid">

        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="{{route('users')}}" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold">Araç Satış</h1>

                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Arama Yap">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">


                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
                       style="width: 50%;float: right;">Ayarlar</a>
                    <div class="dropdown-menu rounded-0 m-0" style="right: 0px; width: 50%;">
                        <a href="{{route('users')}}" class="" style="display: block;padding: 0.25rem 1.5rem;
                            clear: both; font-weight: 400; color: #212529; text-align: inherit;
                            white-space: nowrap;background-color: transparent; border: 0;">Anasayfa</a>
                        <a href="{{route('usersDetail')}}" class="" style="display: block;padding: 0.25rem 1.5rem;
                            clear: both; font-weight: 400; color: #212529; text-align: inherit;
                            white-space: nowrap;background-color: transparent; border: 0;">Profil Bilgileri</a>
                        <a href="{{route('siparisler')}}" class="" style="display: block;padding: 0.25rem 1.5rem;
                            clear: both; font-weight: 400; color: #212529; text-align: inherit;
                            white-space: nowrap;background-color: transparent; border: 0;">Siparişler</a>
                        <a href="{{route('logout')}}" class="" style="display: block;padding: 0.25rem 1.5rem;
                            clear: both; font-weight: 400; color: #8b3a3a; text-align: inherit;
                            white-space: nowrap;background-color: transparent; border: 0;">Çıkış Yap</a>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- Topbar End -->

    <!-- Shoping Cart -->
    <div>

    </div>
    <form class="bg0 p-t-75 p-b-85">
        <div class="">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1" style="text-align: center">İSİM</th>
                                    <th class="column-2" style="text-align: center">ADET</th>
                                    <th class="column-3" style="text-align: center">FİYAT</th>
                                    <th class="column-4" style="text-align: center">AÇIKLAMA</th>
                                    <th class="column-5" style="text-align: center">Sipariş Durumu</th>
                                    {{--                                <th class="column-5" style="text-align: center">Total</th>--}}
                                </tr>
                                @if($order)
                                @foreach($sepet as $items)
                                    @php
                                        $sorgu2=\App\Models\Products::where("id",$items['urunKodu'])->first();
                                        $siparisDurum=\App\Models\OrderStatus::where("id",$order['siparisDurum'])->first();

                                    @endphp
                                    <tr class="table_row " style="text-align: center;">
                                        <td class="column-1">

                                            <img src="{{asset($sorgu2['resimUrl'])}}" alt="IMG" width="150px">

                                        </td>
                                        <td class="column-2">{{$items['adet']}}</td>
                                        <td class="column-3">{{$sorgu2['fiyat']}} ₺</td>
                                        <td class="column-4" style="text-align: center">{{$sorgu2['aciklama']}}</td>
                                        <td class="column-5" style="text-align: center">{{$siparisDurum['aciklama']}}</td>
                                    </tr>

                                @endforeach
                                @endif
                            </table>
                        </div>

                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                            <div class="flex-w flex-m m-r-20 m-tb-5">


                            </div>


                        </div>
                    </div>
                </div>


            </div>
        </div>
    </form>


    <!-- Footer -->
    <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold">Araç Satış</h1>
                </a>
                <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum
                    dolore amet erat.</p>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our
                                Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop
                                Detail</a>
                            <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping
                                Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact
                                Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our
                                Shop</a>
                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop
                                Detail</a>
                            <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping
                                Cart</a>
                            <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                            <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact
                                Us</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                        <form action="">
                            <div class="form-group">
                                <input type="text" class="form-control border-0 py-4" placeholder="Your Name"
                                       required="required"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                       required="required"/>
                            </div>
                            <div>
                                <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved.
                    Designed
                    by
                    <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                    Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="{{asset('lib/easing/easing.min.js')}}"></script>
    <script src="{{asset('lib/owlcarousel/owl.carousel.min.js')}}"></script>

    <!-- Contact Javascript File -->
    <script src="{{asset('mail/jqBootstrapValidation.min.js')}}"></script>
    <script src="{{asset('mail/contact.js')}}"></script>

    <!-- Template Javascript -->
    <script src="{{asset('js/main.js')}}"></script>
    <!--===============================================================================================-->
    <script src="{{asset('js/mainsepet.js')}}"></script>
@endsection




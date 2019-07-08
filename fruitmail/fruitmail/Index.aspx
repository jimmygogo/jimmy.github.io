<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <!-- End header-->
      <div class="slider">
        <div class="full-fluid">
          <div class="slider_wrapper">
            <div class="slider-block" style="background-image: url('assets/images/homepage01/slider_background_1.png')">
              <div class="slider-content">
                <div class="container">
                  <div class="row align-items-center justify-content-center">
                    <div class="col-12 col-md-5 col-xl-6">
                      <div class="slider-text d-flex flex-column align-items-center align-items-md-start">
                        <h5 data-animation="fadeInUp" data-delay=".2s">Freash Fruit</h5>
                        <h1 data-animation="fadeInUp" data-delay=".3s">时令水果</h1>
                        <h3 data-animation="fadeInUp" data-delay=".4s">大减价<span>/超低价格</span></h3><a class="normal-btn" href="Shop.aspx" data-animation="fadeInUp" data-delay=".4s">现在购买</a>
                      </div>
                    </div>
                    <div class="col-12 col-md-6">
                      <div class="slider-img" data-animation="zoomIn" data-delay=".1s"><img src="assets/images/homepage01/slider_subbackground_1.png" alt="">
                        <div class="prallax-img">
                          <div id="img-block"><img class="img" src="assets/images/homepage01/slider_img_1.png" alt="" data-depth="1"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="slider-block" style="background-image: url('assets/images/homepage01/slider_background_2.jpg')">
              <div class="slider-content"> 
                <div class="container">
                  <div class="row align-items-center justify-content-center">
                    <div class="col-12 col-md-5 col-xl-6">
                      <div class="slider-text d-flex flex-column align-items-center align-items-md-start">
                        <h5 data-animation="fadeInUp" data-delay=".2s">Freash Fruit</h5>
                        <h1 data-animation="fadeInUp" data-delay=".3s">蜜橙</h1>
                        <h3 data-animation="fadeInUp" data-delay=".4s">￥14.00<span>/ kg</span></h3><a class="normal-btn" href="Shop.aspx" data-animation="fadeInUp" data-delay=".4s">现在购买</a>
                      </div>
                    </div>
                    <div class="col-12 col-md-6">
                      <div class="slider-img" data-animation="zoomIn" data-delay=".1s"><img src="assets/images/homepage01/slider_subbackground_1.png" alt=""><img class="img" src="assets/images/homepage01/slider_img_2.png" alt=""></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
         
        </div>
      </div>
      
      <!-- End items-category-->
      <div class="deal-of-week">
          <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 text-center">
                    <h1>产品特色</h1>
                  </div>
              <div class="col-10 col-md-6 col-lg-4 order-3 order-md-2 order-lg-2">
                <div class="row">
                  <div class="col-12">
                    <div class="featured-use text-md-right">
                      <div class="featured-use_intro order-2 order-md-1">
                        <h5>健康</h5>
                        <p>自家生产，无农药残留，十分健康。</p>
                      </div>
                      <div class="featured-use_icon text-md-right order-1 order-md-2 featured-use_icon-left">
                        <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_1.png" alt=""></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="featured-use text-md-right">
                      <div class="featured-use_intro order-2 order-md-1">
                        <h5>品牌</h5>
                        <p>引进国内外知名品牌，是地理保护产品，品正价美。</p>
                      </div>
                      <div class="featured-use_icon text-md-right order-1 order-md-2 featured-use_icon-left">
                        <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_2.png" alt=""></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-12 col-lg-4 order-2 order-md-4 order-lg-3 text-center">
                <div class="week-product_img"><img class="img-fluid" src="assets/images/homepage01/deal-of-week.png" alt="">
                </div>
              </div>
              <div class="col-10 col-md-6 col-lg-4 order-4 order-md-3 order-lg-4">
                <div class="row">
                  <div class="col-12">
                    <div class="featured-use">
                      <div class="featured-use_intro order-2">
                        <h5>新鲜</h5>
                        <p>每日采摘，即时售卖，为您带来最新鲜的口感。</p>
                      </div>
                      <div class="featured-use_icon order-1 ml-0">
                        <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_3.png" alt=""></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="featured-use">
                      <div class="featured-use_intro order-2">
                        <h5>时尚</h5>
                        <p>甄选时令水果，同时提供当下最时尚的水果购物体验。</p>
                      </div>
                      <div class="featured-use_icon order-1 ml-0">
                        <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_4.png" alt=""></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             
            </div>
          </div>
        </div>
      <!-- End feature-products-->
      
      <div class="deal-of-week">
        <div class="container">
          <div class="row justify-content-center">
           <div class="col-12 text-center">
              <br>
              <h1>本周特价</h1>
            </div>

           
            <div class="col-12 text-center order-5">

                <div class="banner"> 
                    <div class="full-fluid">
                      <div class="banner-block">
                        <div class="row no-gutters">
                          <div class="col-12 col-lg-3">
                            <div class="banner-block_detail" style="background-image: url('assets/images/homepage01/banner_1.png')"><img src="assets/images/homepage01/banner_img_1.png" alt=""><a class="banner-btn normal-btn" href="Shop.aspx">现在购买</a></div>
                          </div>
                          <div class="col-12 col-lg-6">
                            <div class="banner-block_detail" style="background-image: url('assets/images/homepage01/banner_2.png')"><img src="assets/images/homepage01/banner_img_2.png" alt=""><a class="banner-btn normal-btn" href="Shop.aspx">现在购买</a></div>
                          </div>
                          <div class="col-12 col-lg-3">
                            <div class="banner-block_detail" style="background-image: url('assets/images/homepage01/banner_3.png')"><img src="assets/images/homepage01/banner_img_3.png" alt=""><a class="banner-btn normal-btn" href="Shop.aspx">现在购买</a></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- End banner	-->

              <div class="d-flex justify-content-center" id="event-countdown"></div>
            </div>
          </div>
        </div>
      </div>
      <!-- End deak of the week-->
      <footer>
        <div class="container">
          <div class="row">
           
            <div class="col-md-8">
              <div class="row">

              </div>
            </div>
          </div>
        </div>
        <div class="newletter">
          <div class="container">
            <div class="row justify-content-between align-items-center">
              <div class="col-12 col-md-7">
                <div class="newletter_text text-center text-md-left">
                  <h5>赶快来购买你心仪的水果吧</h5>
                  <p></p>
                </div>
              </div>
              <div class="col-12 col-md-5">
                <div class="newletter_input">
                  <input class="round-input" type="text" placeholder="">
                  <button>搜索</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer-credit">
          <div class="container">
            <div class="footer-creadit_block d-flex flex-column flex-md-row justify-content-start justify-content-md-between align-items-baseline align-items-md-center">
              <p class="author">Copyright © 2019 LJM-17145116 </p><img class="payment-method" src="assets/images/payment.png" alt="">
            </div>
          </div>
        </div>
      </footer>
      <!-- End footer-->
   
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/jquery.easing.js"></script>
    <script src="assets/js/jquery.scrollUp.min.js"></script>
    <script src="assets/js/jquery.zoom.min.js"></script>
    <script src="assets/js/parallax.js"></script>
    <script src="assets/js/jquery.fancybox.js"></script>
    <script src="assets/js/numscroller-1.0.js"></script>
    <script src="assets/js/vanilla-tilt.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        $(document).ready(function () {
            var sence = document.getElementById('img-block')
            var parallaxInstance = new Parallax(sence, {
                hoverOnly: true,
            });

            $(".menu-item").removeClass("active");
            $(".menu-item").eq(0).addClass("active");
        })
    </script>
</asp:Content>


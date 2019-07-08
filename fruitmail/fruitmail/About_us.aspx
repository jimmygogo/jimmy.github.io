<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About_us.aspx.cs" Inherits="About_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>
        $(document).ready(function () {

            $(".menu-item").removeClass("active");
            $(".menu-item").eq(3).addClass("active");
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link active" href="#">关于我们</a></li>
          </ul>
        </div>
      </div>
      <!-- End breadcrumb-->
      <div class="about-us">
        <div class="container">
          <div class="our-story">
            <div class="row">
              <div class="col-12 col-md-6">
                <div class="our-story_text">
                  <h1 class="title green-underline">公司简介</h1>
                  <p>绍兴市小林水果发展有限公司是国内较大的集果品生产、贸易、少售为一体的企业之一。近十年不仅开发了32个水果基地遍及国内和东南亚各地，而且还造就了一支专职的水果生产与销售的经营管理团队。</p>
                  <p>绍兴市小林水果发展有限公司于2009年2月10日成立，开始创办绍兴水果专卖店，产生了良好的经济效益与社会效益，影响和带动了深圳水果少售业的发展，成为21世纪初的营收亮点、水果专卖连锁的营销典范。</p>
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="our-story_video"><img src="assets/images/homepage05/weel_deal_img.png" alt="play video"><a class="play-btn" href="https://v.qq.com/x/page/c0164d1ddbo.html" target="_blank"><i class="fas fa-play"></i></a></div>
              </div>
            </div>
          </div>
          <div class="our-number">
            <div class="row">
              <div class="col-md-4">
                <div class="our-number_block">
                  <div class="our-number_icon"><img src="assets/images/pages/about_us_icon_1.png" alt="icon"></div>
                  <div class="our-number_info">
                    <h1 class="nummber-increase"><span class="numscroller" data-min="1" data-max="100" data-delay="5" data-increment="10">100</span>%</h1>
                    <p>用户喜爱率</p>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="our-number_block">
                  <div class="our-number_icon"><img src="assets/images/pages/about_us_icon_2.png" alt="icon"></div>
                  <div class="our-number_info">
                    <h1 class="nummber-increase"><span class="numscroller" data-min="1" data-max="142" data-delay="5" data-increment="10">142</span></h1>
                    <p>管理人员</p>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="our-number_block">
                  <div class="our-number_icon"><img src="assets/images/pages/about_us_icon_3.png" alt="icon"></div>
                  <div class="our-number_info">
                    <h1 class="nummber-increase">+<span class="numscroller" data-min="1" data-max="16" data-delay="5" data-increment="10">16</span></h1>
                    <p>供应农场</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="full-fluid">
          <div class="why-choose-us">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-sm-8 col-md-4 align-self-end">
                  <div class="wcu_img"><img src="assets/images/pages/wcu_img.png" alt="image"></div>
                </div>
                <div class="col-sm-10 col-md-8">
                  <div class="wcu-wrapper">
                    <div class="row">
                      <div class="col-12">
                        <h1 class="title green-underline">为什么选择我们</h1>
                      </div>
                      <div class="col-12">
                        <div class="row">
                          <div class="col-lg-6">
                            <div class="wcu-block">
                              <div class="wcu_icon">
                                <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_1.png" alt=""></div>
                              </div>
                              <div class="wcu_intro">
                                <h5>健康</h5>
                                <p>自家生产，无农药残留，十分健康。</p>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <div class="wcu-block">
                              <div class="wcu_icon">
                                <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_2.png" alt=""></div>
                              </div>
                              <div class="wcu_intro">
                                <h5>品牌</h5>
                                <p>引进国内外知名品牌，是地理保护产品，品正价美。</p>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <div class="wcu-block">
                              <div class="wcu_icon">
                                <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_3.png" alt=""></div>
                              </div>
                              <div class="wcu_intro">
                                <h5>新鲜</h5>
                                <p>每日采摘，即时售卖，为您带来最新鲜的口感。</p>
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-6">
                            <div class="wcu-block">
                              <div class="wcu_icon">
                                <div class="icon-detail"><img src="assets/images/homepage01/dow_icon_4.png" alt=""></div>
                              </div>
                              <div class="wcu_intro">
                                <h5>时尚</h5>
                                <p>甄选时令水果，同时提供当下最时尚的水果购物体验。</p>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="our-farmer">
            <h1 class="title green-underline">农户展示</h1>
            <div class="row">
              <div class="col-sm-6 col-lg-3">
                <div class="our-farmer-block our-farmer-block--1">
                  <div class="farmer-img"><img src="assets/images/pages/farmer_1.png" alt="farmer"></div>
                  <div class="farmer-contact_wrapper">
                    <div class="farmer-contact">
                      <h2>1号农场</h2>
                      <h5>黄鱼</h5>
                      <div class="farmer-social"><a href=""><i class="fab fa-facebook-f"> </i></a><a href=""><i class="fab fa-twitter"></i></a><a href=""><i class="fab fa-invision"> </i></a><a href=""><i class="fab fa-pinterest-p"></i></a></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="our-farmer-block our-farmer-block--2">
                  <div class="farmer-img"><img src="assets/images/pages/farmer_2.png" alt="farmer"></div>
                  <div class="farmer-contact_wrapper">
                    <div class="farmer-contact">
                      <h2>2号农场</h2>
                      <h5>小红</h5>
                      <div class="farmer-social"><a href=""><i class="fab fa-facebook-f"> </i></a><a href=""><i class="fab fa-twitter"></i></a><a href=""><i class="fab fa-invision"> </i></a><a href=""><i class="fab fa-pinterest-p"></i></a></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="our-farmer-block our-farmer-block--3">
                  <div class="farmer-img"><img src="assets/images/pages/farmer_3.png" alt="farmer"></div>
                  <div class="farmer-contact_wrapper">
                    <div class="farmer-contact">
                      <h2>8号农场</h2>
                      <h5>野蜂</h5>
                      <div class="farmer-social"><a href=""><i class="fab fa-facebook-f"> </i></a><a href=""><i class="fab fa-twitter"></i></a><a href=""><i class="fab fa-invision"> </i></a><a href=""><i class="fab fa-pinterest-p"></i></a></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-lg-3">
                <div class="our-farmer-block our-farmer-block--4">
                  <div class="farmer-img"><img src="assets/images/pages/farmer_1.png" alt="farmer"></div>
                  <div class="farmer-contact_wrapper">
                    <div class="farmer-contact">
                      <h2>12号农场</h2>
                      <h5>萧峰</h5>
                      <div class="farmer-social"><a href=""><i class="fab fa-facebook-f"> </i></a><a href=""><i class="fab fa-twitter"></i></a><a href=""><i class="fab fa-invision"> </i></a><a href=""><i class="fab fa-pinterest-p"></i></a></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End about us-->

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
</asp:Content>


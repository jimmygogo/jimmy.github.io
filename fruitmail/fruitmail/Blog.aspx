<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <script>
        $(document).ready(function () {

            $(".menu-item").removeClass("active");
            $(".menu-item").eq(2).addClass("active");
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link active" href="#">资讯</a></li>
          </ul>
        </div>
      </div>
      <!-- End breadcrumb-->
      <div class="blog-layout">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="blog-masonry">
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_1.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">健康</h5><a class="blog-title" href="blog_detail_sidebar.html">哪些水果能让人更加快乐？</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年06月10日</p>
                      <p class="credit comment">3 喜欢</p>
                    </div>
                  </div>
                </div>
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_4.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">健康</h5><a class="blog-title" href="blog_detail_sidebar.html">这两种水果对于精神病患者大脑有治疗效果！</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年04月19日</p>
                      <p class="credit comment">30 喜欢</p>
                    </div>
                  </div>
                </div>
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_2.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">健康</h5><a class="blog-title" href="blog_detail_sidebar.html">哪种水果和鸡蛋一起吃会有奇效？</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年05月19日</p>
                      <p class="credit comment">36 喜欢</p>
                    </div>
                  </div>
                </div>
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_5.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">新闻</h5><a class="blog-title" href="blog_detail_sidebar.html">又可以水果自由了？这些水果降价一半！</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年06月18日</p>
                      <p class="credit comment">45 喜欢</p>
                    </div>
                  </div>
                </div>
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_3.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">分享</h5><a class="blog-title" href="blog_detail_sidebar.html">新鲜水果的搬运工，好果汁自己会说话！</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年06月02日</p>
                      <p class="credit comment">3 喜欢</p>
                    </div>
                  </div>
                </div>
                <div class="blog-block">
                  <div class="blog-img"><a href="blog_detail_sidebar.html"><img src="assets/images/blog/masonry_img_6.png" alt="blog image"></a></div>
                  <div class="blog-text">
                    <h5 class="blog-tag">新闻</h5><a class="blog-title" href="blog_detail_sidebar.html">央视大调查！水果价暴涨的背后，钱究竟进了谁的腰包？</a>
                    <div class="blog-credit">
                      <p class="credit date">2019年05月15日</p>
                      <p class="credit comment">30 喜欢</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="blog-loadmore">
                <button class="normal-btn"><i class="fas fa-spinner fa-spin"></i>Load more</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End blog layout-->

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


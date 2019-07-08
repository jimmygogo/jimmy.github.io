<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link" href="shop_grid+list_3col.html">商城</a></li>
            <li> <a class="breadcrumb-link active" href="shop_detail.html">详情页面</a></li>
          </ul>
        </div>
      </div>
      <!-- End breadcrumb-->
      <div class="shop-layout">
        <div class="container">
          <div class="row">
            <div class="col-xl-3">
              <div class="shop-sidebar">
                <button class="no-round-btn" id="filter-sidebar--closebtn">关闭分类</button>
                <div class="shop-sidebar_department">
                  <div class="department_top mini-tab-title underline">
                    <h2 class="title">品种分类</h2>
                  </div>
                  <div class="department_bottom">
                    <ul>
                      <asp:Repeater ID="RptLi" runat="server">
                        <ItemTemplate>
                      <li><a class="department-link"  data-idx="<%#Eval("Id")%>" href="#"> <%#Eval("Name")%> </a></li>
                    </ItemTemplate>
              </asp:Repeater>
                    </ul>
                  </div>
                </div>
               
                <div class="shop-sidebar_color-filter">
                  <div class="color-filter_top mini-tab-title underline">
                    <h2 class="title">颜色分类</h2>
                  </div>
                  <div class="color-filter_bottom">
                    <div class="row">
                      <div class="col-6">
                        <div class="color">
                          <div class="visible-color" style="background-color: red;"></div><a id="red" >红色<span><asp:Label ID="RedNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                        <div class="color">
                          <div class="visible-color" style="background-color: orange;"></div><a id="yellow" >橙色<span><asp:Label ID="YellowNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="color">
                          <div class="visible-color" style="background-color: blue;"></div><a id="blue" >蓝色<span><asp:Label ID="BlueNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                        <div class="color">
                          <div class="visible-color" style="background-color: green;"></div><a id="green" >绿色<span><asp:Label ID="GreenNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="shop-sidebar_tag">
                  <div class="tag_top mini-tab-title underline">
                    <h2 class="title">标签分类</h2>
                  </div>
                  <div class="tag_bottom"><a class="tag-btn" href="shop_grid+list_3col.html">多汁</a><a class="tag-btn" href="shop_grid+list_3col.html">时令</a><a class="tag-btn" href="shop_grid+list_3col.html">新鲜</a><a class="tag-btn" href="shop_grid+list_3col.html">进口</a><a class="tag-btn" href="shop_grid+list_3col.html">干货</a><a class="tag-btn" href="shop_grid+list_3col.html">国产</a><a class="tag-btn" href="shop_grid+list_3col.html">香甜</a></div>
                </div>
              </div>
              <div class="filter-sidebar--background" style="display: none"></div>
            </div>
            <div class="col-xl-9">
              <div class="shop-detail">
                <div class="row">
                  <div class="col-12"> 
                    <div id="show-filter-sidebar">
                      <h5> <i class="fas fa-bars"></i>分类</h5>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="shop-detail_img">
                      <button class="round-icon-btn" id="zoom-btn"> <i class="icon_zoom-in_alt"></i></button>
                      <div class="big-img">
                        <div class="big-img_block"><asp:Image ID="imgFruit1" runat="server" /></div>
                      </div>
                      <div class="slide-img">
                        <div class="slide-img_block"><asp:Image ID="imgFruit2" runat="server" /></div>
                      </div>
                    </div>
                    <div class="img_control"></div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="shop-detail_info">
                      <h5 class="product-type color-type">
                          <asp:Literal ID="family" runat="server"></asp:Literal>
                      </h5>
                      <h2 class="product-name">
                          <asp:Literal ID="name" runat="server"></asp:Literal>
                      </h2>
                      <p class="product-describe">
                          <asp:Literal ID="description" runat="server"></asp:Literal>
                      </p>
                      <p class="delivery-status">免运费</p>
                      <div class="price-rate">
                        <h3 class="product-price"> 
                          <del>￥35.00</del>￥<asp:Literal ID="price" runat="server"></asp:Literal>
                        </h3>
                        <h5 class="product-rated"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star-half"></i><span>(15)</span></h5>
                      </div>
                      
                      <div class="quantity-select">
                        <label for="quantity">数量（kg）:</label>
                        <input class="no-round-input" id="quantity" type="number" min="0" value="1">
                      </div>
                      <div class="product-select">
                        <button class="add-to-cart normal-btn outline">加入购物车</button>
                        <button class="add-to-compare normal-btn outline">加入收藏</button>
                      </div>
                      <div class="product-share">
                        <h5>分享:</h5><a href=""><i class="fab fa-qq"></i></a><a href=""><i class="fab fa-alipay"></i></a><a href=""><i class="fas fa-at"></i></a><a href=""><i class="fab fa-weixin"></i></a>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End shop layout-->
     
      <!-- End partner-->
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
            //type
             $('.department-link').click(function () {
                  window.location.href = "Shop.aspx?type=" + $(this).attr("data-idx")+ "&page=1";
             })
             //AddCart
             $(".add-to-cart").click(function () {
                
                $.ajax({
                    type:"get",
                    url: "handlers/AddToCart.ashx",
                    data: {
                        id: "<%=Id%>",
                    quantity:$("#quantity").val()
                    },
                    success: function (result) {
                        $(".icon_bag_alt span").eq(1).text(parseInt($(".icon_bag_alt span").eq(1).text())+parseInt($("#quantity").val()));
                    }
                 });
             });

             //AddLikeCart
             $(".add-to-compare").click(function () {
                $.ajax({
                    type:"get",
                    url: "handlers/AddToLikeCart.ashx",
                    data: {
                        id: "<%=Id%>"
                    },
                    success: function (result) {
                    }
                 });
             });

            })
    </script>
</asp:Content>


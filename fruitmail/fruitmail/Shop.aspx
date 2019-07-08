<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="Index.aspx"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link active" href="Shop.aspx">商城</a></li>
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
                          <div class="visible-color" style="background-color: red;"></div><a id="red" href="#">红色<span><asp:Label ID="RedNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                        <div class="color">
                          <div class="visible-color" style="background-color: orange;"></div><a id="yellow" href="#">橙色<span><asp:Label ID="YellowNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="color">
                          <div class="visible-color" style="background-color: blue;"></div><a id="blue" href="#">蓝色<span><asp:Label ID="BlueNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                        <div class="color">
                          <div class="visible-color" style="background-color: green;"></div><a id="green" href="#">绿色<span><asp:Label ID="GreenNum" runat="server" Text="Label"></asp:Label></span></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="shop-sidebar_tag">
                  <div class="tag_top mini-tab-title underline">
                    <h2 class="title">标签分类</h2>
                  </div>
                  <div class="tag_bottom">
                      <asp:Repeater ID="rpttagLi" runat="server">
                        <ItemTemplate>
                       <a class="tag-btn" data-idx="<%#Eval("Name")%>"  href="#"><%#Eval("Name")%></a>
                    </ItemTemplate>
              </asp:Repeater>
                    </div>
                </div>
              </div>
              <div class="filter-sidebar--background" style="display: none"></div>
            </div>
            <div class="col-xl-9">
              <div class="shop-grid-list">
                <div class="shop-products">
                  <div class="shop-products_top mini-tab-title underline">
                    <div class="row align-items-center">
                      <div class="col-6 col-xl-4">
                        <h2 class="title">水果列表</h2>
                      </div>
                      <div class="col-6 text-right">
                        <div id="show-filter-sidebar">
                          <h5> <i class="fas fa-bars"></i>分类</h5>
                        </div>
                      </div>
                      <div class="col-12 col-xl-8">
                        <div class="product-option">
                          <div class="product-filter" >
                            <select class="select-form" id="sort" name="" style="display:none;">
                              <option value="好评度">好评度</option>
                              <option value="价格">价格</option>
                              <option value="销量">销量</option>
                              
                            </select>
                            <select class="select-form" id="sort" name="" style="display:none;">
                              <option value="A-Z">展示 9</option>
                              <option value="Z-A">展示 20</option>
                              <option value="High to low price">展示 30</option>
                            </select>
                          </div>
                          <div class="view-method">
                            <p class="active" id="grid-view"><i class="fas fa-th-large"></i></p>
                            <p id="list-view"><i class="fas fa-list"></i></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--Using column-->
                  </div>
                  <div class="shop-products_bottom">
                    <div class="row no-gutters-sm">

<asp:Repeater ID="rptFruits" runat="server">
    <ItemTemplate>
                      <div class="col-6 col-md-4">
                        <div class="product">
                          <div class="product-img_block"><a class="product-img" ><img src="<%# Eval("photo") %>" alt=""></a>
                            <%--<button class="quickview no-round-btn smooth">Quick view</button>--%>
                          </div>
                          <div class="product-info_block">
                              <p class="f-id" style="display:none;"><%# Eval("Id") %></p>
                            <h5 class="product-type"><%# Eval("family") %></h5><a class="product-name" href="Shop.aspx"><%# Eval("title") %></a>
                            <h3 class="product-price">￥<%# Eval("price") %>
                              <del>￥35.00</del>
                            </h3>
                            <h5 class="product-rated"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star-half"></i><span>(5)</span></h5>
                            <p class="product-describe"><%# Eval("description") %></p>
                            <h5 class="product-avaiable">余货：<span><%# Eval("Stock") %></span></h5>
                            <button class="add-to-wishlist button-borderless"><i class="icon_heart_alt"></i></button>
                          </div>
                          <div class="product-select">
                            <button class="add-to-wishlist round-icon-btn"> <i class="icon_heart_alt"></i></button>
                            <button class="add-to-cart round-icon-btn"><i class="fas fa-cart-plus"></i></button>                           
                            <button class="quickview round-icon-btn"> <i class="far fa-eye"></i></button>
                          </div>
                          <div class="product-select_list">
                            <p class="delivery-status">免运费</p>
                            <h3 class="product-price"> 
                              <del>￥35.00</del>￥<%# Eval("price") %>
                            </h3>
                            <button class="add-to-cart normal-btn outline">加入购物车</button>
                            <button class="add-to-compare normal-btn outline">添加收藏</button>
                          </div>
                        </div>
                      </div>
                     </ItemTemplate>

</asp:Repeater>
                    </div>
                  </div>
                  <div class="shop-pagination">
                    <ul>
                        <asp:Repeater ID="rptPages" runat="server">
                            <ItemTemplate>
                                <li >
                                    <a title="<%#Eval("pageNum") %>" class="<%#Eval("className") %>"><%#Eval("pageNum") %></a>           
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                      <%--<li>
                        <button class="no-round-btn smooth active">1</button>
                      </li>
                      <li>
                        <button class="no-round-btn smooth">2</button>
                      </li>
                      <li>
                        <button class="no-round-btn smooth">3</button>
                      </li>--%>
                      <li>
                        <a class="no-round-btn smooth"> <i class="arrow_carrot-2right"></i></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End shop layout-->
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
            ////Login
            //if ($(".router-link-exact-active")[1].innerText != "未登录")
            //   $(".router-link-exact-active").attr("href","/Index.aspx"); 

             //Detail
             $(".product img").click(function () {
                 
                window.location.href = "Detail.aspx?id=" + $(this).find(".f-id").text();
            })
             $(".product").click(function () {
                window.location.href = "Detail.aspx?id=" + $(this).find(".f-id").text();
            })
            $(".product-select_list").click(function () {
                window.location.href = "Detail.aspx?id=" + $(this).parent().find(".f-id").text();
            })
           
            //page
             $('.smooth').click(function () {
                    window.location.href = "Shop.aspx?type=" + "&page=" + $(this).attr("title");
            })
            //type
             $('.department-link').click(function () {
                  window.location.href = "Shop.aspx?type=" + $(this).attr("data-idx")+ "&page=1";
             })
             //color
            $(".color a").click(function () {
                   window.location.href = "Shop.aspx?color=" + $(this).attr("id")+ "&page=1";
            })
            //tag
            $(".tag-btn").click(function () {
                   window.location.href = "Shop.aspx?tag=" + $(this).attr("data-idx")+ "&page=1";
            })
            //search
            $(".search-btn").click(function () {
                   window.location.href = "Shop.aspx?search=" + $(".no-round-input").val()+ "&page=1";
            })

            })
    </script>
</asp:Content>


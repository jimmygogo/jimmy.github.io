<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Like.aspx.cs" Inherits="Like" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link" href="index.html">商城</a></li>
            <li> <a class="breadcrumb-link active" href="index.html">收藏</a></li>
          </ul>
        </div>
      </div>
      <!-- End breadcrumb-->
      <div class="shop-compare">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="compre-table">
                <table class="table table-responsive"> 
                  <colgroup>
                    <col span="1" style="width: 25%">
                    <col span="1" style="width: 25%">
                    <col span="1" style="width: 25%">
                    <col span="1" style="width: 25%">
                  </colgroup>
                  <tbody>
                    <tr>
                      <th scope="row">商品</th>
        <asp:Repeater ID="rptproduct" runat="server">
            <ItemTemplate>
                <td> 
                        <div class="product-items">
                          <div class="product-img"><img src="assets/images/product/<%#Eval("Pic")%>" alt="product image"></div>
                          <h5 class="product-type color-type"><%# Eval("Family") %></h5>
                          <h2 class="product-name"><%#Eval("Name")%></h2>
                        </div>
                      </td>
            </ItemTemplate>
        </asp:Repeater>

                    </tr>
                   
                    <tr>
                      <th scope="row">价格</th>
                        <asp:Repeater ID="rptprice" runat="server">
            <ItemTemplate>
                      <td class="product-price">￥<%# Eval("Price") %></td>
                        </ItemTemplate>
        </asp:Repeater>
                    </tr>
                   
                    <tr>
                      <th scope="row">余货数量</th>
                         <asp:Repeater ID="rptstock" runat="server">
            <ItemTemplate>
                      <td class="product-availability"><%# Eval("Stock") %></td>
                        </ItemTemplate>
        </asp:Repeater>
                    </tr>
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End shopping cart-->
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
    <script></script>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
              <!-- End header-->
          <div class="ogami-breadcrumb">
              <div class="container">
                  <ul>
                      <li> <a class="breadcrumb-link" href="Index.aspx"> <i class="fas fa-home"></i>首页</a></li>
                      <li> <a class="breadcrumb-link" href="Shop.aspx">商城</a></li>
                      <li> <a class="breadcrumb-link active" href="Cart.aspx">购物车</a></li>
                  </ul>
              </div>
          </div>
          <!-- End breadcrumb-->
          <div class="order-step">
              <div class="container">
                  <div class="row">
                      <div class="col-12">
                          <div class="order-step_block">
                              <div class="row no-gutters">
                                  <div class="col-12 col-md-4">
                                      <div class="step-block step-block--1">
                                          <div class="step">
                                              <h2>选择商品</h2><span>01</span>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-12 col-md-4">
                                      <div class="step-block active">
                                          <div class="step">
                                              <h2>结算订单</h2><span>02</span>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-12 col-md-4">
                                      <div class="step-block">
                                          <div class="step">
                                              <h2>完成购物</h2><span>03</span>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- End order step-->
          <div class="shop-checkout">
              <div class="container">
                 <%-- <form action="" method="post">--%>
                      <div class="row">
                          <div class="col-12 col-lg-8">
                              <h2 class="form-title">信息填写</h2>
                              <div class="form-row">
                                  <div class="form-group col-md-6">
                                      <label for="inputFirstName">真实姓名*</label>
                                      <input class="no-round-input-bg" id="inputFirstName" type="text" value="<%#Eval("Name")%>" required>
                                  </div>
                                  
                              </div>
                              <div class="form-group">
                                  <label for="inputStreet">地址选择*</label>
                                  <select class="no-round-input-bg" id="inputContry">
                                      <asp:Repeater ID="rptAddress" runat="server"><ItemTemplate>
                                      <option value="1"><%#Eval("Addr")%></option>                                     
                                       </ItemTemplate> </asp:Repeater>
                                  </select>
                              </div>

                              <div class="form-group">
                                  <label for="inputPhone">手机号*</label>
                                  <select class="no-round-input-bg" id="inputContry">
                                  <asp:Repeater ID="rptPhone" runat="server"><ItemTemplate>
                                      <option value="1"><%#Eval("Phone")%></option>                                     
                                       </ItemTemplate> </asp:Repeater>
                                      </select>
                              </div>
                              <div class="form-group">
                                  <label for="inputCountry">支付方式*</label>
                                  <select class="no-round-input-bg" id="inputContry">
                                      <option value="1">支付宝</option>
                                      <option value="2">微信</option>
                                      <option value="3">银联</option>
                                      <option value="4">其他</option>
                                  </select>
                              </div>

                              <div class="form-group">
                                  <label for="inputNote">备注</label>
                                  <textarea class="textarea-form-bg" id="inputNote" name="" cols="30" rows="7"></textarea>
                              </div>
                          </div>
                          <div class="col-12 col-md-6 col-lg-4">
                              <h2 class="form-title">订单详情
                                 
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=sho.usxjsj.cn;Persist Security Info=True;User ID=u17145116;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orderDetails]"></asp:SqlDataSource>
                              </h2>
                              <div class="shopping-cart">
                                  <div class="cart-total_block">
                                      <table class="table">
                                          <colgroup>
                                              <col span="1" style="width: 50%">
                                              <col span="1" style="width: 50%">
                                          </colgroup>
                                          <tbody>
                                              <asp:Repeater ID="rptCartList" runat="server">
                                                  <ItemTemplate>
                                              <tr>
                                                  <th class="name"><%#Eval("Name")%> × <span><%#Eval("Quantity")%></span></th>
                                                  <td class="price black" style="border-top: 0">￥<%#Eval("Price")%></td>
                                                  <span class="Sum" style="display:none"><%#Eval("Total")%></span>
                                              </tr>
                                              </ItemTemplate> 
                    </asp:Repeater>
                                              <tr>
                                                  <th>余额</th>
                                                  <td>￥<asp:Label ID="money" runat="server" Text="Label"></asp:Label></td>
                                              </tr>
                                              <tr>
                                                  <th>合计</th>
                                                  <td class="total">￥0</td>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </div>
                                   <a href="Complete.aspx" class="normal-btn submit-btn cart-total_block cartover" style="text-align:center;">确认下单</a>
                              </div>
                          </div>
                      </div>
                 <%-- </form>--%>
              </div>
          </div>
          
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
            //扣多少钱  
            var sum = 0;
            for (var i = 0; i < $('.table tr').length - 2; i++) {
                var a = parseInt($('.Sum')[i].innerText);
                sum += a;
            }
            $('.total')[0].innerText = "¥" + sum;

             $(".cartover").click(function () {
                
                $.ajax({
                    type: "get",
                    url: "handlers/CartOver.ashx",
                    data: {
                    },
                    success: function (result) {
                      window.location.href = "Complete.aspx";
                    }
                }) 
            })
        })
    </script>
</asp:Content>


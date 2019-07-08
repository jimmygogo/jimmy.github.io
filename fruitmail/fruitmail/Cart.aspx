<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.shopping-cart .cart-total_block .checkout-method span{
    font-family: "Cera Pro Regular";
    font-size: 16px;
    color: white;
    line-height: 1;
    display: block;
    margin-bottom: 20px;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
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
                    <div class="step-block active">
                      <div class="step">
                        <h2>选择商品</h2><span>01</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-md-4">
                    <div class="step-block">
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
      <div class="shopping-cart">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="product-table">
                <table class="table table-responsive"> 
                  <colgroup>
                    <col span="1" style="width: 15%">
                    <col span="1" style="width: 30%">
                    <col span="1" style="width: 15%">
                    <col span="1" style="width: 15%">
                    <col span="1" style="width: 15%">
                    <col span="1" style="width: 10%">
                  </colgroup>
                  <thead>
                    <tr>
                      <th class="product-iamge" scope="col">商品图片</th>
                      <th class="product-name" scope="col">商品名称</th>
                      <th class="product-price" scope="col">商品价格</th>
                      <th class="product-quantity" scope="col">商品数量</th>
                      <th class="product-total" scope="col">合计</th>
                      <th class="product-clear" scope="col"> 
                        
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                      <asp:Repeater ID="rptShoppingCart" runat="server">
                    <ItemTemplate>
                    <tr class="cartItem" data-petid=<%#Eval("Id")%>>
                      <td class="product-iamge"> 
                        <div class="img-wrapper"><img src="<%#Eval("Pic")%>" alt="product image"></div>
                      </td>
                      <td class="product-name"><%#Eval("Name")%></td>
                      <td class="product-price">￥<span><%#Eval("Price")%></span></td>
                      <td class="product-quantity"> 
                        <input class="quantity no-round-input" type="number" min="1" value="<%#Eval("Quantity")%>">
                      </td>
                      <td class="product-total">￥<%#Eval("Total")%></td>
                      <td class="product-clear"> 
                        <button class="no-round-btn"><i class="icon_close"></i></button>
                      </td>
                    </tr>
                    </ItemTemplate>

                </asp:Repeater>
                  </tbody>
                </table>
              </div>
            </div>
           
          </div>
         <div class="row justify-content-end">
            <div class="col-12 col-md-6 col-lg-4">
              <div class="cart-total_block">
                <div class="checkout-method">
                  <%--<a href="#" class="normal-btn">立即下单</a>--%>
                    <button type="button" class="normal-btn ivu-btn-warning">
                    <span class="postinfor">立即下单</span>
                </button>
                  <!-- <span></span><a href="shop_checkout.html">Check out with PayPal</a> -->
                </div>
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
    <script>
        $(document).ready(function () {
            spanchange();

            $(".product-clear .no-round-btn").click(function () {
                
                 var id = $("tr.cartItem").attr("data-petid");//商品id
                $(this).parent().parent().remove();//移除商品
                $.ajax({
                    type: "get",
                    url: "handlers/RemoveCart.ashx",
                    data: {
                        id: id,
                    },
                    success: function () {
                    }
                })
                spanchange();
            })


            //右上角购物车变数字
            function spanchange() {
                tr = $(".table-responsive tbody tr");
            var sum = 0;
            for (var i = 0; i < tr.length; i++) {
                var a = parseInt($(".quantity").eq(i).val());
                sum += a;
            }
            $("#cart span").eq(1).text(sum);
            }
            //商品数量变化
            $(".quantity").change(function () {
                var x = this;
                var now =parseInt($(this).val());

                var id = $(this).parent().parent("tr.cartItem").attr("data-petid");
                $.ajax({
                    type: "get",
                    url: "handlers/ChangeCart.ashx",
                    data: {
                        id: id,
                        quantity: now
                    },
                    success: function () {
                        $(x).parent().parent().find(".product-total").text("￥"+ now * parseInt($(".product-price span").text()) );
                        spanchange();
                    }
                })
               spanchange();
            })
            $(".normal-btn").click(function () {
                window.location.href = "PlaceOrder.aspx"; 
            })
            
            //
            $(".ivu-btn-warning").mouseenter(function () { $(".ivu-btn-warning span").css("color", "black") })
                .mouseleave(function () { $(".ivu-btn-warning span").css("color", "white") });  
            
            //下达订单
           
            $(".ivu-btn-warning").click(function () {
               
                $.ajax({
                    type: "get",
                    url: "handlers/CreateOrder.ashx",
                    data: {
                    },
                    success: function (result) {
                       if (result == "error-2")
                        { alert("订单生成失败！");}
                        //成功了移除购物车中的商品，跳转到订单页面
                       else {
                           
                           window.location.href = "PlaceOrder.aspx" + result;
                       }
                    }
                }) 
            })
            })
    </script>
</asp:Content>


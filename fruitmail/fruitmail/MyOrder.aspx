<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .btn{
    background-color: #88c74a;
    color: #fff;
    font-size: 13px;
    border-radius: 999px;
    -webkit-border-radius: 999px;
    -moz-border-radius: 999px;
    -ms-border-radius: 999px;
    -o-border-radius: 999px;
    padding: 15px 30px;
    text-transform: uppercase;
    font-family: 'Cera Pro Bold';
    border: 2px solid #88c74a;
    -webkit-transition: 0.3s ease;
    -moz-transition: 0.3s ease;
    -ms-transition: 0.3s ease;
    -o-transition: 0.3s ease;
    transition: 0.3s ease;
    display: inline-block;
}
    .mytable {
 width: 700px;
 padding: 0;
 margin: 0 auto;
}
caption {
 padding: 0 0 5px 0;
 width: 700px; 
 font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 text-align: right;
}
th {
 font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #4f6b72;
 border-right: 1px solid #C1DAD7;
 border-bottom: 1px solid #C1DAD7;
 border-top: 1px solid #C1DAD7;
 letter-spacing: 2px;
 text-transform: uppercase;
 text-align: left;
 padding: 6px 6px 6px 12px;
 background: #CAE8EA url(images/bg_header.jpg) no-repeat;
}
th.nobg {
 border-top: 0;
 border-left: 0;
 border-right: 1px solid #C1DAD7;
 background: none;
}
td {
    border-top: 1px solid #C1DAD7;
     border-left: 1px solid #C1DAD7;
 border-right: 1px solid #C1DAD7;
 border-bottom: 1px solid #C1DAD7;
 background: #fff;
 font-size:14px;
 padding: 6px 6px 6px 12px;
 color: #4f6b72;
}

td.alt {
 background: #F5FAFA;
 color: #797268;
}
th.spec {
 border-left: 1px solid #C1DAD7;
 border-top: 0;
 background: #fff url(images/bullet1.gif) no-repeat;
 font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}
th.specalt {
 border-left: 1px solid #C1DAD7;
 border-top: 0;
 background: #f5fafa url(images/bullet2.gif) no-repeat;
 font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #797268;
}
.product-table{
    margin: 0 auto;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
    -webkit-font-smoothing: antialiased;
    font-family: inherit;
    line-height: 1;
}
.balance{
    float:right;
    border:1px solid #C1DAD7;
    padding:10px;
    display:inline;
    position:absolute;
    right:100px;
    top:30px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <!-- End header-->
      <div class="ogami-breadcrumb">
        <div class="container">
          <ul>
            <li> <a class="breadcrumb-link" href="index.html"> <i class="fas fa-home"></i>首页</a></li>
            <li> <a class="breadcrumb-link" href="Shop.aspx">我的订单</a></li>
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
                        <h2>我的订单</h2><%--<span>01</span>--%>
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
                <div>
    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [orders]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId" 
            DataSourceID="SqlDataSource1">            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        ￥
                        <asp:Label ID="totalpriceLabel" runat="server" 
                            Text='<%# Eval("totalprice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    </td>
                    <%--<td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("status") %>' />
                    </td>--%>
                                        <td>
<asp:Button ID="Button1" runat="server" Text="去付款" CommandName="btnPay" OnCommand="Button_Pay"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "未付款"?true:false %>' />
                    <asp:Button ID="Button2" runat="server" Text="确认收货" CommandName="btnReceive" OnCommand="Button_Receive"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待收货"?true:false %>' />
                    <asp:Button ID="Button3" runat="server" Text="评价" CommandName="btnComment" OnCommand="Button_Comment"
                        CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待评价"?true:false %>' />
               <asp:Label ID="Label2" runat="server" Text='<%# Eval("status") %>' Visible='<%# (Eval("status").ToString() == "未付款" || Eval("status").ToString() == "待收货" || Eval("status").ToString() == "待评价")?false:true %>' />
   </td>
                    <td>                        <a href='ShowOrderDetails.aspx?id=<%# Eval("orderId") %>'>详细</a>                    </td>
                </tr>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">
                                        订单号</th>
                                    <th runat="server">
                                        用户号</th>
                                    <th runat="server">
                                        时间</th>
                                    <th runat="server">
                                        合计</th>
                                    <th runat="server">
                                        订单状态</th>
                                    <th id="Th1" runat="server">
                                        操作</th>
                                    <th id="Th2" runat="server">
                                        查看详情</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                </table>
            </LayoutTemplate>
         
        </asp:ListView>
    
    </div>


                  </div>

                <div class="balance">
        <p>余额：￥<span class="balances"><asp:Literal ID="balance" runat="server"></asp:Literal></span></p>
                    <hr />
        <p>充值数额：</p>
        <input id="money" type="text" />
        <input class="btn" id="charge" type="button" value="点击充值" />
    </div>
            </div>
            
          </div>
        
        </div>
      </div>
      <!-- End shopping cart-->

    

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
    $("#charge").click(function () {
                var fee = $("#money").val();
                $.ajax({
                    type: "post",
                    url: "handlers/BalanceChange.ashx",
                    data: {
                        recharge: fee,
                        type: "recharge"
                    },
                    success: function (date) {
                        if (date != "Error") {
                            $(".balances").text(date);
                            alert("充值成功！");
                        }
                        else {
                            alert("充值失败！");
                        }
                    }
                })
            });
             })
    </script>
</asp:Content>


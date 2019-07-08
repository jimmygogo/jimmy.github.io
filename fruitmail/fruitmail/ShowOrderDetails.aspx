<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ShowOrderDetails.aspx.cs" Inherits="ShowOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
 .btn {
    background-color: #88c74a;
    color: #fff;
    font-size: 11px;
    border-radius: 999px;
    -webkit-border-radius: 999px;
    -moz-border-radius: 999px;
    -ms-border-radius: 999px;
    -o-border-radius: 999px;
    padding: 1px 30px;
    text-transform: uppercase;
    font-family: 'Cera Pro Bold';
    border: 2px solid #88c74a;
    -webkit-transition: 0.3s ease;
    -moz-transition: 0.3s ease;
    -ms-transition: 0.3s ease;
    -o-transition: 0.3s ease;
    transition: 0.3s ease;
    display: inline-block;
    float:right;
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
 font: bold 14px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #797268;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <form id="form1" runat="server">
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
           <%-- dingdan 2--%>
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="fId">
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未返回数据。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>          
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="fIdLabel" runat="server" Text='<%# Eval("fId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                        </td>
                        <td>
                           <%-- <asp:Label ID="fImageLabel" runat="server" Text='<%# Eval("fImage") %>' />--%>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fImage") %>' width="150px" Height="100px"/>
                        </td>
                        <td>
                            <asp:Label ID="fDescrLabel" runat="server" Text='<%# Eval("fDescr") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fPriceLabel" runat="server" Text='<%# Eval("fPrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="fStockLabel" runat="server" Text='<%# Eval("fStock") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">商品号</th>
                                        <th runat="server">名称</th>
                                        <th runat="server">图片</th>
                                        <th runat="server">简介</th>
                                        <th runat="server">价格</th>
                                        <th runat="server">余货</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                                <a href="MyOrder.aspx" class="btn"> 返回 </a>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
       </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=sho.usxjsj.cn;Persist Security Info=True;User ID=u17145116;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT fruits.fId, fruits.fName, fruits.fImage, fruits.fDescr, fruits.fPrice, fruits.fStock FROM fruits INNER JOIN orderDetails ON fruits.fId = orderDetails.fid WHERE (orderDetails.orderId = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=sho.usxjsj.cn;Persist Security Info=True;User ID=u17145116;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orderDetails]"></asp:SqlDataSource>
        </div>
      </div>
      <!-- End 订单-->
      
         
         

      <!-- End 商品-->

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
     </form>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        input {
            width: 220px;
            display: block;
            padding: 4px;
            margin: 0 0 10px 50px;
            font-size: 18px;
            color: #3a3a3a;
            font-family: Georgia,serif;
        }

    </style>
<script>
        $(function () {
           
            //function calc() {
            //    $.post("Handler/GetCartItemTotal.ashx", {}, function (data) {
            //        $(".pTotal").text(data);
                    
                    
            //    });
            //}
            $("#adduser").click(function () {
                var UserId = $("#UserId").val();
                var UserName = $("#UserName").val();
                //alert(UserName);
                var UserPwd = $("#UserPwd").val();
                var ReUserPwd = $("#ReUserPwd").val();
                var Sex = $("#Sex").val();
                var TelNo = $("#TelNo").val();
                var Birthday = $("#Birthday").val();
                var Address = $("#Address").val();
                
                var pdata = { UserId: UserId, UserName: UserName, UserPwd: UserPwd, ReUserPwd: ReUserPwd,TelNo: TelNo, Address: Address };
                //alert(pdata);
                $.post("Handlers/adduserhandler.ashx", pdata, function (data) {
                    if (data != "error") {
                        //$tr.fadeOut();
                        //calc();
                        //window.location.reload();
                        alert(data);
                    }
                    else
                    {
                        alert("error.");
                    }
                });
            });
            
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- End header-->
          <div class="ogami-breadcrumb">
              <div class="container">
                  <ul>
                      <li> <a class="breadcrumb-link" href="Index.aspx"> <i class="fas fa-home"></i>首页</a></li>
                      <li> <a class="breadcrumb-link active" href="#">注册</a></li>
                  </ul>
              </div>
          </div>
          <!-- End breadcrumb-->
          <div class="account">
              <div class="container">
                  <div class="row">
                      <div class="col-12 col-md-6 mx-auto">
                          <h1 class="title">注册</h1>
                          
                          <div>
        账号<asp:TextBox ID="txtUserid" runat="server"></asp:TextBox>
        <br />
        昵称<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <br />
        TelNo<asp:TextBox ID="txtTelNo" runat="server"></asp:TextBox><br />

        Addr<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox><br />

        密码<asp:TextBox ID="txtUserPwd" runat="server"></asp:TextBox>
        <br />
       确认密码<asp:TextBox ID="txtReUserPwd" runat="server"></asp:TextBox>
        <br />
          
        <asp:Button ID="Button1" runat="server" Text="注册" OnClick="Button1_Click"/>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
           </div>
                             
                      </div>
                  </div>
              </div>
          </div>
          <!-- End account-->
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
                          <p class="author">Copyright © 2019 林津民-17145116 </p><img class="payment-method" src="assets/images/payment.png" alt="">
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


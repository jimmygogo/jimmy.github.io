<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .account #password {
            margin-bottom: 30px;
        }

        .account-method {
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .account-forgot a {
            font-family: "Cera Pro Regular";
            font-size: 16px;
            color: #636363;
            line-height: 1;
            display: inline-block;
            -webkit-transition: 0.3s ease;
            -moz-transition: 0.3s ease;
            -ms-transition: 0.3s ease;
            -o-transition: 0.3s ease;
            transition: 0.3s ease;
        }

        .account-function {
            text-align: center;
        }

        .loginbtn {
            width: 100%;
            margin-bottom: 30px;
        }

        .no-round-btn:hover {
            background-color: transparent;
            color: #88c74a;
            border: 2px solid #88c74a;
            text-decoration: none;
        }

        .create-account {
            font-family: "Cera Pro Regular";
            font-size: 16px;
            color: #252525;
            line-height: 1;
            display: inline-block;
            -webkit-transition: 0.3s ease;
            -moz-transition: 0.3s ease;
            -ms-transition: 0.3s ease;
            -o-transition: 0.3s ease;
            transition: 0.3s ease;
            text-transform: uppercase;
            text-decoration: underline;
        }

            .create-account:hover {
                color: #88c74a;
                text-decoration: none;
            }

        label {
            width: 115px;
            text-align: right;
            float: left;
            margin: 0 10px 0 0;
            padding: 9px 0 0 0;
            font-size: 16px;
        }

        input {
            width: 220px;
            display: block;
            padding: 4px;
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #3a3a3a;
            font-family: Georgia,serif;
        }

        .loginn {
            margin-left: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- End header-->
    <div class="ogami-breadcrumb">
        <div class="container">
            <ul>
                <li><a class="breadcrumb-link" href="Index.aspx"><i class="fas fa-home"></i>首页</a></li>
                <li><a class="breadcrumb-link active" href="#">登录</a></li>
            </ul>
        </div>
    </div>
    <!-- End breadcrumb-->
    <div class="account">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6 mx-auto">
                    <h1 class="title">登录</h1>



                    <div>
                        <div class="loginn">
                            <label for="uname">用户名：</label>
                            <asp:TextBox ID="txtUserid" runat="server" name="uname"></asp:TextBox>
                            <br />
                            <label for="upwd">密码：</label>
                            <asp:TextBox ID="txtUserPwd" runat="server" Name="upwd" TextMode="Password"></asp:TextBox>
                        </div>
                        <br />

                        <label for="checkcode" class="sr-only">验证码</label>
                        <input type="text" name="checkcode" id="checkcode" class="form-control" placeholder="验证码" required>
                        <img src="handlers/CheckCode.ashx" alt="" style="width: 55px; height: 30px;" title='看不清楚，双击图片换一张。' ondblclick="this.src = 'handlers/CheckCode.ashx?flag=' + Math.random()" border="1" />

                        <br />
                        <button type="button" class="normal-btn loginbtn">
                            <span class="postinfor">登录</span>
                        </button>
                        <a href="Register.aspx">注册账号</a>
                        <asp:Label ID="Label1" runat="server" Text="Label">用户名或密码错误！</asp:Label>
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
                    <p class="author">Copyright © 2019 LJM-17145116 </p>
                    <img class="payment-method" src="assets/images/payment.png" alt="">
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
            $('#ContentPlaceHolder1_Label1').css({ display: "none" });
            $(".loginbtn").click(function () {

                $.ajax({
                    type: "post",
                    url: "handlers/Login.ashx",
                    data: {
                        userId: $("#ContentPlaceHolder1_txtUserid").val(),
                        userPwd: $("#ContentPlaceHolder1_txtUserPwd").val(),
                        checkcode: $('#checkcode').val()
                    },
                    success: function (result) {
                        if (result == "验证码错误！" || result == "请输入验证码！") {
                            alert(result);
                        }
                        else {
                            if (result != "用户名或密码不正确！")
                            {
                                //window.location.href = "Index.aspx";
                                if (result.substring(0, 1) == "0") {
                                    result = result.substring(1);
                                    alert(result + "管理员，欢迎登录");
                                    window.location.href = "admin/productsAdd.aspx";
                                }
                                else {
                                    alert(result + "，欢迎登录");
                                    window.location.href = "Index.aspx";
                                }
                            }
                            else {
                                $('#ContentPlaceHolder1_Label1').css({ display: "block" });
                                $('#ContentPlaceHolder1_Label1d').css({ color: "red" });
                            }
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="productsAdd.aspx.cs" Inherits="admin_productsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr><td>商品名<asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
        <tr><td>类别<asp:DropDownList ID="ddlTypeid" runat="server" DataSourceID="SqlDataSource1" DataTextField="cname" DataValueField="cid"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [class]"></asp:SqlDataSource>

            </td></tr>
        <tr><td>价格<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td></tr>
        <%--<tr><td>height<asp:TextBox ID="txtHeight" runat="server"></asp:TextBox></td></tr>--%>
        <tr><td>余货<asp:TextBox ID="txtStock" runat="server"></asp:TextBox></td></tr>
        

        <tr><td>图片<asp:DropDownList ID="ddlImgpath" runat="server" OnSelectedIndexChanged="ddlImgpath_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
            </td></tr>
        <tr><td>简介<asp:TextBox ID="txtDesc" runat="server" Height="79px" TextMode="MultiLine" Width="345px"></asp:TextBox></td></tr>

    </table>
        <asp:Button ID="Button1" runat="server" Text="添加" OnClick="Button1_Click"/>
</asp:Content>


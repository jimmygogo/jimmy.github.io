<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="updateProduct.aspx.cs" Inherits="admin_updateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr><td>Id<asp:TextBox ID="txtID" runat="server" Enabled="false"></asp:TextBox></td></tr>
        <tr><td>Name<asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
        <tr><td>typeid<asp:DropDownList ID="ddlTypeid" runat="server" DataSourceID="SqlDataSource1" DataTextField="cname" DataValueField="cid"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM class"></asp:SqlDataSource>

            </td></tr>
        <tr><td>price<asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td></tr>
        <tr><td>imgpath<asp:DropDownList ID="ddlImgpath" runat="server" OnSelectedIndexChanged="ddlImgpath_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
            </td></tr>
        <tr><td>descr<asp:TextBox ID="txtDesc" runat="server" Height="79px" TextMode="MultiLine" Width="345px"></asp:TextBox></td></tr>

    </table>
        <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
</asp:Content>


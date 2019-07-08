<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="OrderEdit.aspx.cs" Inherits="admin_OrderEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId" DataSourceID="SqlDataSource1">
    
    
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
                <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
            </td>
            <td>
                <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
            </td>
            <td>
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
            </td>
            <td>
                <asp:Label ID="totalpriceLabel" runat="server" Text='<%# Eval("totalprice") %>' />
            </td>
            <td>
                <%--<asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />--%>
                <asp:Button class="pay" ID="Button1" runat="server" Text="发货" CommandName="btnPay" OnCommand="Button_delivery"
                            CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "已付款"?true:false %>' />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("status") %>' Visible='<%# (Eval("status").ToString() == "已付款")?false:true %>' />

            </td>
            <td>
                     <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("orderId") %>' OnClientClick="return confirm('确定删除此记录吗？');" OnClick="LinkButtonDelete_Click">删除</asp:LinkButton>
                </td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                        <tr runat="server" style="">
                            <th runat="server">orderId</th>
                            <th runat="server">userid</th>
                            <th runat="server">date</th>
                            <th runat="server">totalprice</th>
                            <th runat="server">status</th>
                            <th runat="server">op</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server" style=""></td>
            </tr>
        </table>
    </LayoutTemplate>
    
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=sho.usxjsj.cn;Persist Security Info=True;User ID=u17145116;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orders]"></asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="productsEdit.aspx.cs" Inherits="admin_productsEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    KeyWord:<asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [fruits]"></asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="fId" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
                
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
                    <asp:Label ID="fClassIdLabel" runat="server" Text='<%# Eval("fClassId") %>' />
                </td>
                <td>
                    <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="fImageLabel" runat="server" Text='<%# Eval("fImage") %>' />--%>
                    <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Eval("fImage") %>' width="150px" Height="100px"/>
                </td>
<%--                <td>
                    <asp:Label ID="fDescrLabel" runat="server" Text='<%# Eval("fDescr") %>' />
                </td>
                <td>
                    <asp:Label ID="fDescr1Label" runat="server" Text='<%# Eval("fDescr1") %>' />
                </td>
                <td>
                    <asp:Label ID="fColorLabel" runat="server" Text='<%# Eval("fColor") %>' />
                </td>
                <td>
                    <asp:Label ID="fTagLabel" runat="server" Text='<%# Eval("fTag") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="fPriceLabel" runat="server" Text='<%# Eval("fPrice") %>' />
                </td>
                <td>
                    <asp:Label ID="fStockLabel" runat="server" Text='<%# Eval("fStock") %>' />
                </td>
                <td>
                    <asp:Label ID="fTimeLabel" runat="server" Text='<%# Eval("fTime") %>' />
                </td>
                <td>
                     <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("fId") %>' OnClientClick="return confirm('确定删除此记录吗？');" OnClick="LinkButtonDelete_Click" >删除</asp:LinkButton>
                    ｜<a href="updateProduct.aspx?id=<%# Eval("fId") %>">修改</a>

                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">fId</th>
                                <th runat="server">fClassId</th>
                                <th runat="server">fName</th>
                                <th runat="server">fImage</th>
                                <%--<th runat="server">fDescr</th>
                                <th runat="server">fDescr1</th>
                                <th runat="server">fColor</th>
                                <th runat="server">fTag</th>--%>
                                <th runat="server">fPrice</th>
                                <th runat="server">fStock</th>
                                <th runat="server">fTime</th>
                               <th runat="server">操作</th>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=sho.usxjsj.cn;Persist Security Info=True;User ID=u17145116;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [fruits]"></asp:SqlDataSource>
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="4">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
</asp:Content>


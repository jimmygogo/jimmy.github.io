using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_OrderEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Admin"] == null)
        //{
        //    Response.Redirect("../login.aspx");
        //    return;
        //}
    }

    protected void Button_delivery(object sender, CommandEventArgs e)
    {
        string orderid = e.CommandArgument.ToString();//要付款的订单号        
        //付款操作的代码写在这里，
        //在此以下代码仅是进行测试
        if (deliveryment(orderid))//付款成功
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('发货成功');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('发货失败');</script>");
        }
        ListView1.DataBind();//重新绑定listview1
    }

    private bool deliveryment(string orderid)
    {
        bool successflag = false;
        /***********************/
        /*  发货的代码写在此   */
        /**********************/
        //发货成功后修改订单状态
        successflag = updateOrderState(orderid, "待收货");
        return successflag;
    }

    private bool updateOrderState(string orderid, string orderstate)
    {
        //创建连接对象
        bool successflag = false;
        string cnnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(cnnstr);
        string cmdstr = "update orders set status=@status where orderid=@orderid";
        SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
        sqlcmd.Parameters.AddWithValue("@orderid", orderid);
        sqlcmd.Parameters.AddWithValue("@status", orderstate);
        try
        {
            connection.Open();
            sqlcmd.ExecuteNonQuery();
            successflag = true;
        }
        catch (Exception ex)//出错时
        {
            successflag = false;
            //Response.Write(ex.Message);
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            { connection.Close(); }
        }
        return successflag;
    }


    //删除记录
    protected void LinkButtonDelete_Click(object sender, EventArgs e)
    {
        LinkButton lbn = (LinkButton)sender;
        string id = lbn.CommandArgument;//商品ID
                                        //ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('" + lbn.CommandArgument + "');</script>");
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String cmd = "delete from orders where orderId=@orderId;";
        String cmd1 = "delete from orderDetails where orderId=@orderId;";
        SqlCommand mycmd = new SqlCommand(cmd, connection);
        SqlCommand mycmd1 = new SqlCommand(cmd1, connection);
        mycmd.Parameters.AddWithValue("@orderId", id);
        mycmd1.Parameters.AddWithValue("@orderId", id);

        //删除cmd1
        mycmd1.Connection.Open();

        int iResult = 0, ir1 = 0;//影响的记录数
        try
        {
            ir1 = mycmd1.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('删除错误。');</script>");
        }
        finally
        {
            mycmd1.Connection.Close();
        }

        //删除cmd
        mycmd.Connection.Open();
       
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('删除错误。');</script>");
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('删除成功。');window.location.href='OrderEdit.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('没有记录被删除。');</script>");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DBHelper 的摘要说明
/// </summary>
public class DBHelper
{
    public DBHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static int AddCustomer(Customer c)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "insert into Customer(UserId,UserName,UserPwd,Balance) values(@UserId,@UserName,@UserPwd,@Balance)";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //可在此判断参数是否正确密码是否相同?
        mycmd.Parameters.AddWithValue("@UserId", c.UserId);
        mycmd.Parameters.AddWithValue("@UserName", c.Name);
        mycmd.Parameters.AddWithValue("@UserPwd", c.UserPwd);
        mycmd.Parameters.AddWithValue("@Balance", c.Balance);
        mycmd.Parameters.AddWithValue("@TelNo", c.TelNo);
        mycmd.Parameters.AddWithValue("@Address", c.Address);

        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            //Label1.Text = ee.Message;
            return -1;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            return 0;
        }
        else
        {
            return -1; ;
        }
    }

    public static List<Customer> GetCustomersList()
    {
        List<Customer> list = new List<Customer>();
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Customer";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        Customer c = null;
        while (reader.Read())
        {
            c = new Customer();
            c.UserId = reader["UserId"].ToString();//或 c.UserId = reader[0].ToString();
            c.Name = reader["UserName"].ToString();
            c.UserPwd = reader["UserPwd"].ToString();
            c.Balance = decimal.Parse(reader["Balance"].ToString());
            c.TelNo = reader["TelNo"].ToString();
            c.Address = reader["Address"].ToString();
            list.Add(c);
        }
        connection.Close();
        return list;
    }
    public static List<Admin> GetAdminsList()
    {
        List<Admin> list = new List<Admin>();
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM admin";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        Admin a = null;
        while (reader.Read())
        {
            a = new Admin();
            a.AdminName = reader["AdminName"].ToString();
            a.AdminPwd = reader["AdminPwd"].ToString();
            list.Add(a);
        }
        connection.Close();
        return list;
    }

    public static List<Fruit> GetFruitsList()
    {
        List<Fruit> list = new List<Fruit>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM fruits";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Fruit f = new Fruit();
            f.Id = int.Parse(reader["fId"].ToString());
            f.Title = reader["fName"].ToString();
            f.Price = decimal.Parse(reader["fPrice"].ToString());
            //p.ImgPath = reader["ImgPath"].ToString();
            f.Photo = reader["fImage"].ToString().Replace("~\\", "");
            f.CategoryId = int.Parse(reader["fClassId"].ToString());
            f.Description = reader["fDescr"].ToString();
            //f.Img1 = p.Img2 = p.Img3 = f.ImgPath;
            //请根据自己定义的模型进行赋值
            list.Add(f);
        }
        connection.Close();
        return list;
    }

    public static int createOrder(string userid, ShoppingCart cart)
    {
        //创建连接对象
        string cnnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(cnnstr);
        string cmdstr = "insert into orders(userid,date,totalprice,status) values(@userid,@date,@totalprice,@status)";
        SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
        sqlcmd.Parameters.AddWithValue("@userid", userid);
        sqlcmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
        sqlcmd.Parameters.AddWithValue("@totalprice", cart.Total);
        sqlcmd.Parameters.AddWithValue("@status", "未付款");
        SqlTransaction tran = null;
        string orderid = "";
        try
        {
            connection.Open();
            //开启一个事务，并返回给tran
            tran = connection.BeginTransaction();
            sqlcmd.Transaction = tran;//指定sqlcmd对象属于tran事务
            sqlcmd.ExecuteNonQuery();//插入记录（生成订单）

            //向订单明细表中插入记录
            cmdstr = "select top 1 orderid from orders where userid=@userid order by orderid desc"; //降序排序后输出第一个orderid，即最新的。
            sqlcmd.CommandText = cmdstr;
            sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
            sqlcmd.Parameters.AddWithValue("@userid", userid);
            orderid = sqlcmd.ExecuteScalar().ToString();//查自动生成的订单id值。因只查一个值，所以使用了标量查询。

            //向订单明细表中插入记录
            cmdstr = "insert into orderDetails(orderid,fid,number,totalprice) values(@orderid,@fid,@number,@totalprice)";
            sqlcmd.CommandText = cmdstr;

            //将购买的商品的信息一一添加到订单明细表中
            foreach (CartItem item in cart.CartItems)
            //for (int i = 0; i < cart.CartItems.Count; i++)
            {
                sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
                sqlcmd.Parameters.AddWithValue("@fid", item.Id);
                sqlcmd.Parameters.AddWithValue("@orderid", orderid);
                sqlcmd.Parameters.AddWithValue("@number", item.Quantity);
                sqlcmd.Parameters.AddWithValue("@totalprice", item.Quantity * item.Price);
                sqlcmd.ExecuteNonQuery();//插入记录（生成订单详细）
            }

            tran.Commit();//提交事务
            return 0;
        }
        catch (Exception ex)//出错时
        {
            //回滚事务，数据库不作任务修改
            tran.Rollback();
            //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
            return -1;
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
        }
    }

    public static decimal GetValueByOrderId(string orderid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT totalprice FROM orders WHERE orderId=@orderId";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@orderId", orderid);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        decimal value = 0;
        while (reader.Read())
        {
            value = decimal.Parse(reader["totalprice"].ToString());
        }
        connection.Close();
        return value;
    }

    public static int SaveBalanceByCustomerId(int cid, decimal fee)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "update customer set Balance=@fee where UserId=@UserId";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@fee", fee);
        mycmd.Parameters.AddWithValue("@UserId", cid);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            return -1;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }

    //调用存储过程来创建订单
    public static int createOrder1(string userid, ShoppingCart cart)
    {
        //创建连接对象
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand mycmd = new SqlCommand("createOrder", connection);
        mycmd.CommandType = CommandType.StoredProcedure;
        //@userid,@orderTotalPrice,@fid,@number,@detailTotalPrice,@result output
        //输入参数
        mycmd.Parameters.AddWithValue("@userid", userid);
        mycmd.Parameters.AddWithValue("@orderTotalPrice", cart.Total);
        //用所有的商品号、数量、小计总价构造成 字符串。
        string fid = "", number = "", detailTotalPrice = "";
        foreach (CartItem item in cart.CartItems)
        {
            fid += item.Id + ",";  //注意拼接得到的字符串的格式形如：'1,2,3,'最后是一个逗号
            number += item.Quantity.ToString() + ",";
            detailTotalPrice += (item.Price * item.Quantity).ToString() + ",";
        }
        mycmd.Parameters.AddWithValue("@fid", fid);
        mycmd.Parameters.AddWithValue("@number", number);
        mycmd.Parameters.AddWithValue("@detailTotalPrice", detailTotalPrice);
        //设置存储过程的输出参数
        mycmd.Parameters.AddWithValue("@result", -1).Direction = ParameterDirection.Output;
        mycmd.Parameters.AddWithValue("@orderid", 0).Direction = ParameterDirection.Output;

        mycmd.Connection.Open(); //connection.Open();
        int iResult = -1, orderid = 0;
        try
        {
            mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            //Response.Write(ee.Message);
            mycmd.Connection.Close();
            return -1;
        }
        //接收存储过程返回的值
        iResult = (int)mycmd.Parameters["@result"].Value;
        orderid = (int)mycmd.Parameters["@orderid"].Value;
        mycmd.Connection.Close();
        if (iResult == 0)
        {
            return 0;
        }
        else
        {
            return -1;
        }
        //Response.Write(iResult + "||" + mycmd.Parameters["@usex"].Value);
        //mycmd.Connection.Close();
    }

}
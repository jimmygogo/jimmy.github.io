using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Customer 的摘要说明
/// </summary>
public class Customer
{
    public Customer()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public int Id { get; set; }
    public string Name { get; set; }
    public string UserId { get; set; }
    public string UserPwd { get; set; }
    public decimal Balance { get; set; }
    public string TelNo { get; set; }
    public string Address { get; set; }
}
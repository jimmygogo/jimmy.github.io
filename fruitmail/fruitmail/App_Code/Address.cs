using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Address 的摘要说明
/// </summary>
public class Address
{
    public Address()
    {

        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public int Id { get; set; }
    public int CustomerId { get; set; }
    public string Name { get; set; }
    public string Phone { get; set; }
    public bool IsDefault { get; set; }
    public string Addr { get; set; }

}
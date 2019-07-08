using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Category 的摘要说明
/// </summary>
public class Category
{
    public Category(int id, string name)
    {
        Id = id;
        Name = name;
    }

    public int Id { get; set; }
    public string Name { get; set; }
}
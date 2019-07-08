using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CartItem 的摘要说明
/// </summary>
[Serializable]
public class CartItem
{
    public CartItem()
    {

    }

    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public string Pic { get; set; }
    public string Family { get; set; }
    public string Color { get; set; }
    public int Stock { get; set; }
    public string Place { get; set; }
    public string Tag1 { get; set; }
    public string Tag2 { get; set; }

    public decimal Total
    {
        get
        {
            return Price * Quantity;
        }
    }
 
}
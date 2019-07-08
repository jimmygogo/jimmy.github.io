using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Fruit
    {

    public Fruit()
        {

        }
        public decimal Price { get; set; }
        public bool IsOff { get; set; }
        public decimal Score { get; set; }
        public string Photo { get; set; }
        public DateTime OnTime { get; set; } //上架时间
        public string Description { get; set; }//描写
        public string Tag { get; set; }
        public int CategoryId { get; set; }
        public int Stock { get; set; }//存货
        public string Color { get; set; } //颜色
        public string Title { get; set; }//水果名
        public string Family { get; set; }//类别
        public string Place { get; set; }//产地
        public int Id { get; set; }

        public string Tag1
        {
            get
            {
                string result = "";
                if (Tag != null)
                {
                    string[] tags = Tag.Split(',');
                    if (tags.Length > 0)
                    {
                        result = tags[0];
                    }
                }

                return result;
            }
        }
        public string Tag2
        {
            get
            {
                string result = "";
                if (Tag != null)
                {
                    string[] tags = Tag.Split(',');
                    if (tags.Length > 1)
                    {
                        result = tags[1];
                    }
                }
                return result;
            }
        }
    }

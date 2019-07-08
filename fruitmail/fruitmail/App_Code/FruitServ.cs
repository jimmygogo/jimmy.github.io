using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class FruitServ
    {
        List<Fruit> fruitList;
    List<Category> categories;
    int pageNum = 1;
    public FruitServ()
        {
        fruitList = GetAllFruits();
        categories = GetAllCategories();
    }

    private List<Category> GetAllCategories()
    {
        Category[] res = { new Category(0, "全部"), new Category(1, "瓜果类"), new Category(2, "柑桔类"), new Category(3, "热带水果类"), new Category(4, "核果类"), new Category(5, "浆果类"), new Category(6, "干货类") };
        return res.ToList();
    }

    public List<Tag> GetAlltags()
    {
        Tag[] res = { new Tag("多汁"), new Tag("时令"), new Tag("新鲜"), new Tag("进口"), new Tag("干货"), new Tag("香甜") };
        return res.ToList();
    }

    public Category[] GetCategories()
    {
        return categories.ToArray();
    }

    public Fruit[] GetFruitsByTypeAndPage(int type = 0, int page = 1)
    {
        page--;
        List<Fruit> res = new List<Fruit>();
        Fruit[] fruits = GetFruitsByType(type);
        for (int i = page * 9 + 0; i < Math.Min(page * 9 + 9, fruits.Length); i++)
        {
            res.Add(fruits[i]);
        }
        return res.ToArray();
    }
   
    public int getPageNum()
    {
        return pageNum;
    }

    private Fruit[] GetFruitsByType(int type)
    {
        if (type == 0)
        {
            pageNum = (fruitList.Count + 8) / 9;
            return fruitList.ToArray();
        }
        List<Fruit> res = new List<Fruit>();
        foreach (Fruit fruit in fruitList)
        {
            if (fruit.CategoryId == type)
            {
                res.Add(fruit);
            }
        }
        pageNum = (res.Count + 8) / 9;
        return res.ToArray();
    }

    //Bycolor
    public Fruit[] GetFruitsByColor(string color)
    {
        List<Fruit> res1 = new List<Fruit>();
        if (color != null)
        {
            foreach (Fruit fruit in fruitList)
            {
                if (fruit.Color == color)
                {
                    res1.Add(fruit);
                }
            }
            pageNum = (res1.Count + 8) / 9;
        }
        return res1.ToArray();
       
    }

    //Bytag
    public Fruit[] GetFruitsByTag(string tag)
    {
        List<Fruit> res2 = new List<Fruit>();
        if (tag != null)
        {
            foreach (Fruit fruit in fruitList)
            {
                if (fruit.Tag1 == tag || fruit.Tag2 == tag)
                {
                    res2.Add(fruit);
                }
            }
            pageNum = (res2.Count + 8) / 9;
        }
        return res2.ToArray();

    }
    //Bytsearch
    public Fruit[] GetFruitsBySearch(string search)
    {
        List<Fruit> res3 = new List<Fruit>();
        if (search != null)
        {
            foreach (Fruit fruit in fruitList)
            {
                if (fruit.Tag1 == search || fruit.Tag2 == search)
                {
                    res3.Add(fruit);
                }
                if (fruit.Color == search)
                {
                    res3.Add(fruit);
                }
                if (fruit.Family == search)
                {
                    res3.Add(fruit);
                }
                if (fruit.Place == search)
                {
                    res3.Add(fruit);
                }
                if (fruit.Title == search)
                {
                    res3.Add(fruit);
                }
            }
            pageNum = (res3.Count + 8) / 9;
        }
        return res3.ToArray();

    }

    public Fruit GetFruitById(int id)
    {
        Fruit result = new Fruit();
        //foreach (Fruit fruit in fruitList)
        //{
        //  if (fruit.Id == id)
        //  {
        //    result = fruit;
        //    break;
        //  }
        //}

        //Linq
        result = fruitList.FirstOrDefault(p => p.Id == id);

        return result;
    }

        public List<Fruit> GetAllFruits()
        {
        return DBHelper.GetFruitsList();
        #region 原来的水果初始化代码
        //    Fruit fruit;
        //    List<Fruit> fruitList = new List<Fruit>();

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "apple1.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "苹果营养价值很高，富含矿物质和维生素，含钙量丰富，有助于代谢掉体内多余盐分，苹果酸可代谢热量，防止下半身肥胖。苹果是人们经常食用的水果之一。";
        //    fruit.Tag = "多汁,新鲜";
        //    fruit.CategoryId = 4;
        //    fruit.Stock = 100;
        //    fruit.Color = "red";
        //    fruit.Title = "苹果";
        //    fruit.Place = "烟台";
        //    fruit.Family = "核果类";
        //    fruit.Id = 1;
        //    fruitList.Add(fruit);

        //
        //fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "apple2.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "原名叫 Red delicious apple（可口的红苹果）香港人翻译为红地厘蛇果，简约为地厘蛇果。原产于美国的加利福尼亚州，又名红元帅，为红香蕉（元帅）的浓条红型芽变，是世界主要栽培品种之一。由于高品质的蛇果对气候条件的苛刻，发展到现在中国蛇果仅在甘肃天水高海拔山区魏店及周边种植。";
        //    fruit.Tag = "多汁,进口";
        //    fruit.CategoryId = 4;
        //    fruit.Stock = 100;
        //    fruit.Color = "red";
        //    fruit.Title = "蛇果";
        //    fruit.Place = "美国华盛顿";
        //    fruit.Family = "核果类";
        //    fruit.Id = 2;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "xg.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "西瓜为夏季之水果，果肉味甜，能降温去暑；种子含油，可作消遣食品；果皮药用，有清热、利尿、降血压之效。";
        //    fruit.Tag = "多汁,时令";
        //    fruit.CategoryId = 1;
        //    fruit.Stock = 100;
        //    fruit.Color = "red";
        //    fruit.Title = "西瓜";
        //    fruit.Place = "浙江";
        //    fruit.Family = "瓜果类";
        //    fruit.Id = 3;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "hmg.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "哈密瓜主产于吐哈盆地，它形态各异，风味独特，瓜肉肥厚，清脆爽口。哈密瓜营养丰富，含糖量最高达21%。哈密的甜瓜在东汉永平年间就成为进贡的异瓜种了。至清代，被哈密王作为贡品，受康熙赏赐而得名哈密瓜。";
        //    fruit.Tag = "新鲜,香甜";
        //    fruit.CategoryId = 1;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "哈密瓜";
        //    fruit.Place = "吐鲁番";
        //    fruit.Family = "瓜果类";
        //    fruit.Id = 4;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "xg2.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "各种香瓜均含有苹果酸、葡萄糖、氨基酸、甜菜茄、维生素C等丰富营养。全国各地广泛栽培，世界温带至热带地区也广泛栽培。";
        //    fruit.Tag = "新鲜,香甜";
        //    fruit.CategoryId = 1;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "香瓜";
        //    fruit.Place = "浙江";
        //    fruit.Family = "瓜果类";
        //    fruit.Id = 5;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "jz.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "柑和橘都属于芸香科柑橘属的宽皮柑橘类，果实外皮肥厚，内藏瓤瓣，由汁泡和种子构成。";
        //    fruit.Tag = "多汁,香甜";
        //    fruit.CategoryId = 2;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "橘子";
        //    fruit.Place = "四川";
        //    fruit.Family = "柑桔类";
        //    fruit.Id = 6;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "cz.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "橙子起源于东南亚。橙树属小乔木。果实可以剥皮鲜食其果肉，果肉可以用作其他食物的调料或附加物。";
        //    fruit.Tag = "多汁,香甜";
        //    fruit.CategoryId = 2;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "橙子";
        //    fruit.Place = "浙江";
        //    fruit.Family = "柑桔类";
        //    fruit.Id = 7;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "nm.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "柠檬因其味极酸，因为孕妇最喜食，故称益母果或益母子。柠檬中含有丰富的柠檬酸，因此被誉为“柠檬酸仓库”。它的果实汁多肉脆，有浓郁的芳香气。";
        //    fruit.Tag = "新鲜,多汁";
        //    fruit.CategoryId = 2;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "柠檬";
        //    fruit.Place = "浙江";
        //    fruit.Family = "柑桔类";
        //    fruit.Id = 8;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "pty.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "葡萄柚又叫西柚、朱栾。因挂果时果实密集，呈簇生状，似葡萄成串垂吊，故称葡萄柚。系芸香科柑橘亚科柑橘属常绿乔木果树。";
        //    fruit.Tag = "新鲜,进口";
        //    fruit.CategoryId = 2;
        //    fruit.Stock = 100;
        //    fruit.Color = "red";
        //    fruit.Title = "葡萄柚";
        //    fruit.Place = "南非";
        //    fruit.Family = "柑桔类";
        //    fruit.Id = 9;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "jsmy.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "蜜柚（Honey pomelo），又名香抛，系柚子优质品的一种。多见生长于南方,果实小的如柑或者橘，大的如瓜，黄色的外皮很厚，食用时需去皮吃其瓤，大多在10-11月果实成熟时采摘。其皮厚耐藏，一般可存放三个月而不失香味，故被称为“天然水果罐头”。";
        //    fruit.Tag = "新鲜,进口";
        //    fruit.CategoryId = 2;
        //    fruit.Stock = 100;
        //    fruit.Color = "red";
        //    fruit.Title = "金丝蜜柚";
        //    fruit.Place = "泰国";
        //    fruit.Family = "柑桔类";
        //    fruit.Id = 10;
        //    fruitList.Add(fruit);

        //    fruit = new Fruit();
        //    fruit.Price = 10.00m;
        //    fruit.IsOff = false;
        //    fruit.Score = 0;
        //    fruit.Photo = "banana.jpg";
        //    fruit.OnTime = DateTime.Now;
        //    fruit.Description = "香蕉含有多种微量元素和维生素，能帮助肌肉松弛，使人身心愉悦 ，并具有一定的减肥功效。";
        //    fruit.Tag = "新鲜,进口";
        //    fruit.CategoryId = 3;
        //    fruit.Stock = 100;
        //    fruit.Color = "yellow";
        //    fruit.Title = "香蕉";
        //    fruit.Place = "泰国";
        //    fruit.Family = "热带水果类";
        //    fruit.Id = 11;
        //    fruitList.Add(fruit);
        ////后来加了一个
        //fruit = new Fruit();
        //fruit.Price = 14.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "mht.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "猕猴桃（学名：Actinidia chinensis Planch），也称奇异果（奇异果是猕猴桃的一个人工选育品种，因使用广泛而成为了猕猴桃的代称）。中国是猕猴桃的原产地，20世纪早期被引入新西兰。";
        //fruit.Tag = "多汁,进口";
        //fruit.CategoryId = 3;
        //fruit.Stock = 100;
        //fruit.Color = "green";
        //fruit.Title = "猕猴桃";
        //fruit.Place = "新西兰";
        //fruit.Family = "热带水果类";
        //fruit.Id = 31;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "bl.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "菠萝原产于南美洲巴西、巴拉圭的亚马逊河流域一带，16世纪从巴西传入中国。 现在已经流传到整个热带地区。";
        //fruit.Tag = "香甜,进口";
        //fruit.CategoryId = 3;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "菠萝";
        //fruit.Place = "泰国";
        //fruit.Family = "热带水果类";
        //fruit.Id = 12;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "mg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "芒果为著名热带水果之一，芒果果实含有糖、蛋白质、粗纤维，芒果所含有的维生素A的前体胡萝卜素成分特别高，是所有水果中少见的。其次维生素C含量也不低。";
        //fruit.Tag = "时令,进口";
        //fruit.CategoryId = 3;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "芒果";
        //fruit.Place = "泰国";
        //fruit.Family = "热带水果类";
        //fruit.Id = 13;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "yt.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "樱桃果实可以作为水果食用，外表色泽鲜艳、晶莹美丽、红如玛瑙，黄如凝脂，果实富含糖、蛋白质、维生素及钙、铁、磷、钾等多种元素。";
        //fruit.Tag = "新鲜,时令";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "樱桃";
        //fruit.Place = "浙江";
        //fruit.Family = "核果类";
        //fruit.Id = 14;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "tz.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "桃是一种果实作为水果的落叶小乔木，花可以观赏，果实多汁，可以生食或制桃脯、罐头等。";
        //fruit.Tag = "多汁,香甜";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "桃子";
        //fruit.Place = "浙江";
        //fruit.Family = "核果类";
        //fruit.Id = 15;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "lz.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "李子味酸，能促进胃酸和胃消化酶的分泌，并能促进胃肠蠕动，因而有改善食欲，促进消化的作用，尤其对胃酸缺乏、食后饱胀、大便秘结者有效。";
        //fruit.Tag = "多汁,时令";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "李子";
        //fruit.Place = "浙江";
        //fruit.Family = "核果类";
        //fruit.Id = 16;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "blm.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "波罗蜜以果实、种仁入药，果实用于酒精中毒，种仁用于产后脾虚气弱，乳少或乳汁不行";
        //fruit.Tag = "新鲜,进口";
        //fruit.CategoryId = 3;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "波罗蜜";
        //fruit.Place = "浙江";
        //fruit.Family = "热带水果类";
        //fruit.Id = 17;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "qm.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "青梅（学名：Vatica mangachapoi Blanco）是龙脑香科，青梅属乔木，树高约20米。小枝被星状绒毛。分布于中国海南。生于丘陵、坡地林中，海拔700米以下。";
        //fruit.Tag = "多汁,香甜";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "green";
        //fruit.Title = "青梅";
        //fruit.Place = "海南";
        //fruit.Family = "核果类";
        //fruit.Id = 18;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "lz2.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "荔枝味甘、酸、性温，入心、脾、肝经；可止呃逆，止腹泻，是顽固性呃逆及五更泻者的食疗佳品，同时有补脑健身，开胃益脾，有促进食欲之功效。";
        //fruit.Tag = "多汁,香甜";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "green";
        //fruit.Title = "荔枝";
        //fruit.Place = "广东";
        //fruit.Family = "核果类";
        //fruit.Id = 19;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "pear.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "梨的果实通常用来食用，不仅味美汁多，甜中带酸，而且营养丰富，含有多种维生素和纤维素，不同种类的梨味道和质感都完全不同。梨既可生食，也可蒸煮后食用。";
        //fruit.Tag = "多汁,香甜";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "green";
        //fruit.Title = "梨";
        //fruit.Place = "广东";
        //fruit.Family = "核果类";
        //fruit.Id = 20;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "ym.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "杨梅果味酸甜适中，既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。";
        //fruit.Tag = "多汁,新鲜";
        //fruit.CategoryId = 4;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "杨梅";
        //fruit.Place = "浙江";
        //fruit.Family = "核果类";
        //fruit.Id = 21;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "cm2.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。";
        //fruit.Tag = "香甜,新鲜";
        //fruit.CategoryId = 5;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "草莓";
        //fruit.Place = "浙江";
        //fruit.Family = "浆果类";
        //fruit.Id = 22;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "lm.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "蓝莓果实中含有丰富的营养成分，具有防止脑神经老化、保护视力、强心、抗癌、软化血管、增强人机体免疫等功能，营养成分高。";
        //fruit.Tag = "多汁,新鲜";
        //fruit.CategoryId = 5;
        //fruit.Stock = 100;
        //fruit.Color = "blue";
        //fruit.Title = "蓝莓";
        //fruit.Place = "浙江";
        //fruit.Family = "浆果类";
        //fruit.Id = 23;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "pt2.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "葡萄为著名水果，生食或制葡萄干，并酿酒，酿酒后的酒脚可提酒石酸，根和藤药用能止呕、安胎。";
        //fruit.Tag = "多汁,新鲜";
        //fruit.CategoryId = 5;
        //fruit.Stock = 100;
        //fruit.Color = "blue";
        //fruit.Title = "葡萄";
        //fruit.Place = "浙江";
        //fruit.Family = "浆果类";
        //fruit.Id = 24;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "ptg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "葡萄干（英文名称：raisin）是在日光下晒干或在阴影下晾干的葡萄的果实。葡萄又名草龙珠。主产新疆、甘肃，陕西、河北、山东等地。夏末秋初采收，鲜用或干燥备用。";
        //fruit.Tag = "香甜,干货";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "blue";
        //fruit.Title = "葡萄干";
        //fruit.Place = "浙江";
        //fruit.Family = "干货类";
        //fruit.Id = 25;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "mg2.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "梅干，是日本传统的咸菜食品，对日本人来说，咸黄梅是最普遍的食品之一。到了黄梅雨季节，在各个家庭与食品工厂就开始生产梅干，一时间，整个日本都弥漫着一股梅子香味。";
        //fruit.Tag = "香甜,干货";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "梅干";
        //fruit.Place = "浙江";
        //fruit.Family = "干货类";
        //fruit.Id = 26;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "xjg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "香蕉干是将香蕉去皮，切成片后的干货，易于储藏和食用。香蕉干就是我们常说的香蕉片，是一种很受欢迎的小零食。香蕉干主要以广西栽培主要香蕉品种——那龙蕉为原料，采取热风干燥加工法制成。";
        //fruit.Tag = "香甜,干货";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "香蕉干";
        //fruit.Place = "浙江";
        //fruit.Family = "干货类";
        //fruit.Id = 27;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "mgg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "芒果干是用芒果制作的一道小吃。芒果干有益胃、止呕、止晕的功效。因此，芒果对于眩晕症、梅尼埃综合症、高血压晕眩、恶心呕吐等均有疗效。";
        //fruit.Tag = "干货,进口";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "芒果干";
        //fruit.Place = "泰国";
        //fruit.Family = "干货类";
        //fruit.Id = 28;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "cmg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "草莓干中所含的胡萝卜素是合成维生素A的重要物质，具有明目养肝作用。";
        //fruit.Tag = "干货,香甜";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "red";
        //fruit.Title = "草莓干";
        //fruit.Place = "浙江";
        //fruit.Family = "干货类";
        //fruit.Id = 29;
        //fruitList.Add(fruit);

        //fruit = new Fruit();
        //fruit.Price = 10.00m;
        //fruit.IsOff = false;
        //fruit.Score = 0;
        //fruit.Photo = "htg.jpg";
        //fruit.OnTime = DateTime.Now;
        //fruit.Description = "桃干有益肾固涩，活血化瘀，止汗止血，截疟。治盗汗，遗精，吐血，疟疾，心腹痛；妊娠下血。还可用于治疗幼儿缺铁性贫血。";
        //fruit.Tag = "干货,香甜";
        //fruit.CategoryId = 6;
        //fruit.Stock = 100;
        //fruit.Color = "yellow";
        //fruit.Title = "黄桃干";
        //fruit.Place = "浙江";
        //fruit.Family = "干货类";
        //fruit.Id = 30;
        //fruitList.Add(fruit);
        //
        //return fruitList;
        #endregion
    }
}

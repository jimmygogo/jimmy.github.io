
$(document).ready(function () {

    //菜单手机端折叠与展开
    $(".navbar-toggle-zdy").click(function () {
        if ($(".navbar-collapse-zdy").is(":visible")) {
            $(".navbar-collapse-zdy").hide();
            var htmlStr = "";
            htmlStr += '<span class="sr-only">Toggle Navigation</span>';
            htmlStr += '<span class="icon-bar icon-bar-zdy"></span>';
            htmlStr += '<span class="icon-bar icon-bar-zdy"></span>';
            htmlStr += '<span class="icon-bar icon-bar-zdy"></span>';
            $(this).html(htmlStr);
            $(this).removeClass("mar0 noborder");
            
        } else {
            $(".navbar-collapse-zdy").show();
            var htmlStr = "";
            htmlStr += '<span class="sr-only">Toggle Navigation</span>';
            htmlStr += '<span class="meanclose">X</span>';
            $(this).html(htmlStr);
            $(this).addClass("mar0 noborder");
            
        }
    });

    //banner自动轮播 
    $("#slider3").responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        namespace: "callbacks",
        before: function () {
            $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
            $('.events').append("<li>after event fired.</li>");
        }
    });

   
    //tab切换--按钮
    $(".btn_tab a").each(function () {
        $(this).click(function () {
            $(".btn_tab a").removeClass("cur");
            $(this).addClass("cur");
        });
    });
    //tab切换--文本
    $(".txt_tab a").each(function () {
        $(this).click(function () {
            $(".txt_tab a").removeClass("cur");
            $(this).addClass("cur");
        });
    });
    //服务咨询选项
    $(".c1_service .item a").each(function () {
        $(this).click(function () {
            $(".c1_service .item a").removeClass("cur");
            $(this).addClass("cur");
        });
    });
});



(function($) {

$.fn.quickPager = function(options) {

    var defaults = {
        pageSize: 1,
        currentPage: 1,
        holder: null,
        pagerLocation: "after"
    };

    var options = $.extend(defaults, options);


    return this.each(function() {


        var selector = $(this);
        var pageCounter = 1;
        var x = 0;

        if( selector.parent("div.simplePagerContainer").length == 0 ) {
            selector.wrap("<div class='simplePagerContainer'></div>");
        }

        selector.parents(".simplePagerContainer").find("ul.simplePagerNav").remove();

        selector.children().each(function(i){
            $(this)[0].className = $(this)[0].className.replace(/\bsimplePagerPage.*?\b/g, '');
            if(!$(this).is(":hidden")) {
                if(x < pageCounter*options.pageSize && x >= (pageCounter-1)*options.pageSize) {
                    $(this).addClass("simplePagerPage"+pageCounter);
                }
                else {
                    $(this).addClass("simplePagerPage"+(pageCounter+1));
                    pageCounter ++;
                }
                x++;
            }
        });

        // show/hide the appropriate regions
        selector.children().hide();
        selector.children(".simplePagerPage"+options.currentPage).show();

        if(pageCounter <= 1) {
            return;
        }

        //Build pager navigation
        var pageNav = "<ul class='simplePagerNav'>";

        for (i=1;i<=pageCounter;i++){
            if (i==0) {

            }
            if (i==options.currentPage) {
                pageNav += "<li class='currentPage simplePageNav"+i+"' style='display: none;'><a rel='"+i+"' href='#'>"+i+"</a></li>";
            }
            else {
                pageNav += "<li class='simplePageNav"+i+"' style='display: none;'><a rel='"+i+"' href='#'>"+i+"</a></li>";
            }
        }

        pageNav += "</ul>";

        if(!options.holder) {
            switch(options.pagerLocation)
            {
            case "before":
                selector.before(pageNav);
            break;
            case "both":
                selector.before(pageNav);
                selector.after(pageNav);
            break;
            default:
                selector.after(pageNav);
            }
        }
        else {
            $(options.holder).append(pageNav);
        }

        //pager navigation behaviour
        selector.parent().find(".simplePagerNav a").click(function() {

            //grab the REL attribute
            var clickedLink = $(this).attr("rel");
            options.currentPage = clickedLink;

            if(options.holder) {
                $(this).parent("li").parent("ul").parent(options.holder).find("li.currentPage").removeClass("currentPage");
                $(this).parent("li").parent("ul").parent(options.holder).find("a[rel='"+clickedLink+"']").parent("li").addClass("currentPage");
            }
            else {
                //remove current current (!) page
                $(this).parent("li").parent("ul").parent(".simplePagerContainer").find("li.currentPage").removeClass("currentPage");
                //Add current page highlighting
                $(this).parent("li").parent("ul").parent(".simplePagerContainer").find("a[rel='"+clickedLink+"']").parent("li").addClass("currentPage");
            }

            //hide and show relevant links
            selector.children().hide();
            selector.find(".simplePagerPage"+clickedLink).show();

            return false;
        });
    });
}
})(jQuery);

$("ul.paging").quickPager();

var prevLink = '<li class="btn-ask prev"><a id="prevLink" href="#" >Saltar</a></li>';
$(".simplePagerNav").prepend(prevLink);
$("#prevLink").click(function(e) {
    e.preventDefault();
    $("li.currentPage").next("li[class^=simplePageNav]").find("a").click();
});
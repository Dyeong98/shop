/**
 * 
 */
$(document).ready(function(){
	var category_top = $("#top_nav").offset().top
    $(window).scroll(function(){
        var category = $("#top_nav")
        var contents = $("#main_contents")
 
        if( $(document).scrollTop() > category_top ) {
        	category.addClass("navbar-fixed-top");
        	contents.addClass("contents_padding_top");
        }else{
        	category.removeClass("navbar-fixed-top");
        	contents.removeClass("contents_padding_top");
        }
 
    });
 
});
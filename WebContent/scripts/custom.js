 jQuery.noConflict();
     
 // Use jQuery via jQuery(...)
 jQuery(document).ready(function(){
   jQuery('.boxes_content').activeMenu();
   jQuery(".boxes_content h3").eq(2).addClass("active");
   jQuery(".boxes_content ul").eq(2).show();

   jQuery(".boxes_content h3:first").addClass("active");
   jQuery(".boxes_content ul:not(:first)").hide();

   jQuery(".boxes_content h3").click(function(){
	   jQuery(this).next("ul").slideToggle("slow")
		.siblings("ul:visible").slideUp("slow");
	   jQuery(this).toggleClass("active");
	   jQuery(this).siblings("h3").removeClass("active");
	});
	
	
	
   jQuery('#header-nav').activeMenu();
   jQuery("a#active").parent(".act-li").addClass('li-active');

   
 });
     




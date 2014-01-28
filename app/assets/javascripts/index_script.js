$(document).ready(function(){

	var fullHeight = $(window).height();
	if(fullHeight > 980) { $('.wrapper').css({'margin-top':(fullHeight-980)/2+'px'}); }
	else { $('.wrapper').css({'margin-top':'0px'});}
	$(window).resize(function() {
		var fullHeight = $(window).height();
		if(fullHeight > 980) { $('.wrapper').css({'margin-top':(fullHeight-980)/2+'px'}); }
		else { $('.wrapper').css({'margin-top':'0px'});}
	});
	
	$(".block").mouseenter(function(){
		var direction = "-120px";
		
		if($(this).hasClass("first")) { var direction = "0px"; }
		if($(this).hasClass("last"))  { var direction = "-240px"; }

		$(this).addClass("current");
		$(this).find(".column").stop().animate({
			width: "480px",
			left: direction
			}, 500, function() {
			// Animation complete.
			}
		);
			
		$(this).find(".thumb").stop().animate({
			height: "60%"
			}, 500, function() {
				
			}
		);



	}).mouseleave(function(){
		$(this).removeClass("current");
		$(this).find(".column").stop().animate({
			width: "240px",
			left: "0px"
			}, 500, function() {
				$(this).parent(".block").removeClass("current");
			}
		);
		$(this).find(".thumb").stop().animate({
			height: "35%"
			}, 500, function() {
				
			}
		);

	});
  
});
$(function(){
	console.log("들어옴")
	var imgWidthStr = $("#thumbnailImg").css("width");
	console.log(imgWidthStr);
	var imgWidth = Number(imgWidthStr.substring(0, imgWidthStr.indexOf("px")));
	$("#thumbnailImg").css("left", (50 - imgWidth/2) + "px");
});
$(function(){
	console.log("적용됨")
	var imgWidthStr = $("#thumbnailImg").css("width");
	var imgWidth = Number(imgWidthStr.substring(0, imgWidthStr.indexOf("px")));
	$("#thumbnailImg").css("left", (50 - imgWidth/2) + "px");
});
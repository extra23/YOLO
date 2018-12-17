var topicId;
var userId;
	
function history(topicId, userId){
	this.topicId = topicId;
	this.userId = userId;
}
	
$(function(){
	// 눈 아이콘 클릭시 봤어요 눈 아이콘으로 바뀜
	$("#history").click(function(){
		/*console.log("topicId : " + topicId + "\nuserId : " + userId);*/
		$.ajax({
			url: "toggleHistory",
			data: "topicId=" + topicId + "&userId=" + userId,
			success: function(result){
				if(Number(result) == "add"){
					alert("봤어요");
					$("#history").attr("src", "images/see.png");
				}else{
					alert("안봤어요");
					$("#hitory").attr("src", "images/notSee.png");
				}
			},
			error : function(){
				alert("봐썽요 실패");
			}
		})
	});
});
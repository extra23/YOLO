var moduleId;
var userId;

function moduleHeader(moduleId, userId){
	this.moduleId = moduleId;
	this.userId = userId;
}

$(function(){
	
	// #newModule 클릭 시 새로운 모듈을 생성하는 곳으로 이동
	$("#newModule").click(function(){
		location.href = "AdminModuleAndCourse";
	});
	
	// #costudy 클릭 시 코스의 공동공부에 참여 혹은 해제
	$("#costudy").click(function(){
		console.log("moduleId : " + moduleId + "\nuserId : " + userId);
		$.ajax({
			url: "toggleCostudyModule",
			data: "moduleId=" + moduleId + "&userId=" + userId,
			dataType: "text",
			success: function(result){
				if(result == "add"){
					$("#costudy").attr("src", "images/incostudy.png");
					alert("모듈의 공동공부에 참여되었습니다.");
				}else{
					$("#costudy").attr("src", "images/outcostudy.png");
					alert("모듈의 공동공부에서 해체되었습니다.");
				}
			},
			error: function(){
				alert("모듈의 공동공부 참여 및 해제에 실패하였습니다.");
			}
		});
	});
	
	// #edit 클릭 시 모듈을 수정하는 페이지로 이동
	$("#edit").click(function(){
		location.href = "moduleCurver.do?moduleId=" + moduleId;
	});
	
});
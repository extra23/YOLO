var moduleId;
var userId;

function moduleHeader(moduleId, userId){
	this.moduleId = moduleId;
	this.userId = userId;
}

$(function(){
	
	// #newModule 클릭 시 새로운 모듈을 생성하는 곳으로 이동
	
	// #costudy 클릭 시 코스의 공동공부에 참여 혹은 해제
	$("#costudy").click(function(){
		console.log("moduleId : " + moduleId + "\nuserId : " + userId);
		$.ajax({
			url: "toggleCostudyModule",
			
		});
	});
	
	// #edit 클릭 시 모듈을 수정하는 페이지로 이동
	
});
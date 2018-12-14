var courseId;
var userId;

function courseHeader(courseId, userId){
	this.courseId = courseId;
	this.userId = userId;
}

$(function(){
	
	// newCourse 아이콘 클릭 시 코스 생성 페이지로 이동
	$("#newCourse").click(function(){
		location.href = "AdminCourseAndModule";
	});
	
	// costudy 아이콘 클릭 시 costudy_module 테이블에 해당 courseId와 userId 받아서 추가 (Ajax)
	$("#costudy").click(function(){
		$.ajax({
			url: "toggleCostudyCourse",
			data: "courseId=" + courseId + "&userId=" + userId,
			success: function(result){
				if(result == "add"){
					alert("코스의 공동공부에 추가되었습니다.");
					$("#costudy").attr("src", "images/incostudy.png");
				}else if(result == "remove"){
					$("#costudy").attr("src", "images/outcostudy.png");
					alert("코스의 공동공부에서 해제되었습니다.");
				}
			},
			error: function(){
				alert("코스 공동공부에 추가가 실패되었습니다.");
			}
		});
	});
	
	// edit 아이콘 클릭 시 코스 수정 페이지로 이동
	$("#edit").click(function(){
		location.href = "courseCurver?courseId=" + courseId;
	});
	
})
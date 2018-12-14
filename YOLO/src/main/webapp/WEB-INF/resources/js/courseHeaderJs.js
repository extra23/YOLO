var status = 0;
var courseId;
var userId;

function costudyCourse(courseId, userId){
	this.courseId = courseId;
	this.userId = userId;
}

$(function(){
	
	// newCourse 아이콘 클릭 시 코스 생성 페이지로 이동
	
	// costudy 아이콘 클릭 시 costudy_module 테이블에 해당 courseId와 userId 받아서 추가 (Ajax)
	$("#costudy").click(function(){
		/*alert("courseId : " + courseId + "\nuserId : " + userId);*/
		$.ajax({
			url: "toggleCostudyCourse",
			data: "status=" + status + "&courseId=" + courseId + "&userId=" + userId,
			success: function(result){
				status = Number(result);
				if(Number(result) == 1){
					alert("코스 공동공부에 추가되었습니다.");
				}else {
					alert("코스 공동공부가 해제되었습니다.")
				}
				
			},
			error: function(){
				alert("코스 공동공부에 추가가 실패되었습니다.");
			}
		});
	});
	
	// edit 아이콘 클릭 시 코스 수정 페이지로 이동
	
})
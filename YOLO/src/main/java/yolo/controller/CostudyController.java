package yolo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yolo.service.CoCourseService;
import yolo.service.InterfaceCoCourseService;
import yolo.vo.CoCourseAndCourseVO;

@Controller
public class CostudyController {
	
	@Autowired
	private InterfaceCoCourseService coCourseService;
	
	@ResponseBody
	@RequestMapping("toggleCostudyCourse")
	public String toggleCostudyCourse(int courseId, int userId) {
		
		// 해당 courseId와 userId로 되어 있는 row가 있는지 확인
		CoCourseAndCourseVO old_coCourseAndCourse = coCourseService.readCoCourseByCourseIdAndUserId(new CoCourseAndCourseVO(courseId, userId));
		
		if(old_coCourseAndCourse == null) {
			// row가 없다면 추가
			if(coCourseService.addCoCourse(new CoCourseAndCourseVO(courseId, userId)) > 0) {
				return "add";
			}else {
				return null;	// ajax에서 강제로 error로 보내기
			}
		}else {
			// row가 있다면 삭제
			int costudy_courseId = old_coCourseAndCourse.getCostudy_courseId();
			coCourseService.removeCoCourse(costudy_courseId);
			return "remove";
		}
	}
	
	@ResponseBody
	@RequestMapping("toggleCostudyModule")
	public String toggleCostudyModule(int moduleId, int userId) {
		
	}

}

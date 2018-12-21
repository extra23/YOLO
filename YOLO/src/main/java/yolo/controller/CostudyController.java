package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yolo.service.CoCourseService;
import yolo.service.CoModuleService;
import yolo.service.InterfaceCoCourseService;
import yolo.service.InterfaceCoModuleService;
import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CoCourseListViewVO;
import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListViewVO;

@Controller
public class CostudyController {
	
	@Autowired
	private InterfaceCoCourseService coCourseService;
	
	@Autowired
	private InterfaceCoModuleService coModuleService;
	
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
		
		// 해당 moduleId와 userId로 되어 있는 row가 없는지 확인
		CoModuleAndModuleVO old_coModuleAndModule = coModuleService.readCoModuleAndModuleByModuleIdAndUserId(new CoModuleAndModuleVO(moduleId, userId));
		
		if(old_coModuleAndModule == null) {
			// row가 없다면 추가
			if(coModuleService.addCoModule(new CoModuleAndModuleVO(moduleId, userId)) > 0) {
				return "add";
			}else {
				return null;
			}
		}else {
			// row가 있다면 삭제
			int costudy_moduleId = old_coModuleAndModule.getCostudy_moduleId();
			coModuleService.removeCoModule(costudy_moduleId);
			return "remove";
		}

	}
	
	@RequestMapping("/coCourseListPage")
	public String CoCourseListPage(Model model,int userId) {
		
		//List<CoCourseListVO> 객체.해당 user가 참여한 coStudy_Course 와 como ,  course , module ,user 를 조인하여 리스트 형태로 불러옴 
		List<CoCourseListViewVO> coCourseList = coCourseService.readcoCourseList(userId);
		
		
		model.addAttribute("coCourseList", coCourseList);
		
		
		return "coCourseListPage";
	}
	
	@RequestMapping("/coModuleListPage")
	public String coModuleListpage(Model model,int userId) {
		
		//List<CoModuleListVO> 객체. 해당 user가 참여한 coStudy_Module 와 como , course , module ,user 를 조인하여 리스트 형태로 불러옴 
		List<CoModuleListViewVO> coModuleList = coModuleService.readcoModuleList(userId);
		
		model.addAttribute("coModuleList",coModuleList);
		
		return "coModuleListPage";
	}

}

package yolo.controller;
import java.util.HashMap;
//
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceUserService;
import yolo.service.ModuleRequest;
import yolo.vo.CourseListVO;
import yolo.vo.CourseVO;
import yolo.vo.ModuleListVO;
import yolo.vo.ModuleVO;
import yolo.vo.UserVO;

@Controller
public class SoheeController {

	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceUserService userService;
	
	@RequestMapping("/courseListPage")
	public String courseListPage(Model model) {
		List<CourseListVO> courseListPage = courseService.courseListPage();
		model.addAttribute("courseListPage",courseListPage);
		
		List<ModuleListVO> moduleListPage = moduleService.moduleListPage();
		model.addAttribute("module", moduleListPage);
		
		return "courseListPage";
	}
	
	@RequestMapping("/myCourseList")
	public String myCourseList(Model model, int userId) {
		
		List<CourseListVO> myCourseList = courseService.myCourseList(userId);
		model.addAttribute("myCourseList", myCourseList);
		
		List<ModuleListVO> moduleListPage = moduleService.moduleListPage();
		model.addAttribute("module", moduleListPage);
		
		return "myCourseList";
	}
	
	@RequestMapping("/moduleListPage")
	public String moduleListPage(Model model) {
		
		Map<Integer, ModuleRequest> moduleMap = moduleService.relatedModule();
		model.addAttribute("moduleMap", moduleMap);
		
		return "moduleListPage";
	}
	
	@RequestMapping("/myModuleList")
	public String myModuleList(Model model, int userId) {
		
		Map<Integer, ModuleRequest> moduleMap = moduleService.relatedModule();		
		model.addAttribute("moduleMap", moduleMap);
		return "myModuleList";
	}
	
}


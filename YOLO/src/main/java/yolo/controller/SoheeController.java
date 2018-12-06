package yolo.controller;
//
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.ModuleService;
import yolo.vo.CourseListVO;
import yolo.vo.ModuleListVO;

@Controller
public class SoheeController {

	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@RequestMapping("/courseListPage")
	public String courseListPage(Model model) {
		List<CourseListVO> courseListPage = courseService.courseListPage();
		model.addAttribute("courseListPage",courseListPage);
		return "courseListPage";
	}
	
	@RequestMapping("/moduleListPage")
	public String moduleListPage(Model model) {
		List<ModuleListVO> moduleListPage = moduleService.moduleListPage();
		model.addAttribute("moduleListPage", moduleListPage);
		return "moduleListPage";
	}
}

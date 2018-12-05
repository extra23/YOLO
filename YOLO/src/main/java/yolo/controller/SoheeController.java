package yolo.controller;
//
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yolo.service.InterfaceCourseService;
import yolo.vo.CourseListVO;

@Controller
public class SoheeController {

	@Autowired
	private InterfaceCourseService courseService;
	
	@RequestMapping("/courseListPage")
	public String moduleListPage(Model model) {
		List<CourseListVO> courseListPage = courseService.CourseListPage();
		model.addAttribute("courseListPage",courseListPage);
		return "courseListPage";
	}
}

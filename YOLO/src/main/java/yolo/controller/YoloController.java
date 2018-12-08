package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceUserService;
import yolo.vo.CourseVO;

@Controller
public class YoloController {
	
	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceUserService userService;
	
	// mianBoard(메인 화면)으로 이동
	@RequestMapping("/mainBoard")
	public String getMainBoard() {
		
		
		
		
		return "mainBoard";
	}
	
}
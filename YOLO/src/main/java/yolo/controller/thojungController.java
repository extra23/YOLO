package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yolo.service.InterfaceCoCourseService;
import yolo.service.InterfaceCoModuleService;
import yolo.vo.CoCourseListVO;
import yolo.vo.CoModuleListVO;

@Controller
public class thojungController {

	@Autowired
	private InterfaceCoCourseService coCourseService;
	
	@Autowired 
	private InterfaceCoModuleService coModuleService;
	
	@RequestMapping("/coCourseListPage")
	public String CoCourseListPage(Model model,int userId) {
		
		//List<CoCourseListVO> 객체 .해당 user가 참여한 coStudy_Course 와 como , course , module ,user 를 조인하여 리스트 형태로 불러옴 
		List<CoCourseListVO> coCourseList = coCourseService.readcoCourseList(userId);
				
		model.addAttribute("coCourseList",coCourseList);
		
		
		return "coCourseListPage";
	}
	
	@RequestMapping("/coModuleListPage")
	public String coModuleListpage(Model model,int userId) {
		
		//List<CoModuleListVO> 객체. 해당 user가 참여한 coStudy_Module 와 como , course , module ,user 를 조인하여 리스트 형태로 불러옴 
		List<CoModuleListVO> coModuleList = coModuleService.readcoModuleList(userId);
		
		model.addAttribute("coModuleList",coModuleList);
		
		return "coModuleListPage";
	}
	
	
}

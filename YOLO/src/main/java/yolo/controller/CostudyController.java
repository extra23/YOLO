package yolo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CostudyController {
	
	@ResponseBody
	@RequestMapping("toggleCostudyCourse")
	public String toggleCostudyCourse(int status, int courseId, int userId) {
		System.out.println("toggleCostudyCourse 들어옴");
		if(status == 0) {
			return "1";
		}else {
			return "0";
		}
	}
	

}

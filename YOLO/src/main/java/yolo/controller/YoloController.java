package yolo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YoloController {
	
	// mianBoard(메인 화면)으로 이동
	@RequestMapping("/mainBoard")
	public String getMainBoard() {
		return "mainBoard";
	}
	
}
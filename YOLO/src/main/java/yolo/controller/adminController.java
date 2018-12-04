package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yolo.service.InterfaceUserService;
import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class adminController {
	
	@Autowired
	private InterfaceUserService userService;
	
	// 관리자 사용자 리스트
	@RequestMapping(value="/adminUserList")
	public String readUserList(Model model) {
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("userList", userList);
		return "userList";
	}

	/*// 관리자에 의한 강제 탈퇴페이지로
	@RequestMapping(value="/adminUserListDelete", method = RequestMethod.GET)
		
	// 관리자에 의한 사용자 강제탈퇴
	@RequestMapping(value="/adminUserListDelete", method = RequestMethod.POST)
	*/
}

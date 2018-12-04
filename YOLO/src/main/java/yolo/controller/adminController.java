package yolo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		return "adminUserList";
	}

	// 관리자에 의한 강제 탈퇴페이지로
	@RequestMapping(value="/adminUserListDelete", method = RequestMethod.GET)
	public ModelAndView deleteUserForm(@RequestParam("email") String email, ModelAndView mv) {
		UserVO user = userService.readUSerByEmail(email);
		mv.addObject("user", user);
		return mv;
	}
		
	// 관리자에 의한 사용자 강제탈퇴
	/*@RequestMapping(value="/adminUserListDelete", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("userId") int userId, String email, String password,ModelAndView mv, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		ModelAndView mv = new ModelAndView();
		
		// Map<String, Boolean> errors 객체 생성
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		*/
		
	}

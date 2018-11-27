package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/getUserList.do")
	public String readUserList(Model model) {
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("userList",userList);
		
		return "userList";
	}
	
	@RequestMapping("/addUserForm.do")
	public  ModelAndView addUserForm() {
		return new ModelAndView("login");
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(
			@RequestParam("profileImage") String profileImage,
			@RequestParam("nickName") String nickName,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("p_qId") int p_qId,
			@RequestParam("p_answer") String p_answer
			) {
		UserVO user = new UserVO(profileImage, nickName, email, password, p_qId, p_answer);
		userService.addUser(user);
		return "redirect:/mainBoard";
	}
	
	
}

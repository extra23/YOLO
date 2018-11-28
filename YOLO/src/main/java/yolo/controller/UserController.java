package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/mainBoard")
	public String getMainBoard() {
		System.out.println("여기 들어옴");
		return "mainBoard";
	}
	
	//리스트로 유저의 정보 받아오는 것
	@RequestMapping("/getUserList.do")
	public String readUserList(Model model) {
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("userList",userList);
		
		return "userList";
	}
	
	//회원가입 폼으로 이동
	@RequestMapping("/addUserForm.do")
	public  ModelAndView addUserForm() {
		return new ModelAndView("join");
	}
	
	//회원가입 후 메인으로 이동
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
		return "mainBoard";
	}
	
	//프로필 페이지 띄울 때
	@RequestMapping("getUser.do")
	public String readUser(Model model, @RequestParam("email") String email){
		model.addAttribute("user",userService.readUSerByEmail(email));
		return "userView";
	}
	
	//수정 페이지 열기
	@RequestMapping(value="/modifyUserForm.do",method=RequestMethod.GET)
	public ModelAndView modifyUserForm(@RequestParam("userId") int userId, ModelAndView mv) {
		UserVO user = userService.readUserByUserId(userId);
		mv.addObject("user",user);
		mv.setViewName("userModify");
		return mv;
	}
	//수정해서 프로필 페이지로 넘기기
	@RequestMapping(value = "/modify.do", method=RequestMethod.POST)
	public String modifyUser(String profileImage, String nickName, String password, int p_qId, String p_answer) {
		UserVO user = new UserVO(profileImage, nickName, password,p_qId,p_answer);
		userService.modifyUser(user);
		return "userView";
	}
	
	//유저 탈퇴하고 메인 페이지로 복귀하기
	@RequestMapping(value = "/remove.do/{userId}")
	public String removeUser(@RequestParam("userId") int userId) {
		userService.removeUser(userId);
		
		return "mainBoard";
	}
	
	@RequestMapping(value="uploadTest", method=RequestMethod.GET)
	public String fileuploadForm() {
		return "uploadTest";
	}
	
	@RequestMapping(value="uploadTest", method=RequestMethod.POST)
	public ModelAndView fileupload() {
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
	
}
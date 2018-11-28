package yolo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.exception.InvalidPasswordException;
import yolo.exception.LoginFailException;
import yolo.exception.UserNotFoundException;
import yolo.service.LoginService;
import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class YoloController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ServletContext servletContext;
	
	// mianBoard(메인 화면)으로 이동
	@RequestMapping("/mainBoard")
	public String getMainBoard() {
		return "mainBoard";
	}
	
	// login(로그인 화면)으로 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	// 로그인 후 mainBoard(메인 화면)으로 이동
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response, String email, String password) throws IOException {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		if(email == null || email.isEmpty()) {
			errors.put("email", true);
		}
		if(password == null || password.isEmpty()) {
			errors.put("password", true);
		}
		
		if(errors != null) {
			modelAndView.addObject(errors);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		UserVO user = null;
		
		try {
			user = loginService.loginCheck(email, password);
			request.getSession().setAttribute("authUser", user);
			response.sendRedirect("mainBoard");
			return null;
		} catch (UserNotFoundException e) {
			errors.put("UserNotFound", true);
			modelAndView.addObject(errors);
			modelAndView.setViewName("login");
			return modelAndView;
		} catch (InvalidPasswordException e) {
			errors.put("InvalidPassword", true);
			modelAndView.addObject(errors);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
	}
	
	// 회원가입 폼으로 이동
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "join";
	}
	
	// 회원가입 후 (로그인 하고) 메인으로 이동
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String addUser(@RequestParam("profileImage") String profileImage, @RequestParam("nickName") String nickName, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("p_qId") int p_qId, @RequestParam("p_answer") String p_answer) {
		
		
		UserVO user = new UserVO(profileImage, nickName, email, password, p_qId, p_answer);
		userService.addUser(user);
		
		return "mainBoard";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//리스트로 유저의 정보 받아오는 것
		@RequestMapping("/getUserList.do")
		public String readUserList(Model model) {
			List<UserVO> userList = userService.readUserList();
			model.addAttribute("userList",userList);
			return "userList";
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
	
	//유저의 이메일로 찾아서 searchPage로 넘기는 메소드
	@RequestMapping("/searchUser.do")
	public String searchUser(Model model, @RequestParam("searchWord") String email) {
		List<UserVO> userSearchList = userService.searchUser(email);
		model.addAttribute("userSearchList",userSearchList);
		return "searchPage";
	}
	
}
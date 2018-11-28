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

import yolo.exception.LoginFailException;
import yolo.service.LoginService;
import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/mainBoard.do")
	public String getMainBoard() {
		System.out.println("여기 들어옴");
		return "mainBoard";
	}

	// 리스트로 유저의 정보 받아오는 것
	@RequestMapping("/getUserList.do")
	public String readUserList(Model model) {
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("userList", userList);

		return "userList";
	}

	// 회원가입 폼으로 이동
	@RequestMapping("/addUserForm.do")
	public ModelAndView addUserForm() {
		return new ModelAndView("join");
	}

	// 회원가입 후 메인으로 이동
	@RequestMapping("/addUser.do")
	public String addUser(@RequestParam("profileImage") String profileImage, @RequestParam("nickName") String nickName,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("p_qId") int p_qId, @RequestParam("p_answer") String p_answer) {
		UserVO user = new UserVO(profileImage, nickName, email, password, p_qId, p_answer);
		userService.addUser(user);
		return "mainBoard";
	}

	// 프로필 페이지 띄울 때
	@RequestMapping("getUser.do")
	public String readUser(Model model, @RequestParam("email") String email) {
		model.addAttribute("user", userService.readUSerByEmail(email));
		return "userView";
	}

	// 수정 페이지 열기
	@RequestMapping(value = "/modifyUserForm.do", method = RequestMethod.GET)
	public ModelAndView modifyUserForm(@RequestParam("userId") int userId, ModelAndView mv) {
		UserVO user = userService.readUserByUserId(userId);
		mv.addObject("user", user);
		mv.setViewName("userModify");
		return mv;
	}

	// 수정해서 프로필 페이지로 넘기기
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modifyUser(String profileImage, String nickName, String password, int p_qId, String p_answer) {
		UserVO user = new UserVO(profileImage, nickName, password, p_qId, p_answer);
		userService.modifyUser(user);
		return "userView";
	}

	// 유저 탈퇴하고 메인 페이지로 복귀하기
	@RequestMapping(value = "/remove.do/{userId}")
	public String removeUser(@RequestParam("userId") int userId) {
		userService.removeUser(userId);

		return "mainBoard";
	}

	@RequestMapping(value = "uploadTest", method = RequestMethod.GET)
	public String fileuploadForm() {
		return "uploadTest";
	}

	@RequestMapping(value = "uploadTest", method = RequestMethod.POST)
	public ModelAndView fileupload() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	// 무결성 체크(모르겟다)
	/*
	 * public String processSubmit(HttpServletRequest req, HttpServletResponse resp)
	 * throws IOException {
	 * 
	 * // 1. request로 parameter를 받음(eamil, password) String email =
	 * req.getParameter("email"); String password = req.getParameter("password");
	 * 
	 * // 2. 받아온 paramter의 무결성 체크(비었는지 안비었는지) Map<String, Boolean> errors = new
	 * HashMap<String, Boolean>(); if(email == null || email.isEmpty()) {
	 * errors.put("email", true); } if(password == null || password.isEmpty()) {
	 * errors.put("password", true); } req.setAttribute("errors", errors);
	 * if(!errors.isEmpty()) { return "login"; }
	 * 
	 * // 3. 무결성 체크 후 비지 않았다면 객체 받고 객체의 메소드를 통해서 인증 UserVO userVO =
	 * LoginService.login(email,password); req.getSession().setAttribute("userVO",
	 * userVO); resp.sendRedirect(req.getContextPath() + "/mainBoard"); return null;
	 * }catch(LoginFailException e) {
	 * 
	 * }
	 */
	
	// 로그인
	@RequestMapping(value="/mainBoard.do")
	public ModelAndView login(/*HttpServletRequest req, HashMap hashMap*/) throws Exception{
		ModelAndView mav = new ModelAndView("/mainBoard.do");
		return mav;
		
		//Map<String, Object> map = UserService.
		/*req.getParameter("email");		
		// 로그인 성공시
		if(req.getParameter("email") == null) {
			mav.addObject("msg", "")
		}*/
	}

	// 로그인을 하지 않았을때 로그인하지 않았다고 알려주고 로그인 페이지로 이동
	@RequestMapping(value = "/needLogin.do")
	public ModelAndView needLogin() throws Exception {
		ModelAndView mav = new ModelAndView("/loginWarning");
		mav.addObject("msg", "로그인 후 이용해주시기 바랍니다.");
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "logoutTry.do")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("login");

		ModelAndView mav = new ModelAndView("/logout");
		mav.addObject("msg", "로그아웃되었습니다 빠잉");

		return mav;
	}

}

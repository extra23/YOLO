package yolo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.dao.UserDAO;
import yolo.vo.UserVO;

@Controller
public class LoginoutController {
	
	// 이미 빈으로 등록된 userDAO를 자동 매칭해서 주입함.
	@Autowired
	private UserDAO userDAO;
	
	// 로그인화면
	@RequestMapping("login.do")
	public String login() {
		// webapp/test/login.jsp로 이동
		return "webapp/test/login";
	}
	
	// 로그인 처리
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(String email, String password) {
		ModelAndView mav = new ModelAndView();
		// userVO를 이용해서 email객체를 select 해옴
		UserVO user = userDAO.selectUserList(email);
		
		// email 객체가 존재하지 않을 때의 처리
		if(email == null) {
			throw new LoginFailException("존재하지 않는 사용자");
			}
		
		// email 객체가 존재하지만 객체의 비밀번호와 입력한 비밀번호가 일치하지 않을 때
		if(user.setPassword(password) != password) {
			throw new LoginFailException("비밀번호가 일치하지 않음.");
			}
		
	}

}

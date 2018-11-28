package yolo.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.dao.UserDAO;
import yolo.exception.InvalidPasswordException;
import yolo.exception.LoginFailException;
import yolo.exception.UserNotFoundException;
import yolo.vo.UserVO;

@Service("LoginService")
public class LoginService {
	
	// 이미 빈으로 등록된 userDAO를 자동 매칭해서 주입함.
	@Autowired
	private UserDAO userDAO;
	
	// 로그인화면
	/*@RequestMapping("login.do")
	public String login() {
		// webapp/test/login.jsp로 이동
		return "webapp/test/login";
	}*/
		
	// 로그인 처리
	// @RequestMapping("loginCheck.do")
	public UserVO loginCheck(String email, String password) {
		
		// userVO를 이용해서 email객체를 select 해옴
		UserVO user = userDAO.selectUser(email);
		
		// email 객체가 존재하지 않을 때의 처리
		if(email == null) {
			throw new UserNotFoundException("존재하지 않는 사용자");
		}
		
		// email 객체가 존재하지만 객체의 비밀번호와 입력한 비밀번호가 일치하지 않을 때
		if(!user.getPassword().equals(password)) {
			throw new InvalidPasswordException("비밀번호가 일치하지 않음.");
		}
		
		return user;
		
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 1. session 받아오기
		HttpSession session = req.getSession(false);
				
		// 2. session이 null이 아닌 경우 삭제
		if(session != null) {
			session.invalidate();
		}
				
		// 3. login 페이지로 redirect
		resp.sendRedirect(req.getContextPath() + "/login");
		
		return null;
	}
			
}

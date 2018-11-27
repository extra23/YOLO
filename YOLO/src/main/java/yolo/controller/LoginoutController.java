package yolo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.dao.UserDAO;
import yolo.exception.LoginFailException;
import yolo.service.LoginService;
import yolo.vo.UserVO;

@Controller
public class LoginoutController {
	
	// 무결성 체크11
	@Autowired
	LoginService loginService;
	
	// 이미 빈으로 등록된 userDAO를 자동 매칭해서 주입함.
	@Autowired
	private UserDAO userDAO;

	// 무결성 체크(모르겟다)
	public String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
			// 1. request로 parameter를 받음(eamil, password)
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			// 2. 받아온 paramter의 무결성 체크(비었는지 안비었는지)
			Map<String, Boolean> errors = new HashMap<String, Boolean>();
			if(email == null || email.isEmpty()) {
				errors.put("email", true);
			}
			if(password == null || password.isEmpty()) {
				errors.put("password", true);
			}
			req.setAttribute("errors", errors);
			if(!errors.isEmpty()) {
				return "login";
			}
			
			// 3. 무결성 체크 후 비지 않았다면 객체 받고 객체의 메소드를 통해서 인증
			String login = ModelAndView loginCheck
			
		}

	/*
	 * public boolean preHalder(HttpServletRequest request, HttpServletResponse
	 * response, Object handler)throw Exception{ HttpSession session =
	 * request.getSession(false); }
	 */
}

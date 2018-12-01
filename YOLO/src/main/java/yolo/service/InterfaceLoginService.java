package yolo.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import yolo.vo.UserVO;

public interface InterfaceLoginService {



	public boolean preHandler(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception ;
	public void postHandler(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception ;

	public String login() ;

	public UserVO loginCheck(String email, String password);

	public ModelAndView logout(HttpServletRequest req, HttpServletResponse resp) throws IOException;

	
}

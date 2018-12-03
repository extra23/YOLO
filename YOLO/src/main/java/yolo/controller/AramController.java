package yolo.controller;


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
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfacePQuestionService;
import yolo.service.InterfaceUserService;
import yolo.vo.P_Question;
import yolo.vo.UserVO;


@Controller
public class AramController {
	
	@Autowired
	private InterfacePQuestionService pquestionService;
	
	@Autowired
	private InterfaceUserService userService;
	
	@RequestMapping(value ="/Find_PasswordForm.do", method = RequestMethod.GET)
	public String findPasswordForm(Model model) {
		List<P_Question> qList = pquestionService.readQList();
		model.addAttribute("qList",qList);
		return "find_PasswordForm";
		
	}
	
	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.POST)
	public ModelAndView findPassword(ModelAndView modelAndView, HttpServletRequest request,
			HttpServletResponse response, String email, int p_qId, String p_answer) {
		
		UserVO user = userService.readUSerByEmail(email);
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		
		try {
			if(user == null) {
				System.out.println("사용자가 없습니다.");
				errors.put("noUser", true);
				throw new Exception();
			}
			if(p_qId != user.getP_qId()) {
				errors.put("noP_q", true);
				throw new Exception();
			}	
			if(p_answer != user.getP_answer()) {
			errors.put("noP_answer", true);
			throw new Exception();
			}
		
			response.sendRedirect("find_Password");
			return null;
		} catch(Exception e ) {
			modelAndView.addObject("errors", errors);
			List<P_Question> qList = pquestionService.readQList();
			modelAndView.addObject("qList",qList);
			modelAndView.setViewName("find_PasswordForm");
			return modelAndView;
		}
		
		
	}
}

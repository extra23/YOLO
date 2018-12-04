package yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import yolo.service.InterfaceEmailService;
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

	@Autowired
	private InterfaceEmailService emailService;

	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.GET)
	public String findPasswordForm(Model model) {
		List<P_Question> qList = pquestionService.readQList();
		model.addAttribute("qList", qList);
		return "find_PasswordForm";

	}

	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.POST)
	public void findPassword(Model model, HttpServletRequest request,
			HttpServletResponse response, UserVO user, String email, int pwQId, String pwA) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
//		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		// 이메일이 없을 때
		if (userService.readUSerByEmail(email)==null) {
			out.print("잘못된 이메일입니다.");
			out.close();
			
//			errors.put("noEmail", true);
		
			
		} else {
			UserVO uservo = userService.readUSerByEmail(email);

			
			if (pwQId != uservo.getPwQId()) {
				out.print("잘못된 비밀번호 찾기 질문 입니다.");
				out.close();
				
//				errors.put("noP_q", true);
				
			} else if (pwA != uservo.getPwA()) {
				out.print("잘못된 비밀번호 찾기 질문 답변입니다.");
				out.close();
				
//				errors.put("noP_answer", true);
				
			} else {

				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 8; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				user.setPassword(pw);

				// 비밀번호 변경
				userService.update_pw(email);

				// 비밀번호 변경 메일 발송
				emailService.send_email(user);
				out.println("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
				
				
			}
		}
//		modelAndView.addObject("errors",errors);
		/*
		List<P_Question> qList = pquestionService.readQList();
		request.setAttribute("qList", qList);*/
		
		
		/*
		  UserVO user = userService.readUSerByEmail(email); 
		  Map<String, Boolean> errors = new HashMap<String, Boolean>();
		 
		  
		  try { if(user == null) { System.out.println("사용자가 없습니다.");
		  errors.put("noUser", true); throw new Exception(); } if(p_qId !=
		  user.getP_qId()) { errors.put("noP_q", true); throw new Exception(); }
		  if(p_answer != user.getP_answer()) { errors.put("noP_answer", true); throw
		  new Exception(); }
		  
		  response.sendRedirect("find_Password"); return null; } catch(Exception e ) {
		  modelAndView.addObject("errors", errors); List<P_Question> qList =
		  pquestionService.readQList(); modelAndView.addObject("qList",qList);
		  modelAndView.setViewName("find_PasswordForm"); return modelAndView; }
		 */

	}
}

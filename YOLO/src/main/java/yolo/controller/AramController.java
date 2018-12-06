package yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceEmailService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfacePQuestionService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.ModuleVO;
import yolo.vo.P_Question;
import yolo.vo.TopicVO;
import yolo.vo.UserVO;

@Controller
public class AramController {

	@Autowired
	private InterfacePQuestionService pquestionService;

	@Autowired
	private InterfaceUserService userService;

	@Autowired
	private InterfaceEmailService emailService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;

	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.GET)
	public String findPasswordForm(Model model) {
		List<P_Question> qList = pquestionService.readQList();
		model.addAttribute("qList", qList);
		return "find_PasswordForm";

	}

	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.POST)
	public void findPassword(Model model, HttpServletRequest request, HttpServletResponse response, String email,
			int pwQId, String pwA) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 이메일이 없을 때
		UserVO uservo = userService.readUSerByEmail(email);

		if (uservo == null) {
			out.print("잘못된 이메일입니다.");
			out.close();

		} else {
			if (pwQId != uservo.getPwQId()) {
				out.print("잘못된 비밀번호 찾기 질문 입니다.");
				out.close();

			} else if (!pwA.equals(uservo.getPwA())) {
				System.out.println(pwA + ", " + uservo.getPwA());
				out.print("잘못된 비밀번호 찾기 질문 답변입니다.");
				out.close();

			} else {

				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 8; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				uservo.setPassword(pw);

				// 비밀번호 변경
				userService.update_pw(uservo);

				// 비밀번호 변경 메일 발송
				emailService.send_email(uservo);
				out.println("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();

			}
		}

	}
	
	
	
	//Module And Course 에서 모듈 목록 가져오기
		@RequestMapping("/AdminModuleAndCourse")
		public String mainAdminMC(Model model,HttpServletRequest request, HttpServletResponse response) {
			System.out.println("들어왔나");
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			System.out.println("들어왔나2");
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			System.out.println("들어왔나3");
			model.addAttribute("moduleList",moduleList);
			System.out.println("???");
			return "adminCourseModuleTopic/moduleAndCourse";
		}
		/*
	//moduleCurver - Topic 목록 넘겨주기
		@RequestMapping("/moduleCurver.do")
		public String topicList(Model model, int moduleId) {
			
			List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleId);
			model.addAttribute("topicList",topicList);
			return "adminCourseModuleTopic/moduleCurver";
		}
		/*	
	//moduleCurver - module 커버 내용 불러오기
		@RequestMapping("/AdminModuleAndCourse")
		public ModelAndView moduleCurver(ModelAndView modelAndView, int moduleId) {
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
			modelAndView.addObject("module",module);
			modelAndView.setViewName("moduleCurver");
			return modelAndView;
		}
		*/
}

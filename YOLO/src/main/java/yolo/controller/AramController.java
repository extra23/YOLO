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
import org.springframework.web.bind.annotation.RequestParam;
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
		public String mainAdminMC(Model model,HttpServletRequest request) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			model.addAttribute("moduleList",moduleList);
			return "adminCourseModuleTopic/moduleAndCourse";
		}

	//moduleCurver - module 커버 내용 불러오기
		@RequestMapping("/moduleCurver.do")
		public String moduleCurver(Model model,HttpServletRequest request, int moduleId) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
			
			List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleId);
			
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("topicList",topicList);
			model.addAttribute("module",module);
			return "adminCourseModuleTopic/moduleAndCourse";
		}
		
	//module커버의 내용 수정해주기
		@RequestMapping(value="/moduleModify", method= RequestMethod.POST)
		public String moduleModify(Model model, HttpServletRequest request,int moduleId, String mTitle, String mSummary, @RequestParam("summernote") String mContent) {
			ModuleVO module = new ModuleVO(moduleId, mTitle, mContent, mSummary);
			moduleService.modifyModule(module);
			
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			model.addAttribute("moduleList",moduleList);
			
			
			return "adminCourseModuleTopic/moduleAndCourse";
		}
		
}

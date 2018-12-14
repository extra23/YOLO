 package yolo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceEmailService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfacePagingService;
import yolo.service.InterfacePwdQuestionService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.CourseAndModuleVO;
import yolo.vo.CourseListVO;
import yolo.vo.CourseVO;
import yolo.vo.ModuleAndTopicVO;
import yolo.vo.ModuleVO;
import yolo.vo.PagingVO;
import yolo.vo.PwdQuestionVO;
import yolo.vo.TopicVO;
import yolo.vo.UserVO;

@Controller
public class AramController {

	@Autowired
	private InterfacePwdQuestionService pquestionService;

	@Autowired
	private InterfaceUserService userService;

	@Autowired
	private InterfaceEmailService emailService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfacePagingService pagingService;

	@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.GET)
	public String findPasswordForm(Model model) {
		List<PwdQuestionVO> qList = pquestionService.readQList();
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
	
	//summernote imageUpload하기
	@RequestMapping("/imgUpload")
	public void getFile(MultipartFile uploadFile, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("imgUpload controller");
		
		UUID uid = UUID.randomUUID();
		String fileName = uid + "_" +uploadFile.getOriginalFilename(); // 파일명
		System.out.println("파일명 : " + fileName);
		
		String uploadPath = "WEB-INF/resources/images/";
		String sDownPath = request.getServletContext().getRealPath(uploadPath);
		System.out.println("sDownPath : " + sDownPath);

		File file = new File(sDownPath + fileName);

		try {
			uploadFile.transferTo(file);

			String imgPath = request.getContextPath() + "/images/";
			JSONObject json = new JSONObject();
			
			json.put("url", imgPath + fileName);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

		
		//여기서 부터 코스입니다
		
	//module And Course 에서 코스 가져오기
		@RequestMapping("/AdminCourseAndModule")
		public String mainAdminC(Model model, HttpServletRequest request) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<CourseVO> courseList =  courseService.readCourseByUserId(userId);
			model.addAttribute("courseList",courseList);
			
			return "adminCourseModuleTopic/moduleAndCourse4";
		}
		
	//course -> 코스 커버 페이지 가져오기
		@RequestMapping("/courseCurver")
		public String courseCurver(Model model, HttpServletRequest request, int courseId) {
			
			CourseVO course = courseService.readCourseByCourseId(courseId);
			
			model.addAttribute("course",course);
			return mainAdminC(model, request);
		}
		
		
	//course의 페이지네이션
		@RequestMapping("/PagingModule")
		public String pagingModule(@RequestParam(value="curPage",defaultValue="1") int curPage, HttpServletRequest request,Model model, int courseId) {
					
			CourseAndModuleVO courseAndModule = new CourseAndModuleVO();
			
			// CourseAndModuleVO의 course
			CourseVO course = courseService.readCourseByCourseId(courseId);
			courseAndModule.setCourse(course);
			
			// CourseAndModuleVO의 user
			courseAndModule.setUser(userService.readUserByUserId(course.getUserId()));
			
			// CourseAndModuleVO의 ModuleAndTopicList
			List<ModuleVO> moduleList1 = pagingService.test(courseId);
			System.out.println("moduleList1 : " + moduleList1);
			List<ModuleAndTopicVO> moduleAndTopicList = new ArrayList<ModuleAndTopicVO>();
			for(int i = 0; i < moduleList1.size(); i++) {
				ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO();
				List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleList1.get(i).getModuleId());
				moduleAndTopic.setModule(moduleList1.get(i));
				moduleAndTopic.setUser(userService.readUserByUserId(moduleList1.get(i).getUserId()));
				moduleAndTopic.setTopicList(topicList);
				moduleAndTopicList.add(moduleAndTopic);
			}
			courseAndModule.setModuleAndTopicList(moduleAndTopicList);

			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<CourseVO> courseList = courseService.readCourseByUserId(userId);
						
						
			int listCnt = pagingService.selectTotalPagignM(courseId);
			
			PagingVO paging = new PagingVO(listCnt, curPage);
						

			courseAndModule.setStartIndex(paging.getStartIndex());
			courseAndModule.setCntPerPage(5);
						
			List<CourseAndModuleVO> moduleList = pagingService.selectPagingM(courseAndModule);
			System.out.println(moduleList);
						
			model.addAttribute("courseList",courseList);
			model.addAttribute("listCnt",listCnt);
			model.addAttribute("paging",paging);		
			/*model.addAttribute("course",course);*/
			model.addAttribute("courseAndModule", courseAndModule);
						
			return "adminCourseModuleTopic/moduleAndCourse5";
						
		}

	//course의 모듈 리스트 가져오기
		@RequestMapping("/moduleList")
		public String ModuleList(int courseId,  HttpServletRequest request, Model model) {
				
			//moduleId가 아무것도 안 들어왔을 때.. 오류처리 해줘야겠지
				
			int curPage = 1;
				
			return pagingModule(curPage, request, model, courseId);
		}
			
		
	//course의 커버 페이지 수정해주기
		@RequestMapping("/courseModify")
		public String courseModify(Model model, HttpServletRequest request, int courseId, String cTitle, String cSummary, @RequestParam("summernote") String cContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			
			CourseVO course = new CourseVO(userId, courseId, cTitle, cContent, cSummary);
			courseService.modifyCourse(course);
			
			return courseCurver(model, request, courseId);
		}
	
	//course의 커버 내용 삭제하기
		@RequestMapping("/courseDelete")
		public String courseDelete(Model model, HttpServletRequest request, int courseId) {
			courseService.removeCourse(courseId);
			
			return mainAdminC(model, request);
		}
		
	//course의 커버 페이지 만들어주기
		@RequestMapping("/courseCreate")
		public String courseCreate(Model model, HttpServletRequest request,String cTitle, String cSummary, @RequestParam("summernote") String cContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			
			CourseVO course = new CourseVO(userId, 0, cTitle, cContent, cSummary);
			courseService.addCourse(course);			
	
			return mainAdminC(model, request);
		}
	
	
		
		
}

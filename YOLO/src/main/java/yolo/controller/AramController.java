 package yolo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import yolo.vo.CourseVO;
import yolo.vo.ModuleVO;
import yolo.vo.PagingVO;
import yolo.vo.PwdQuestionVO;
import yolo.vo.TestVO;
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
	
	
	
	//Module And Course 에서 모듈 목록 가져오기
		@RequestMapping("/AdminModuleAndCourse")
		public String mainAdminM(Model model,HttpServletRequest request) {
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
		
	
	//topicModify/Delete Form
		@RequestMapping("/topicModifyDeleteForm")
		public String topicModifyDeleteForm(Model model,HttpServletRequest request, int topicId) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			
			
			TopicVO topic = topicService.readTopicByTopicId(topicId);
			
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("topic",topic);
			return "adminCourseModuleTopic/moduleAndCourse2";
		}
		
	//topicModify
		@RequestMapping(value="topicModify", method=RequestMethod.POST)
		public String topicModify(Model model, HttpServletRequest request,int topicId,String tTitle, @RequestParam("summernote") String tContent) {
			TopicVO topicvo = new TopicVO(topicId, tTitle, tContent);
			topicService.modifyTopic(topicvo);
			
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			model.addAttribute("moduleList",moduleList);
			
			TopicVO topic = topicService.readTopicByTopicId(topicId);
			model.addAttribute("topic",topic);
			
			return "adminCourseModuleTopic/moduleAndCourse2";
			
		}
		
	//topicDelete
		@RequestMapping("topicDelete")
		public String topicDelete(Model model, HttpServletRequest request,int topicId) {
			topicService.removeTopic(topicId);
			
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			model.addAttribute("moduleList",moduleList);
			
			return "adminCourseModuleTopic/moduleAndCourse";
			
		
		}
		
	//topicWriteForm
		@RequestMapping("topicWriteForm")
		public String topicWriteForm(Model model,HttpServletRequest request, int moduleId) {
			
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
			
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("module",module);
			return "adminCourseModuleTopic/moduleAndCourse3";
		}
		
	//topicWrite
		@RequestMapping(value="topicWirte",method=RequestMethod.POST)
		public String topicWrite(Model model, HttpServletRequest request,int moduleId, String tTitle, @RequestParam("summernote") String tContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			TopicVO topicvo = new TopicVO(moduleId, userId, tTitle, tContent);
					
			topicService.addTopic(topicvo);
			
			
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			model.addAttribute("moduleList",moduleList);
			
			return "adminCourseModuleTopic/moduleAndCourse";
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
		
	//course -> cuver에서 쓸 코스와 module리스트 가져오기
		@RequestMapping("/courseCurver.do")
		public String courseCurver(Model model, HttpServletRequest request, int courseId) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<CourseVO> courseList =  courseService.readCourseByUserId(userId);
			
			CourseVO course = courseService.readCourseByCourseId(courseId);
			
			List<ModuleVO> moduleList = moduleService.readModuleListByCourseId(courseId);
			
			model.addAttribute("courseList",courseList);
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("course",course);
			return "adminCourseModuleTopic/moduleAndCourse4";
		}
		
	//course의 커버 페이지 수정해주기
		@RequestMapping("/courseModify")
		public String courseModify(Model model, HttpServletRequest request, int courseId, String cTitle, String cSummary, @RequestParam("summernote") String cContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			
			CourseVO course = new CourseVO(userId, courseId, cTitle, cContent, cSummary);
			courseService.modifyCourse(course);
			
			List<CourseVO> courseList =  courseService.readCourseByUserId(userId);
			model.addAttribute("courseList",courseList);
			
			return "adminCourseModuleTopic/moduleAndCourse4";
		}
		
	//course의 커버 페이지 만들어주기
		@RequestMapping("/courseCreate")
		public String courseCreate(Model model, HttpServletRequest request,String cTitle, String cSummary, @RequestParam("summernote") String cContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			
			CourseVO course = new CourseVO(userId, 0, cTitle, cContent, cSummary);
			courseService.addCourse(course);
			
			List<CourseVO> courseList =  courseService.readCourseByUserId(userId);
			model.addAttribute("courseList",courseList);
			
	
			return "adminCourseModuleTopic/moduleAndCourse4";
		}
		
		
	//PagingTest
		@RequestMapping("/PagingTopic")
		public String pagingTopic(@RequestParam(value="curPage",defaultValue="1") int curPage, Model model, int moduleId) {
			
			if(curPage ==0) {
				curPage =1;
			}
			System.out.println("모듈: "+moduleId + curPage);
			TestVO test = new TestVO(moduleId);
			
			int listCnt = pagingService.selectTotalPaging(moduleId);
			System.out.println("listCnt: "+ listCnt+"curPage"+curPage);
			PagingVO paging = new PagingVO(listCnt, curPage);
			System.out.println(paging);
			
			System.out.println("listCnt: "+ listCnt+"curPage"+curPage);
			test.setStartIndex(paging.getStartIndex());
			test.setCntPerPage(paging.getPageSize());
			
			List<TopicVO> topicList = pagingService.selectPaging(test);
			
			model.addAttribute("topicList",topicList);
			model.addAttribute("listCnt",listCnt);
			model.addAttribute("paging",paging);		
			
			return "adminCourseModuleTopic/moduleAndCourse1";
			
		}
		
	//TopicLsit
		@RequestMapping("/topicList")
		public String topicList(int moduleId, HttpServletRequest request, Model model) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
			
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
			
			List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleId);
			
		
			
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("topicList",topicList);
			model.addAttribute("module",module);
			
			int curPage = 1;
			
			return pagingTopic(curPage, model, moduleId);
		}
		
		
}

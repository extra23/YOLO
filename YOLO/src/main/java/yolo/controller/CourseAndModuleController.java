package yolo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.CourseService;
import yolo.service.InterfaceCoCourseService;
import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfacePagingService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CourseAndModuleVO;
import yolo.vo.CourseVO;
import yolo.vo.ModuleAndTopicVO;
import yolo.vo.ModuleVO;
import yolo.vo.PagingVO;
import yolo.vo.TopicVO;
import yolo.vo.UserVO;

@Controller
public class CourseAndModuleController {
	
	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceUserService userService;
	
	@Autowired
	private InterfacePagingService pagingService;
	
	@Autowired
	private InterfaceCoCourseService coCourseService;
	
	private CourseAndModuleVO makeObj(int courseId) {
		
		CourseAndModuleVO courseAndModule = new CourseAndModuleVO();
		
		// CourseAndModuleVO의 course
		CourseVO course = courseService.readCourseByCourseId(courseId);
		courseAndModule.setCourse(course);
		
		// CourseAndModuleVO의 user
		courseAndModule.setUser(userService.readUserByUserId(course.getUserId()));
		
		// CourseAndModuleVO의 ModuleAndTopicList
		List<ModuleVO> moduleList = moduleService.readModuleListByCourseId(courseId);
		List<ModuleAndTopicVO> moduleAndTopicList = new ArrayList<ModuleAndTopicVO>();
		for(int i = 0; i < moduleList.size(); i++) {
			ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO();
			List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleList.get(i).getModuleId());
			moduleAndTopic.setModule(moduleList.get(i));
			moduleAndTopic.setUser(userService.readUserByUserId(moduleList.get(i).getUserId()));
			moduleAndTopic.setTopicList(topicList);
			moduleAndTopicList.add(moduleAndTopic);
		}
		courseAndModule.setModuleAndTopicList(moduleAndTopicList);
		
		return courseAndModule;
		
	}
	
	private void checkCostudyCourse(ModelAndView mav, HttpServletRequest request, int courseId) {
		UserVO user = (UserVO)request.getSession().getAttribute("authUser");
		if(user != null) {
			CoCourseAndCourseVO coCourseAndCourse = coCourseService.readCoCourseByCourseIdAndUserId(new CoCourseAndCourseVO(courseId, user.getUserId()));
			if(coCourseAndCourse == null) {
				mav.addObject("costudy_courseId", 0);
			}else {
				mav.addObject("costudy_courseId", coCourseAndCourse.getCostudy_courseId());
			}
		}
	}
	
	private void checkHistory(ModelAndView mav, HttpServletRequest request, int topicId) {
		//UserVO user = (UserVO) 
	}

	@RequestMapping("coursePage")
	public ModelAndView getCoursePage(HttpServletRequest request, int courseId) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("courseAndModule", makeObj(courseId));
		
		checkCostudyCourse(mav, request, courseId);
		
		mav.setViewName("courseModuleTopic/course");
		
		return mav;
		
	}
	
	@RequestMapping("moduleInCoursePage")
	public ModelAndView getModuleInCoursePage(HttpServletRequest request, int courseId, int moduleId) {
		
		ModelAndView mav = new ModelAndView();
		CourseAndModuleVO courseAndModule = makeObj(courseId);
		
		checkCostudyCourse(mav, request, courseId);
		
		mav.addObject("courseAndModule", courseAndModule);
		ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO();
			moduleAndTopic.setModule(moduleService.readModuleByModuleId(moduleId));
		mav.addObject("moduleAndTopic", moduleAndTopic);
		mav.setViewName("courseModuleTopic/moduleInCourse");
		
		return mav;
		
	}
	
	@RequestMapping("topicInCoursePage")
	public ModelAndView getTopicInCoursePage(HttpServletRequest request, int courseId, int moduleId, int topicId) {
		
		ModelAndView mav = new ModelAndView();
		CourseAndModuleVO courseAndModule = makeObj(courseId);
		
		checkCostudyCourse(mav, request, courseId);
		
		mav.addObject("courseAndModule", courseAndModule);
		ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO();
			moduleAndTopic.setModule(moduleService.readModuleByModuleId(moduleId));
		mav.addObject("moduleAndTopic", moduleAndTopic);
		mav.addObject("topic", topicService.readTopicByTopicId(topicId));
		mav.setViewName("courseModuleTopic/topicInCourse");
		
		return mav;
		
	}

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
		List<ModuleVO> moduleList = pagingService.selectPagingM(courseId);
		List<ModuleAndTopicVO> moduleAndTopicList = new ArrayList<ModuleAndTopicVO>();
		for(int i = 0; i < moduleList.size(); i++) {
			ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO();
			List<TopicVO> topicList = topicService.readTopicListByModuleId(moduleList.get(i).getModuleId());
			moduleAndTopic.setModule(moduleList.get(i));
			moduleAndTopic.setUser(userService.readUserByUserId(moduleList.get(i).getUserId()));
			moduleAndTopic.setTopicList(topicList);
			moduleAndTopicList.add(moduleAndTopic);
		}
		courseAndModule.setModuleAndTopicList(moduleAndTopicList);

		int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
		List<CourseVO> courseList = courseService.readCourseByUserId(userId);
					
					
		int listCnt = pagingService.selectTotalPagignM(courseId);
		
		PagingVO paging = new PagingVO(listCnt, curPage);
					

		paging.setPageSize(10);
		courseAndModule.setStartIndex(paging.getStartIndex());
		courseAndModule.setCntPerPage(paging.getPageSize());
		
					
					
		model.addAttribute("courseList",courseList);
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("paging",paging);		
		model.addAttribute("course",course);
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

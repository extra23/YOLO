package yolo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceModuleService;
import yolo.service.InterfacePagingService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.ModuleAndTopicVO;
import yolo.vo.ModuleVO;
import yolo.vo.PagingVO;
import yolo.vo.TopicVO;
import yolo.vo.UserVO;

@Controller
public class ModuleAndTopicController {
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceUserService userService;
	
	@Autowired
	private InterfacePagingService pagingService;

	// module 페이지로 이동
	@RequestMapping("/modulePage")
	public ModelAndView getModulePage(int moduleId) {
		ModelAndView mav = new ModelAndView();
		
		ModuleVO module = moduleService.readModuleByModuleId(moduleId);
		List<TopicVO> topicList = topicService.readTopicListByModuleId(module.getModuleId());
		UserVO user = userService.readUserByUserId(module.getUserId());
		
		mav.addObject("moduleAndTopic", new ModuleAndTopicVO(module, user, topicList));
		mav.setViewName("courseModuleTopic/module");
		
		return mav;
	}
	
	// tTitle 클릭 시 topic 페이지로 이동
	@RequestMapping("/topicPage")
	public ModelAndView getTopicPage(int moduleId, int topicIndex) {
		System.out.println(topicIndex);
		
		ModelAndView mav = new ModelAndView();
		
		ModuleVO module = moduleService.readModuleByModuleId(moduleId);
		List<TopicVO> topicList = topicService.readTopicListByModuleId(module.getModuleId());
		UserVO user = userService.readUserByUserId(module.getUserId());
		
		ModuleAndTopicVO moduleAndTopic = new ModuleAndTopicVO(module, user, topicList);
		
		mav.addObject("moduleAndTopic", moduleAndTopic);
		mav.addObject("topic", moduleAndTopic.getTopicList().get(topicIndex));
		mav.setViewName("courseModuleTopic/topic");
		
		return mav;
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
		@RequestMapping("/moduleCurver")
		public String moduleCurver(Model model,HttpServletRequest request, int moduleId) {
			
			
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
			
			model.addAttribute("module",module);
			return mainAdminM(model, request);
		}
		
	//module 커버 내용 추가해주기
		@RequestMapping(value="/moduleInsert")
		public String moduleInsert(Model model, HttpServletRequest request, String mTitle, String mSummary, @RequestParam("summernote") String mContent) {
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			
			ModuleVO module = new ModuleVO(mTitle, mContent, mSummary, userId);
			moduleService.addModule(module);
			
			
			return mainAdminM(model, request);
		}
		
	//module커버의 내용 수정해주기
		@RequestMapping(value="/moduleModify", method= RequestMethod.POST)
		public String moduleModify(Model model, HttpServletRequest request,int moduleId, String mTitle, String mSummary, @RequestParam("summernote") String mContent) {
			ModuleVO module = new ModuleVO(moduleId, mTitle, mContent, mSummary);
			moduleService.modifyModule(module);
			
			return moduleCurver(model, request, moduleId);
		}
	//module커버의 내용 삭제하기
		@RequestMapping("/moduleDelete")
		public String moduleDelte(int moduleId, Model model, HttpServletRequest request) {
			moduleService.removeModule(moduleId);
			
			return mainAdminM(model, request);
		}
		
		
	//PagingTest
		@RequestMapping("/PagingTopic")
		public String pagingTopic(@RequestParam(value="curPage",defaultValue="1") int curPage, HttpServletRequest request,Model model, int moduleId) {
			
			int userId = ((UserVO)request.getSession().getAttribute("authUser")).getUserId();
			List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
				
			
			TopicVO topic = new TopicVO(moduleId);
				
			int listCnt = pagingService.selectTotalPaging(moduleId);
			PagingVO paging = new PagingVO(listCnt, curPage);
				
			paging.setPageSize(10);
			topic.setStartIndex(paging.getStartIndex());
			topic.setCntPerPage(paging.getPageSize());
			
			System.out.println(paging);
				
			List<TopicVO> topicList = pagingService.selectPaging(topic);
				
			ModuleVO module = moduleService.readModuleByModuleId(moduleId);
				
			model.addAttribute("moduleList",moduleList);
			model.addAttribute("topicList",topicList);
			model.addAttribute("listCnt",listCnt);
			model.addAttribute("paging",paging);		
			model.addAttribute("module",module);
				
			return "adminCourseModuleTopic/moduleAndCourse1";
				
		}
			
	//TopicLsit
		@RequestMapping("/topicList")
		public String topicList(int moduleId,  HttpServletRequest request, Model model) {
				
			//moduleId가 아무것도 안 들어왔을 때.. 오류처리 해줘야겠지
				
			int curPage = 1;
				
			return pagingTopic(curPage, request, model, moduleId);
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
			
			return topicModifyDeleteForm(model, request, topicId);
			
		}
		
	//topicDelete
		@RequestMapping("topicDelete")
		public String topicDelete(Model model, HttpServletRequest request,int topicId) {
			topicService.removeTopic(topicId);
			
			return mainAdminM(model, request);
			
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
			
			int curPage =1;
			
			return pagingTopic(curPage, request, model, moduleId);
		}
	
	
}

package yolo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.CourseService;
import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.CourseAndModuleVO;
import yolo.vo.CourseVO;
import yolo.vo.ModuleAndTopicVO;
import yolo.vo.ModuleVO;
import yolo.vo.TopicVO;

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

	@RequestMapping("coursePage")
	public ModelAndView getCoursePage(int courseId) {
		
		ModelAndView mav = new ModelAndView();
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
		
		return null;
		
	}
	
}

package yolo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.ModuleAndTopicVO;
import yolo.vo.ModuleVO;
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
	
	
}

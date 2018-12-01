package yolo.controller;

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
public class ModuleAndViewController {
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceUserService userService;

	// mainModule 페이지로 이동
	@RequestMapping("/mainModule")
	public ModelAndView getMainModule(int moduleId) {
		ModelAndView mav = new ModelAndView();
		
		ModuleVO module = moduleService.readModuleByModuleId(moduleId);
		List<TopicVO> topicList = topicService.readTopicListGroupByModuleId(module.getModuleId());
		UserVO user = userService.readUserByUserId(module.getUserId());
		
		mav.addObject("moduleAndTopic", new ModuleAndTopicVO(module, user, topicList));
		mav.setViewName("mainModule");
		
		return mav;
	}
	
}

package yolo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import yolo.dao.ModuleDAO;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.ModuleVO;
import yolo.vo.UserVO;

@Controller
public class sohyunController {

	@Autowired
	private ModuleDAO moduleDAO;

	@Autowired
	private InterfaceUserService userService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceTopicService topicService;

	

	/*@RequestMapping(value="/moduleInsert")
	public String moduleInsert(Model model, HttpServletRequest req, String mTitle, String mSummary, @RequestParam("summernote") String mContent) {
		int userId = ((UserVO)req.getSession().getAttribute("authUser")).getUserId();
		List<ModuleVO> moduleList = moduleService.readModuleListByUserId(userId);
		ModuleVO module = new ModuleVO(mTitle, mContent, mSummary, userId);
		moduleService.addModule(module);
		
		
		model.addAttribute("moduleList",moduleList);
		
		return "adminCourseModuleTopic/moduleAndCourse";
	}*/
	

}
	

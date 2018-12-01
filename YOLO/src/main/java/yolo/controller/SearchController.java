package yolo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.SearchVO;
import yolo.vo.UserVO;

@Controller
public class SearchController {
	
	@Autowired
	private InterfaceUserService userService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceCourseService courseService;

	// 검색하는 메소드
	@RequestMapping("/searchUser.do")
	public String searchUser(Model model, @RequestParam("searchWord") String email,
			@RequestParam("searchWord") String tTitle, @RequestParam("searchWord") String mTitle,
			@RequestParam("searchWord") String cTitle) {
		// user email 검색
		List<UserVO> userSearchList = userService.searchUser(email);
		int userSearchCount = userService.countBySearch(email);

		// topic title 검색
		List<SearchVO> topicSearchList = topicService.searchTopic(tTitle);
		int topicSearchCount = topicService.countBySearch(tTitle);

		// module title 검색
		List<SearchVO> moduleSearchList = moduleService.searchModule(mTitle);
		int moduleSearchCount = moduleService.countBySearch(mTitle);

		// course title 검색
		List<SearchVO> courseSearchList = courseService.searchCourse(cTitle);
		int courseSearchCount = courseService.countBySearch(cTitle);

		// user email검색 결과
		model.addAttribute("userSearchList", userSearchList);
		model.addAttribute("userSearchCount", userSearchCount);

		// topic title검색 결과
		model.addAttribute("topicSearchList", topicSearchList);
		model.addAttribute("topicSearchCount", topicSearchCount);

		// module title 검색 결과
		model.addAttribute("moduleSearchList", moduleSearchList);
		model.addAttribute("moduleSearchCount", moduleSearchCount);

		// course title 검색 결과
		model.addAttribute("courseSearchList", courseSearchList);
		model.addAttribute("courseSearchCount", courseSearchCount);

		// 검색 페이지로 돌아가기
		return "searchPage";
	}

}

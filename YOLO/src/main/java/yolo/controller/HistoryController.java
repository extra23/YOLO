package yolo.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.InterfaceHistoryService;
import yolo.service.InterfaceTopicService;
import yolo.service.InterfaceUserService;
import yolo.vo.HistoryVO;
import yolo.vo.UserVO;

@Controller
public class HistoryController {
	
	@Autowired
	private InterfaceHistoryService historyService;
	
	@Autowired
	private InterfaceTopicService topicService;
	
	@Autowired
	private InterfaceUserService userService;
	
	// 눈 아이콘 클릭시 봤어요, 안봤어요
	@ResponseBody
	@RequestMapping("toggleHistory")
	public String addToggleHistory(int topicId, int userId) {
		
		System.out.println("들어옴");
		
		HistoryVO old_history = historyService.readHistoryByTopicIdAndUserId(new HistoryVO(topicId, userId));
		
		if(old_history == null) {
			// row가 없다면 추가
			if(historyService.addHistory(new HistoryVO(topicId, userId)) > 0) {
				return "add";
			}else {
				// ajax에서 강제로 error로 보내기
				return null;
			}
		}else {
			// row가 있다면 삭제
			int removeHistoryId = old_history.getHistoryId();
			historyService.removeHistory(removeHistoryId);
			return "remove";
		}
		
		
	}
	

	// 내가 봤어요! 한 페이지로 이동
	/*@RequestMapping("/historyPage")
	public ModelAndView getHistoryPage(int userId) {
		ModelAndView mav = new ModelAndView();
		
		List<HistoryVO> historyList = historyService.readHistoryByUserId(userId);
		historyList = historyService.readHistoryByUserId(userId);
		UserVO user = userService.readUserByUserId(userId);
		
		mav.addObject("history", historyList);
		mav.setViewName("myHistoryPage");
		
		return mav;
	}*/
	
	// topic 봤어요 한 사람들 리스트
	/*@RequestMapping("/topicHistoryPage")
	public ModelAndView getTopicHistoryPage(int historyId, String email, String nickName) {
		ModelAndView mav = new ModelAndView();
		
		HistoryVO history = historyService.readHistoryByHistoryId(historyId);
		List<HistoryVO> historyList = historyService.readHistoryByHistoryId(historyList);
		
		mav.addObject("history", historyList);
		mav.setViewName("topicHistoryPage");
		
		return mav;
		
	}*/
	

}

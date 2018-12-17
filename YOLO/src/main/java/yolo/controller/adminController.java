package yolo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.dao.UserDAO;
import yolo.exception.AdminInvalidPasswordException;
import yolo.exception.DuplicatedPasswordException;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.service.AdminService;
import yolo.service.DeleteService;
import yolo.service.InterfaceAdminService;
import yolo.service.InterfacePwdQuestionService;
import yolo.service.InterfaceUserService;
import yolo.service.UserService;
import yolo.vo.PagingVO;
import yolo.vo.PwdQuestionVO;
import yolo.vo.UserVO;

@Controller
public class adminController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private InterfaceUserService userService;
	
	@Autowired
	private InterfaceAdminService adminService;	
	
	@Autowired
	private InterfacePwdQuestionService pwdQuestionService;
	
	// 관리자 사용자 리스트
	@RequestMapping(value="adminUserList")
	public String readUserList(Model model, @RequestParam(defaultValue="1") int curPage) {
		
		int listCnt = userService.readUserList().size();
		PagingVO paging = new PagingVO(listCnt, curPage);
		/*paging.setStartIndex(0);*/
		paging.setPageSize(10);
		
		List<UserVO> list = userService.readUserListByLimit(paging);
		
		model.addAttribute("list", list);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("curPage", curPage);
        model.addAttribute("pagination", paging);
        
		return "adminUserList";
	}
	
	// 관리자에 의한 강제 수정페이지로
	@RequestMapping(value="/adminUserModify", method = RequestMethod.GET)
	public ModelAndView modifyUserForm(int userId, ModelAndView mv) {
		List<PwdQuestionVO> qList = pwdQuestionService.readQList();
		mv.addObject("qList", qList);
		
		UserVO user = userService.readUserByUserId(userId);
		mv.addObject("user", user);
		mv.setViewName("adminUserModify");
		return mv;
	}
	
	// 수정해서 프로필 페이지로 넘기기.
	@RequestMapping(value="/adminUserModify", method = RequestMethod.POST)
	public ModelAndView modifyUser(@RequestParam("userId") int userId, int adminId, String profileImage, String thumbnail, String email, String nickName, String newPwd1, String newPwd2, String oldPwd, String ad_password, int pwQId, String pwA, HttpServletRequest req, Model model) {

		ModelAndView mv = new ModelAndView();
		UserVO user = userDAO.selectUser(userId);

		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		if (newPwd1 == null || newPwd1.isEmpty() || newPwd2 == null || newPwd2.isEmpty()) {
			newPwd1 = oldPwd;
			newPwd2 = oldPwd;
		}

		if (!newPwd1.equals(newPwd2)) {
			errors.put("notEqualNewPwd", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			return mv;
		}
		
		if(oldPwd == null || oldPwd.isEmpty()) {
			errors.put("oldPwd", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			return mv;
		}
		
		if (ad_password == null || ad_password.isEmpty()) {
			errors.put("ad_password", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			System.out.println(ad_password + "ad_password");
			return mv;
		}
		
		if (!errors.isEmpty()) {
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserModify");
			return mv;
		}

		UserVO newUser = new UserVO(userId, profileImage, thumbnail, nickName, email, newPwd1, pwQId, pwA);
		
		try {
			adminService.modifyUser(user, adminId, oldPwd, ad_password);
		} catch (UserNotFoundException e) {
			errors.put("userNotFound", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			System.out.println("userNotFound");
			return mv;
		} catch (DuplicatedPasswordException e) {
			errors.put("duplicatedPassword", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			System.out.println("duplicatedPassword");
			return mv;
		} catch (InvalidPasswordException e) {
			errors.put("invalidPassword", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			System.out.println("invalidPassword");
			return mv;
		}catch(AdminInvalidPasswordException e) {
			errors.put("adminInvalidPassword", true);
			mv.addObject("errors", errors);
			mv.setViewName("adminUserModify");
			req.setAttribute("user", user);
			System.out.println("AdminInvalidPassword");
			return mv;
		}
		
		mv.addObject("newUser", newUser);
		System.out.println(user + "user1");
		mv.setViewName("adminUserList");
		
		// 사용자가 존재하고 비밀번호가 일치한다면 db의 정보를 수정.
		userDAO.updateUser(user);
		req.getSession().setAttribute("user", user);
		System.out.println(user + "user2");
	
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("list", userList);
		return mv;
	}

	// 관리자에 의한 강제 탈퇴페이지로
	@RequestMapping(value="/adminUserDelete", method = RequestMethod.GET)
	public ModelAndView deleteUserForm(int userId, ModelAndView mv) {
		UserVO user = adminService.readUserByUserId(userId);
		mv.addObject("user", user);
		return mv;
	}
		
	// 관리자에 의한 사용자 강제탈퇴
	@RequestMapping(value="/adminUserDelete", method = RequestMethod.POST)
	public ModelAndView deleteUser(@RequestParam("userId") int userId, int adminId, String u_password, String ad_password,HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		
		ModelAndView mv = new ModelAndView();
		UserVO user = userService.readUserByUserId(userId);
		
		// Map<String, Boolean> errors 객체 생성
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		//req.setAttribute("errors", errors);
		
		if(u_password == null || u_password.isEmpty()) {
			errors.put("u_password", true);
		}
		if(ad_password == null || ad_password.isEmpty()) {
			errors.put("ad_password", true);
		}
		if (!errors.isEmpty()) {
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserDelete");
			return mv;
		}
		
		try {
			adminService.deleteUser(userId, adminId, u_password, ad_password);
		}catch(UserNotFoundException e) {
			System.out.println("usernotfound");
			errors.put("UserNotFound", true);
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserDelete");
			return mv;
		}catch(InvalidPasswordException e) {
			errors.put("invalidPassword", true);
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserDelete");
			return mv;	
		}catch(DuplicatedPasswordException e) {
			errors.put("DuplicatedPassword", true);
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserDelete");
			return mv;
		}catch(AdminInvalidPasswordException e) {
			errors.put("adminInvalidPassword", true);
			mv.addObject("errors", errors);
			mv.addObject("user", user);
			mv.setViewName("adminUserDelete");
			return mv;
		}
		
		HttpSession session = req.getSession(false);
		if(session == null) {
			// 잘못된 접근시 에러페이지로 보냄..
			resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
			}
		
		
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("list", userList);
		
		mv.setViewName("adminUserList");
		
	// adminUserList 페이지로 돌아가기
	return mv;
	}
}

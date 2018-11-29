package yolo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.almom.util.MediaUtils;
import com.almom.util.UploadFileUtils;

import yolo.exception.InvalidPasswordException;
import yolo.exception.LoginFailException;
import yolo.exception.UserNotFoundException;
import yolo.service.LoginService;
import yolo.service.UserService;
import yolo.vo.UserVO;

@Controller
public class YoloController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	/*@Autowired
	private ServletContext servletContext;*/
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// mianBoard(메인 화면)으로 이동
	@RequestMapping("/mainBoard")
	public String getMainBoard() {
		return "mainBoard";
	}
	
	// login(로그인 화면)으로 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	// 로그인 후 mainBoard(메인 화면)으로 이동
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response, String email, String password) throws IOException {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		if(email == null || email.isEmpty()) {
			errors.put("email", true);
		}
		if(password == null || password.isEmpty()) {
			errors.put("password", true);
		}
		
		if(!errors.isEmpty()) {
			modelAndView.addObject("errors",errors);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
		UserVO user = null;
		System.out.println(email + "/" + password);
		
		try {
			user = loginService.loginCheck(email, password);
			request.getSession().setAttribute("authUser", user);
			response.sendRedirect("mainBoard");
			return null;
		} catch (UserNotFoundException e) {
			errors.put("UserNotFound", true);
			modelAndView.addObject("errors", errors);
			modelAndView.setViewName("login");
			return modelAndView;
		} catch (InvalidPasswordException e) {
			errors.put("InvalidPassword", true);
			modelAndView.addObject("errors", errors);
			modelAndView.setViewName("login");
			return modelAndView;
		}
		
	}
	
	// 회원가입 폼으로 이동
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		return "join";
	}
	
	// 회원가입 후 (로그인 하고) 메인으로 이동
	@RequestMapping(value="join", method=RequestMethod.POST)
	public void addUser(HttpServletRequest request, HttpServletResponse response, MultipartFile file, @RequestParam("nickName") String nickName, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("p_qId") int p_qId, @RequestParam("p_answer") String p_answer) throws Exception {
		
		String profileImage = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		UserVO user = new UserVO(profileImage, nickName, email, password, p_qId, p_answer);
		userService.addUser(user);
		
		login(new ModelAndView(), request, response, user.getEmail(), user.getPassword());
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// String uploadPath = servletContext.getRealPath("/resources/images/");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		System.out.println(uploadPath);
		
		return savedName;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		// String uploadPath = request.getServletContext().getRealPath("/resources/images/");
		
		System.out.println("originalName : " + file.getOriginalFilename());
		
		ResponseEntity<String> img_path = new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
		String user_imgPath = (String)img_path.getBody();
		
		System.out.println(user_imgPath);
		
		UserVO vo = new UserVO();
		vo.setProfileImage(user_imgPath);
		
		UserVO id = (UserVO)session.getAttribute("login");
		System.out.println(id.getUserId());
		
		System.out.println("file name : " + user_imgPath);
		
		return user_imgPath;
		
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		// String uploadPath = servletContext.getRealPath("/resources/images/");
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		System.out.println("FILE NAME : " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		// String uploadPath = servletContext.getRealPath("/resources/images/");
		
		System.out.println("delete file : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		org.springframework.http.MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	//리스트로 유저의 정보 받아오는 것
		@RequestMapping("/getUserList.do")
		public String readUserList(Model model) {
			List<UserVO> userList = userService.readUserList();
			model.addAttribute("userList",userList);
			return "userList";
		}
	
	//프로필 페이지 띄울 때
	@RequestMapping("getUser.do")
	public String readUser(Model model, @RequestParam("email") String email){
		model.addAttribute("user",userService.readUSerByEmail(email));
		return "userView";
	}
	
	//수정 페이지 열기
	@RequestMapping(value="/modifyUserForm.do",method=RequestMethod.GET)
	public ModelAndView modifyUserForm(@RequestParam("userId") int userId, ModelAndView mv) {
		UserVO user = userService.readUserByUserId(userId);
		mv.addObject("user",user);
		mv.setViewName("userModify");
		return mv;
	}
	//수정해서 프로필 페이지로 넘기기
	@RequestMapping(value = "/modify.do", method=RequestMethod.POST)
	public String modifyUser(String profileImage, String nickName, String password, int p_qId, String p_answer) {
		UserVO user = new UserVO(profileImage, nickName, password,p_qId,p_answer);
		userService.modifyUser(user);
		return "userView";
	}
	
	//유저 탈퇴하고 메인 페이지로 복귀하기
	@RequestMapping(value = "/remove.do/{userId}")
	public String removeUser(@RequestParam("userId") int userId) {
		userService.removeUser(userId);
		return "mainBoard";
	}
	
	//유저의 이메일로 찾아서 searchPage로 넘기는 메소드
	@RequestMapping("/searchUser.do")
	public String searchUser(Model model, @RequestParam("searchWord") String email) {
		List<UserVO> userSearchList = userService.searchUser(email);
		model.addAttribute("userSearchList",userSearchList);
		return "searchPage";
	}
	
	/*// 로그인
	@RequestMapping(value="/mainBoard.do")
	public ModelAndView login() throws Exception{
		ModelAndView mav = new ModelAndView("/mainBoard.do");
		return mav;
					
					//Map<String, Object> map = UserService.
					req.getParameter("email");		
					// 로그인 성공시
					if(req.getParameter("email") == null) {
						mav.addObject("msg", "")
					}
	}*/

	// 로그인을 하지 않았을때 로그인하지 않았다고 알려주고 로그인 페이지로 이동
	/*@RequestMapping(value = "/needLogin.do")
	public ModelAndView needLogin() throws Exception {
		ModelAndView mav = new ModelAndView("/loginWarning");
			mav.addObject("msg", "로그인 후 이용해주시기 바랍니다.");
			return mav;
		}*/

	// 로그아웃
	@RequestMapping(value = "logoutTry.do")
	public String logout(HttpServletRequest request) throws Exception {
		

		request.getSession().removeAttribute("authUser");

		

		return "mainBoard";
		
	}
	
}
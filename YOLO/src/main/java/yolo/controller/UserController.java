package yolo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.almom.util.UploadFileUtils;

import yolo.exception.DuplicatedPasswordException;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.service.DeleteService;
import yolo.service.InterfaceCoCourseService;
import yolo.service.InterfaceCoModuleService;
import yolo.service.InterfaceCourseService;
import yolo.service.InterfaceEmailService;
import yolo.service.InterfaceLoginService;
import yolo.service.InterfaceModuleService;
import yolo.service.InterfacePwdQuestionService;
import yolo.service.InterfaceUserService;
import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CoCourseListVO;
import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CourseVO;
import yolo.vo.ModuleVO;
import yolo.vo.PwdQuestionVO;
import yolo.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private InterfaceUserService userService;

	@Autowired
	private InterfaceLoginService loginService;
	
	@Autowired
	private DeleteService deleteService;
	
	@Autowired
	private InterfacePwdQuestionService pwdQuestionService;
	
	@Autowired
	private InterfaceModuleService moduleService;
	
	@Autowired
	private InterfaceCourseService courseService;
	
	@Autowired
	private InterfaceCoModuleService coModuleService;
	
	@Autowired
	private InterfaceCoCourseService coCourseService;
	
	@Autowired
	private InterfaceEmailService emailService;

	@Resource(name="uploadPath")
	private String uploadPath;
	
	// mianBoard(메인 화면)으로 이동
	@RequestMapping("/mainBoard")
	public ModelAndView getMainBoard() {
		
		ModelAndView mav = new ModelAndView();
		
		List<CourseVO> courseBox = courseService.courseListBox();
		mav.addObject("courseBoxView", courseBox);
	
		List<ModuleVO> moduleBox = moduleService.moduleListBox();
		mav.addObject("moduleBoxView", moduleBox);
		
		List<UserVO> userList = userService.readUserList();
		mav.addObject("userList", userList);
		
		mav.setViewName("mainBoard");
		
		return mav;
		
	}

	// login(로그인 화면)으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}

	// 로그인 후 mainBoard(메인 화면)으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response,
			String email, String password) throws IOException {

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		if (email == null || email.isEmpty()) {
			errors.put("email", true);
		}
		if (password == null || password.isEmpty()) {
			errors.put("password", true);
		}

		if (!errors.isEmpty()) {
			modelAndView.addObject("errors", errors);
			modelAndView.setViewName("login");
			return modelAndView;
		}

		UserVO user = null;

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
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(Model model) {
		//회원가입 폼으로 이동시 비밀번호 힌트 질문을 데이터로 받아온다.
		List<PwdQuestionVO> qList = pwdQuestionService.readQList();
		model.addAttribute("qList",qList);
		return "join";
	}

	// 회원가입 후 (로그인 하고) 메인으로 이동
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, HttpServletResponse response, MultipartFile file, String email, String nickName, String password, String confirmPassword, int pwQId, String pwA) throws Exception {

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		
		// 값이 비었는지 확인
		if(email == null || email.isEmpty()) {
			errors.put("email", true);
		}
		
		if(nickName == null || nickName.isEmpty()) {
			errors.put("nickName", true);
		}
		
		if(password == null || password.isEmpty()) {
			errors.put("password", true);
		}
		
		if(confirmPassword == null || confirmPassword.isEmpty()) {
			errors.put("confirmPassword", true);
		}
		
		if(pwQId == 0) {
			errors.put("pwQId", true);
		}
		
		if(pwA == null || pwA.isEmpty()) {
			errors.put("pwA", true);
		}
		
		// password와 confirmPassword 일치 여부
		if(!password.equals(confirmPassword)) {
			errors.put("passwordNotMatch", true);
		}
		
		if(!errors.isEmpty()) {
			System.out.println("들어옴");
			List<PwdQuestionVO> qList = pwdQuestionService.readQList();
			model.addAttribute("qList", qList);
			model.addAttribute("errors", errors);
			return "join";
		}

		String[] fileNameArr = new String[2];
		if(!file.getOriginalFilename().isEmpty()) {
			fileNameArr = UploadFileUtils.uploadFile(request.getServletContext().getRealPath(uploadPath), file.getOriginalFilename(), file.getBytes());
		}
		
		UserVO user = new UserVO(fileNameArr[0], fileNameArr[1], nickName, email, password, pwQId, pwA);
		userService.addUser(user);

		login(new ModelAndView(), request, response, user.getEmail(), user.getPassword());
		return null;
		
	}
	
	/*private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// String uploadPath = servletContext.getRealPath("/resources/images/");
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		System.out.println(uploadPath);

		return savedName;
	}*/

	/*@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String uploadAjax(MultipartFile file, String str, HttpSession session, HttpServletRequest request,
			Model model) throws Exception {

		// String uploadPath =
		// request.getServletContext().getRealPath("/resources/images/");

		System.out.println("originalName : " + file.getOriginalFilename());

		ResponseEntity<String> img_path = new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String user_imgPath = (String) img_path.getBody();

		System.out.println("user_imgPath : " + user_imgPath);

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

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
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
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		System.out.println("deleteFile 함수");

		// String uploadPath = servletContext.getRealPath("/resources/images/");

		System.out.println("delete file : " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		System.out.println("formatName : " + formatName);

		org.springframework.http.MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 12);
			System.out.println("front : " + front);
			String end = fileName.substring(14);
			System.out.println("end : " + end);
			System.out.println("뭔가 : " + uploadPath + (front + end).replace('/', File.separatorChar));
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}*/

	// 프로필 페이지 띄울 때
	@RequestMapping("/userView")
	public ModelAndView getUserView(int userId) {
		
		ModelAndView mav = new ModelAndView();
		
		// 넘겨주어야 할 객체 : User, Module, Course, CoModuleAndModule
		// User 객체
		UserVO user = userService.readUserByUserId(userId);
		// List<ModuleVO> 객체 (해당 user가 생성한 Module만 리스트 형태로 불러옴)
		List<ModuleVO> moduleList = moduleService.readModuleListByUserId(user.getUserId());
		// List<CourseVO> 객체 (해당 user가 생성한 Module만 리스트 형태로 불러옴)
		List<CourseVO> courseList = courseService.readCourseByUserId(user.getUserId());
		// List<CoModuleAndModule> 객체 (해당 user가 참여한 coStudy_Module 객체와 Module 객체를 조인한 CoModuleAndModule 객체를 리스트 형태로 불러옴)
		List<CoModuleAndModuleVO> coModuleAndModuleList = coModuleService.readJoinModule(userId);
		// List<CoCourseAndCourse> 객체 (해당 user가 참여한 coStudy_Course 객체와 Course 객체를 조인한 CoCourseAndCourse 객체를 리스트 형태로 불러옴)
		List<CoCourseAndCourseVO> coCourseAndCourseList = coCourseService.readJoinCourse(userId);
		
		mav.addObject("user", user);
		mav.addObject("moduleList", moduleList);
		mav.addObject("courseList", courseList);
		mav.addObject("coModuleAndModuleList", coModuleAndModuleList);
		mav.addObject("coCourseAndCourseList",coCourseAndCourseList);
		mav.setViewName("userView");
		
		return mav;
		
	}

	// 리스트로 유저의 정보 받아오는 것
	@RequestMapping("/getUserList.do")
	public String readUserList(Model model) {
		List<UserVO> userList = userService.readUserList();
		model.addAttribute("userList", userList);
		return "userList";
	}

	// 수정 페이지 열기
	@RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
	public ModelAndView modifyUserForm(@RequestParam("userId") int userId, ModelAndView mv) {
		UserVO user = userService.readUserByUserId(userId);
		List<PwdQuestionVO> qList = pwdQuestionService.readQList();
		mv.addObject("qList", qList);
		mv.addObject("user", user);
		mv.setViewName("userModify");
		return mv;
	}

	// 수정해서 프로필 페이지로 넘기기
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public ModelAndView modifyUser(HttpServletRequest request, MultipartFile file, int userId, String email, String nickName, String newPwd1, String newPwd2, String oldPwd, int pwQId, String pwA) throws IOException, Exception {
 
		ModelAndView mav = new ModelAndView();

		Map<String, Boolean> errors = new HashMap<String, Boolean>();

		/*if (newPwd1 == null || newPwd1.isEmpty() || newPwd2 == null || newPwd2.isEmpty()) {
			newPwd1 = oldPwd;
			newPwd2 = oldPwd;
		}*/

		if (oldPwd == null || oldPwd.isEmpty()) {
			errors.put("oldPwd", true);
			mav.addObject("errors", errors);
			mav.setViewName("userModify");
			List<PwdQuestionVO> qList = pwdQuestionService.readQList();
			mav.addObject("qList", qList);
			return mav;
		}

		if (newPwd1 != null && newPwd2 != null && !newPwd1.equals(newPwd2)) {
			errors.put("notEqualNewPwd", true);
			mav.addObject("errors", errors);
			mav.setViewName("userModify");
			List<PwdQuestionVO> qList = pwdQuestionService.readQList();
			mav.addObject("qList", qList);
			return mav;
		}
		
		String[] fileNameArr = new String[2];
		System.out.println("file : " + file.getOriginalFilename());
		if(file.getOriginalFilename() != "") {
			System.out.println("들어옴");
			fileNameArr = UploadFileUtils.uploadFile(request.getServletContext().getRealPath(uploadPath), file.getOriginalFilename(), file.getBytes());
		}

		System.out.println("userId : " + userId);
		UserVO user = new UserVO(userId, fileNameArr[0], fileNameArr[1], nickName, email, newPwd1, pwQId, pwA);
		System.out.println("user : " + user.toString());
		try {
			userService.modifyUser(user, oldPwd);
		} catch (UserNotFoundException e) {
			System.out.println("catch1");
			errors.put("userNotFound", true);
			mav.addObject("errors", errors);
			mav.setViewName("userModify");
			return mav;
		} catch (DuplicatedPasswordException e) {
			System.out.println("catch2");
			errors.put("duplicatedPassword", true);
			mav.addObject("errors", errors);
			mav.setViewName("userModify");
			return mav;
		} catch (InvalidPasswordException e) {
			System.out.println("catch3");
			errors.put("invalidPassword", true);
			mav.addObject("errors", errors);
			mav.setViewName("userModify");
			return mav;
		}

		/*mav.addObject("user", user);
		mav.setViewName("userView");*/

		request.getSession().setAttribute("authUser", user);

		return getUserView(userId);
	}

	// 로그아웃
	@RequestMapping(value="logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("authUser");
		response.sendRedirect("mainBoard");
	}
	
	// 유저 탈퇴페이지로 
	@RequestMapping(value="/deleteUser", method = RequestMethod.GET)
	public ModelAndView deleteUserForm(@RequestParam("userId") int userId, ModelAndView mv) {	
		UserVO user = userService.readUserByUserId(userId);
		mv.addObject("user", user);
		return mv;
	}
		
	
	// 유저 탈퇴하고 메인 페이지로 복귀하기
		@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
		public String deleteUser(@RequestParam("userId") int userId, String email, String password, ModelAndView mv, HttpServletRequest req, HttpServletResponse resp) throws IOException {
			ModelAndView mav = new ModelAndView();
			
			// Map<String, Boolean> errors 객체 생성
			Map<String, Boolean> errors = new HashMap<String, Boolean>();
			req.setAttribute("errors", errors);
			
			
			try {
				deleteService.delete(req, resp, userId, password);
				//UserDAO userDAO = (UserDAO)session.getAttribute("email");
				}catch(InvalidPasswordException e) {
					errors.put("invalidPassword", true);
					mav.addObject("errors", errors);
					return "deleteUser";
				}catch(UserNotFoundException e) {
					errors.put("UserNotFound", true);
					mav.addObject("errors", errors);
					return "deleteUser";
				}
				HttpSession session = req.getSession(false);
				if(session == null) {
					// 잘못된 접근시 에러페이지로 보냄.
					resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
					}
				// 세션 삭제
				session.invalidate();
			
			// mainBoard 페이지로 돌아가기
			return "mainBoard";
		}
		
		
	//비밀번호 찾기 폼
		@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.GET)
		public String findPasswordForm(Model model) {
			List<PwdQuestionVO> qList = pwdQuestionService.readQList();
			model.addAttribute("qList", qList);
			return "find_PasswordForm";

		}
	//비밀번호 찾기
		@RequestMapping(value = "/Find_PasswordForm.do", method = RequestMethod.POST)
		public void findPassword(Model model, HttpServletRequest request, HttpServletResponse response, String email,
				int pwQId, String pwA) throws IOException {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();

			// 이메일이 없을 때
			UserVO uservo = userService.readUSerByEmail(email);

			if (uservo == null) {
				out.print("잘못된 이메일입니다.");
				out.close();

			} else {
				if (pwQId != uservo.getPwQId()) {
					out.print("잘못된 비밀번호 찾기 질문 입니다.");
					out.close();

				} else if (!pwA.equals(uservo.getPwA())) {
					System.out.println(pwA + ", " + uservo.getPwA());
					out.print("잘못된 비밀번호 찾기 질문 답변입니다.");
					out.close();

				} else {

					// 임시 비밀번호 생성
					String pw = "";
					for (int i = 0; i < 8; i++) {
						pw += (char) ((Math.random() * 26) + 97);
					}
					uservo.setPassword(pw);

					// 비밀번호 변경
					userService.update_pw(uservo);

					// 비밀번호 변경 메일 발송
					emailService.send_email(uservo);
					out.println("이메일로 임시 비밀번호를 발송하였습니다.");
					out.close();

				}
			}

		}
		
}

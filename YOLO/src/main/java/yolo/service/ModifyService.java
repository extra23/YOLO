/*package yolo.service;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import yolo.dao.UserDAO;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.vo.UserVO;

@Service("ModifyService")
public class ModifyService {

	// 이미 빈으로 등록된 userDAO를 자동 매칭해서 주입함.
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/modifyUserForm.do")
	public int updateUser(String email, String profileImage, String nickName, String oldPwd, String newPwd, int p_qId,
			String p_answer) {
		
		int modify = 0;

		// userVO를 이용해서 email객체를 select 해옴
		UserVO user = userDAO.selectUser(email);

		if (user == null) {
			throw new UserNotFoundException("없는 멤버");
		}

		// user객체와 입력받은 비밀번호를 비교해서 잘못된 비밀번호를 입력했다면
		if (!user.getPassword().equals(oldPwd)) {
			throw new InvalidPasswordException("잘못된 비밀번호");
		}

		user.setProfileImage(profileImage);
		user.setNickName(nickName);
		user.setPassword(newPwd);
		user.setP_qId(p_qId);
		user.setP_answer(p_answer);
		modify = userDAO.updateUser(user);
		
		return modify;
	}

	// 비밀번호 수정
	public String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserVO user = (UserVO) req.getSession().getAttribute("authUser");

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);

		String oldPwd = req.getParameter("oldPwd");
		String newPwd = req.getParameter("newPwd");

		if (oldPwd == null || oldPwd.isEmpty()) {
			errors.put("oldPwd", true);
		}

		if (newPwd == null || newPwd.isEmpty()) {
			errors.put("newPwd", true);
		}

		if (oldPwd.equals(newPwd)) {
			errors.put("samePwd", true);
		}

		if (!errors.isEmpty()) {
			return "userView";
		}

		return null;
	}
}
*/
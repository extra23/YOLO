package yolo.service;

import java.sql.Connection;

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
	public int updateUser(String email, String profileImage, String nickName, String oldPwd, String newPwd, int p_qId, String p_answer) {
		
		// userVO를 이용해서 email객체를 select 해옴
		UserVO user = userDAO.selectUser(email);
		
		if(user == null) {
			throw new UserNotFoundException("없는 멤버");
		}
		
		// user객체와 입력받은 비밀번호를 비교해서 잘못된 비밀번호를 입력했다면
		if(!user.getPassword().equals(oldPwd)) {
			throw new InvalidPasswordException("잘못된 비밀번호1");
		}
		
		user.setProfileImage(profileImage);
		user.setNickName(nickName);
		user.setPassword(newPwd);
		user.setP_qId(p_qId);
		user.setP_answer(p_answer);
		
		return Modify;
	}
}

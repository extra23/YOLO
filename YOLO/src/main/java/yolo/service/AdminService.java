package yolo.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.lang.reflect.Parameter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.CourseDAO;
import yolo.dao.ModuleDAO;
import yolo.dao.TopicDAO;
import yolo.dao.UserDAO;
import yolo.exception.AdminInvalidPasswordException;
import yolo.exception.DuplicatedPasswordException;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.vo.UserVO;

@Service("AdminService")
public class AdminService implements InterfaceAdminService{

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TopicDAO topicDAO;
	
	@Autowired
	private ModuleDAO moduleDAO;
	
	@Autowired
	private CourseDAO courseDAO;
	
	
	public void addUser(UserVO user) {
		userDAO.insertUser(user);
	}

	public UserVO readUserByUserId(int userId) {
		return userDAO.selectUser(userId);
	}

	public UserVO readUSerByEmail(String email) {
		return userDAO.selectUser(email);
	}

	public List<UserVO> readUserList() {
		return userDAO.selectUserList();
	}

	public void modifyUser(UserVO newUser, int adminId, String oldPwd, String ad_password) {
		// 새로 받아온 newUser 객체의 userId를 통해서 db에서 user 객체를 받아옴
		UserVO oldUser = userDAO.selectUser(newUser.getUserId());
		UserVO admin = userDAO.selectUser(adminId);
				
		// db에서 받아온 객체가 비었는지 확인
		if(oldUser == null) {
			throw new UserNotFoundException("존재하지 않는 사용자");
		}
				
		// oldPwd와 newPwd 비교
		if(newUser.getPassword() != null && oldUser.getPassword().equals(newUser.getPassword())) {
			throw new DuplicatedPasswordException("비밀번호 중복");
		}
				
		// 받아온 객체가 비어있지 않다면(사용자가 존재한다면) 받아온 사용자의 원래 비밀번호와 확인을 위한 oldPwd 비교
		if(!oldUser.getPassword().equals(oldPwd)) {
			throw new InvalidPasswordException("유효하지 않은 비밀번호");
		}
		
		// 관리자 비밀번호가 맞는지 확인
		if(!admin.getPassword().equals(ad_password)) {
			throw new AdminInvalidPasswordException("관리자 비밀번호 틀림");
		}
				
		// 사용자가 존재하고 비밀번호가 일치한다면 db의 정보를 수정
		userDAO.updateUser(newUser);
	}     

	public int update_pw(UserVO user) {
		return userDAO.update_pw(user);
	}

	public void deleteUser(int userId, int adminId, String u_password, String ad_password){
		
		// userId를 이용해서 UserVO 객체를 DB에서 select 해옴.
		UserVO admin = userDAO.selectUser(adminId);
		UserVO user = userDAO.selectUser(userId);
		
		// 사용자 있는지 확인
		if(user == null) {
			throw new UserNotFoundException("없는 멤버");
		}
	
		// (사용자)작성한 비밀번호와 select해온 UserVO 객체의 비밀번호가 일치하는지 확인
		if(!user.getPassword().equals(u_password)) {
			// 일치하지 않는 다면 InvalidException을 생성
			throw new InvalidPasswordException("비밀번호 일치 하지 않음.");
		}
		
		// (관리자)작성한 비밀번호와 select해온 UserVO 객체의 비밀번호가 일치하는지 확인
		/*if(ad_password == null || ad_password.isEmpty()){
			// 일치하지 않는 다면 InvalidException을 생성
			throw new InvalidPasswordException("비밀번호 일치 하지 않음.");
		}else {
			// 비밀번호가 일치하면 DAO들을 통해서 내용 삭제
			userDAO.deleteUser(userId);
			topicDAO.deleteTuser(userId);
			moduleDAO.deleteMuser(userId);
			courseDAO.deleteCuser(userId);	
		}*/
		
		if(!admin.getPassword().equals(ad_password)) {
			throw new AdminInvalidPasswordException("비밀번호 일치 하지 않음.");
		}
		
		
		userDAO.deleteUser(userId);
		topicDAO.deleteTuser(userId);
		moduleDAO.deleteMuser(userId);
		courseDAO.deleteCuser(userId);
		
		
	}

	
}

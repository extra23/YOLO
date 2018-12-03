package yolo.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.CourseDAO;
import yolo.dao.ModuleDAO;
import yolo.dao.TopicDAO;
import yolo.dao.UserDAO;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.vo.UserVO;

@Service("DeleteService")
public class DeleteService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private TopicDAO topicDAO;
	
	@Autowired
	private ModuleDAO moduleDAO;
	
	@Autowired
	private CourseDAO courseDAO;
	
	public String select(int userId) {
		return null;
	}
	
	public String delete(HttpServletRequest req, HttpServletResponse resp, int userId, String password, int topicId, int moduleId, int courseId)throws IOException{
		
		// userId를 이용해서 UserVO 객체를 DB에서 select 해옴
		UserVO user = userDAO.selectUser(userId);

		// 사용자 있는지 확인
		if(user == null) {
			throw new UserNotFoundException("없는 멤버");
		}
	
		// 작성한 비밀번호와 select해온 UserVO 객체의 비밀번호가 일치하는지 확인
		if(!user.getPassword().equals(password)) {
			// 일치하지 않는 다면 InvalidException을 생성
			throw new InvalidPasswordException("비밀번호 일치 하지 않음.");
		}else {
			// 비밀번호가 일치하면 DAO들을 통해서 내용 삭제
			userDAO.deleteUser(userId);
			topicDAO.deleteTopic(topicId);
			moduleDAO.deleteModule(moduleId);
			courseDAO.deleteCourse(courseId);	
		}
		
		// 입력할 때 사용하는 생성자
		//UserDAO writeUser = new UserVO(userId, email, password, topicId, moduleId, courseId, password);
		
		
		// 사용자 권한이 있는지 확인
		/*if(!user.getUserId().equals(writeUser.getUserId())) {
			throw new UserNotFoundException("사용자 권한 없음.");
		}*/
		
		return "mainBoard";
	}

}

package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceUserDAO;
import yolo.exception.DuplicatedPasswordException;
import yolo.exception.InvalidPasswordException;
import yolo.exception.UserNotFoundException;
import yolo.vo.PagingVO;
import yolo.vo.UserVO;

@Service("UserService")
public class UserService implements InterfaceUserService {
	
	@Autowired
	InterfaceUserDAO userDAO;

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

	public void modifyUser(UserVO newUser, String oldPwd) {
		// 새로 받아온 newUser 객체의 userId를 통해서 db에서 user 객체를 받아옴
		UserVO oldUser = userDAO.selectUser(newUser.getUserId());
		
		// db에서 받아온 객체가 비었는지 확인
		if(oldUser == null) {
			throw new UserNotFoundException("존재하지 않는 사용자");
		}
		
		// oldPwd와 newPwd 비교
		System.out.println("new User password : " + newUser.getPassword());
		if(newUser.getPassword().isEmpty() || newUser.getPassword() == null) {
			System.out.println("들어옴");
			newUser.setPassword(oldPwd);
		}else{
			if(oldUser.getPassword().equals(newUser.getPassword())) {
				throw new DuplicatedPasswordException("비밀번호 중복");
			}
		}
		
		// 받아온 객체가 비어있지 않다면(사용자가 존재한다면) 받아온 사용자의 원래 비밀번호와 확인을 위한 oldPwd 비교
		if(!oldUser.getPassword().equals(oldPwd)) {
			throw new InvalidPasswordException("유효하지 않은 비밀번호");
		}
		
		// 사용자가 존재하고 비밀번호가 일치한다면 db의 정보를 수정
		if(newUser.getPassword() == null) {
			newUser.setPassword(oldPwd);
		}
		userDAO.updateUser(newUser);
	}

	public void removeUser(int userId) {
		userDAO.deleteUser(userId);

	}

	public List<UserVO> searchUser(String email) {
		return userDAO.searchUser(email);
	}
	
	public int countBySearch(String email) {
		return userDAO.countBySearch(email);
	}

	public int update_pw(UserVO user) {
		
		return userDAO.update_pw(user);
	}

	public List<UserVO> readUserListByLimit(PagingVO paging) {
		return userDAO.selectUserListByLimit(paging);
	}

}

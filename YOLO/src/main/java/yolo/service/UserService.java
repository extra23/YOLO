package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceUserDAO;
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

	public void modifyUser(UserVO user) {
		userDAO.updateUser(user);

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

}

package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceUserDAO;
import yolo.vo.UserVO;

@Service("UserService")
public class UserService implements InterfaceUserService {
	
	@Autowired
	private InterfaceUserDAO userDAO;

	public void addUser(UserVO user) {
		
	}

	public UserVO readUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<UserVO> readUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyUser(UserVO user) {
		// TODO Auto-generated method stub

	}

	public void removeUser(int user) {
		// TODO Auto-generated method stub

	}

}

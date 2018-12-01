package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.UserVO;

@Repository("UserDAO")
public class UserDAO implements InterfaceUserDAO {
	
	@Autowired
	private InterfaceUserMapper userMapper;

	public void insertUser(UserVO user) {
		userMapper.insertUser(user);
	}

	public UserVO selectUser(int userId) {
		UserVO user = userMapper.selectUserByUserId(userId);
		return user;
	}
	
	public UserVO selectUser(String email) {
		UserVO user = userMapper.selectUserByEmail(email);
		return user;
	}

	public List<UserVO> selectUserList() {
		List<UserVO> userList = userMapper.selectUserList();
		return userList;
	}

	public void updateUser(UserVO user) {
		userMapper.updateUser(user);
	}

	public void deleteUser(int userId) {
		userMapper.deleteUser(userId);
	}

	public List<UserVO> searchUser(String email) {
		List<UserVO> userList = userMapper.searchUser(email);
		return userList;
	}
	
	public int countBySearch(String email) {
		int count = userMapper.countBySearch(email);
		return count;
	}

}

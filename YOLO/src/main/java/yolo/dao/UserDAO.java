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
		return userMapper.selectUserByUserId(userId);
	}
	
	public UserVO selectUser(String email) {
		return userMapper.selectUserByEmail(email);
	}

	public List<UserVO> selectUserList() {
		return userMapper.selectUserList();
	}

	public void updateUser(UserVO user) {
		userMapper.updateUser(user);
	}

	public void deleteUser(int userId) {
		userMapper.deleteUser(userId);
	}

}

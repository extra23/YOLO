package yolo.service;

import java.util.List;

import yolo.vo.UserVO;

public interface InterfaceUserService {
	
	public void addUser(UserVO user);
	
	public UserVO readUserByUserId(int userId);
	
	public UserVO readUSerByEmail(String email);
	
	public List<UserVO> readUserList();
	
	public void modifyUser(UserVO user, String oldPwd);
	
	public void removeUser(int user);

	public List<UserVO> searchUser(String email);
	
	public int countBySearch(String email);
	
	public int update_pw(String email);
}

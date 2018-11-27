package yolo.service;

import java.util.List;

import yolo.vo.UserVO;

public interface InterfaceUserService {
	
	public void addUser(UserVO user);
	
	public UserVO readUser(int userId);
	
	public List<UserVO> readUserList();
	
	public void modifyUser(UserVO user);
	
	public void removeUser(int user);

}

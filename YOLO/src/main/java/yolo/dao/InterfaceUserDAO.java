package yolo.dao;

import java.util.List;

import yolo.vo.UserVO;

public interface InterfaceUserDAO {
	
	public void insert(UserVO user);
	
	public UserVO selectUser(int userId);
	
	public List<UserVO> selectUserList();
	
	public void update(UserVO user);
	
	public void delete(int userId);

}

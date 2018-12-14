package yolo.dao;

import java.util.List;

import yolo.vo.PagingVO;
import yolo.vo.UserVO;

public interface InterfaceUserDAO {
	
	public void insertUser(UserVO user);
	
	public UserVO selectUser(int userId);
	
	public UserVO selectUser(String email);
	
	public List<UserVO> selectUserList();
	
	public List<UserVO> selectUserListByLimit(PagingVO paging);
	
	public void updateUser(UserVO user);
	
	public void deleteUser(int userId);

	public List<UserVO> searchUser(String email);
	
	public int countBySearch(String email);
	
	public int update_pw(UserVO user);
}

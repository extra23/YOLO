package yolo.dao;

import java.util.List;

import yolo.vo.UserVO;

@AnnotationUserMapper
public interface InterfaceUserMapper {

public void insertUser(UserVO user);
	
	public UserVO selectUserByUserId(int userId);
	
	public UserVO selectUserByEmail(String email);
	
	public List<UserVO> selectUserList();
	
	public void updateUser(UserVO user);
	
	public void deleteUser(int userId);
	
	public List<UserVO> searchUser(String email);
	
}

package yolo.dao;

import java.util.List;

import yolo.vo.UserVO;

@AnnotationUserMapper
public interface InterfaceUserMapper {

public void insertUser(UserVO user);
	
	public UserVO selectUser(int userId);
	
	public UserVO selectUser(String email);
	
	public List<UserVO> selectUserList();
	
	public void updateUser(UserVO user);
	
	public void deleteUser(int userId);
	
}

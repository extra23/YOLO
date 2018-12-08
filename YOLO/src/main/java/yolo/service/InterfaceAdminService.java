package yolo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yolo.vo.UserVO;

public interface InterfaceAdminService {
	
	public void addUser(UserVO user);
	
	public UserVO readUserByUserId(int userId);
	
	public UserVO readUSerByEmail(String email);
	
	public List<UserVO> readUserList();
	
	public void modifyUser(UserVO userId, int adminId, String oldPwd, String ad_password);
	
	public int update_pw(UserVO user);
	
	public void deleteUser(int user, int adminId, String u_password, String ad_password);
	
}

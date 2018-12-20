package yolo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InterfaceDeleteService {

	public void remove(HttpServletRequest req, HttpServletResponse resp, int userId, String password);
	
}

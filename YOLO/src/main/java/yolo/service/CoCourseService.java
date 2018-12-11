package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import yolo.dao.InterfaceCoCourseDAO;
import yolo.vo.CoCourseAndCourseVO;

public class CoCourseService implements InterfaceCoCourseService {

	@Autowired
	private InterfaceCoCourseDAO coCourseDAO;
	
	public List<CoCourseAndCourseVO> readJoinCourse(int userId) {
		// TODO Auto-generated method stub
		return coCourseDAO.selectJoinCourse(userId);
	}

}

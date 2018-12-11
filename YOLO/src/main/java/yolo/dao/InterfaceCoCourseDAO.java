package yolo.dao;

import java.util.List;

import yolo.vo.CoCourseAndCourseVO;

public interface InterfaceCoCourseDAO {
	
	public List<CoCourseAndCourseVO> selectJoinCourse(int userId);

}

package yolo.service;

import java.util.List;

import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CoCourseListVO;

public interface InterfaceCoCourseService {
	
	public int addCoCourse(CoCourseAndCourseVO coCourseAndCourse);

	public List<CoCourseAndCourseVO> readJoinCourse(int userId);
	
	public CoCourseAndCourseVO readCoCourseByCourseIdAndUserId(CoCourseAndCourseVO coCourseAndCourse);

	public void removeCoCourse(int costudy_courseId);
	
	public List<CoCourseListVO> readcoCourseList(int userId);
	
}

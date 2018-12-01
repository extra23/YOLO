package yolo.service;

import java.util.List;

import yolo.vo.CourseVO;
import yolo.vo.SearchVO;

public interface InterfaceCourseService {

	public void addCourse(CourseVO course);
	
	public CourseVO readCourseByUserId(int userId);
	
	public CourseVO readCourseByCourseId(int courseId);
	
	public List<CourseVO> readCourseList();
	
	public void modifyCourse(CourseVO course);
	
	public void removeCourse(int courseId);
	
	public List<SearchVO> searchCourse(String cTitle); 
}

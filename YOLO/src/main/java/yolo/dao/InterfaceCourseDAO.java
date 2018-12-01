package yolo.dao;

import java.util.List;

import yolo.vo.CourseVO;
import yolo.vo.SearchVO;

public interface InterfaceCourseDAO {
	
	public void insertCourse(CourseVO course);
	
	public CourseVO selectCourseByUserId(int userId);
	
	public CourseVO selectCourseByCourseId(int courseId);
	
	public List<CourseVO> selectCourseList();
	
	public void updateCourse(CourseVO course);
	
	public void deleteCourse(int courseId);
	
	public List<SearchVO> searchCourse(String cTitle);
	
	public int countBySearch(String cTitle);

}

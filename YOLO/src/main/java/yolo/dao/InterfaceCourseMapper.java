package yolo.dao;

import java.util.List;

import yolo.vo.CourseListVO;
import yolo.vo.CourseVO;
import yolo.vo.SearchVO;
//
@AnnotationYoloMapper
public interface InterfaceCourseMapper {
	
	public void insertCourse(CourseVO course);
	
	public List<CourseVO> selectCourseByUserId(int userId);
	
	public CourseVO selectCourseByCourseId(int courseId);
	
	public List<CourseVO> selectCourseList();
	
	public void updateCourse(CourseVO course);
	
	public void deleteCourse(int courseId);
	
	public void deleteCuser(int userId);
	
	public List<SearchVO> searchCourse(String cTitle);
	
	public int countBySearch(String cTitle);
	
	public List<CourseListVO> courseListPage();
	
}

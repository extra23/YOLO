package yolo.dao;
//
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.CourseListVO;
import yolo.vo.CourseVO;
import yolo.vo.SearchVO;

@Repository("CourseDAO")
public class CourseDAO implements InterfaceCourseDAO{

	@Autowired
	InterfaceCourseMapper courseMapper;
	
	public void insertCourse(CourseVO course) {
		courseMapper.insertCourse(course);
	}
	
	public List<CourseVO> selectCourseByUserId(int userId) {
		List<CourseVO> course = courseMapper.selectCourseByUserId(userId);
		return course;
	}
	
	public List<CourseListVO> courseListPage(){
		List<CourseListVO> courseListPage = courseMapper.courseListPage();
		return courseListPage;
	}
	
	public List<CourseListVO> myCourseList(int userId){
		List<CourseListVO> myCourseList = courseMapper.myCourseList(userId);
		return myCourseList;
	}
	
	public CourseVO selectCourseByCourseId(int courseId) {
		CourseVO course = courseMapper.selectCourseByCourseId(courseId);
		return course;
	}
	
	public List<CourseVO> selectCourseList(){
		List<CourseVO> courseList = courseMapper.selectCourseList();
		return courseList;
	}
	
	public List<CourseVO> courseListBox(){
		List<CourseVO> courseListBox = courseMapper.courseListBox();
		return courseListBox;
	}
	
	public int countBySearch(String cTitle) {
		int count = courseMapper.countBySearch(cTitle);
		return count;
	}
	
	public List<SearchVO> searchCourse(String cTitle){
		List<SearchVO> courseList = courseMapper.searchCourse(cTitle);
		return courseList;
	}
	
	public void updateCourse(CourseVO course) {
		courseMapper.updateCourse(course);
	}
	
	public void deleteCourse(int courseId) {
		courseMapper.deleteCourse(courseId);
	}
	
	public void deleteCuser(int userId) {
		courseMapper.deleteCuser(userId);
	}	
	
}

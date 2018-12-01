package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.CourseVO;
import yolo.vo.SearchVO;

@Repository("CourseDAO")
public class CourseDAO implements InterfaceCourseDAO{

	@Autowired
	InterfaceCourseMapper courseMapper;
	
	public void interCourse(CourseVO course) {
		courseMapper.insertCourse(course);
	}
	
	public CourseVO selectCourseByUserId(int userId) {
		CourseVO course = courseMapper.selectCourseByUserId(userId);
		return course;
	}
	
	public CourseVO selectCourseByCourseId(int courseId) {
		CourseVO course = courseMapper.selectCourseByCourseId(courseId);
		return course;
	}
	
	public List<CourseVO> selectCourseList(){
		List<CourseVO> courseList = courseMapper.selectCourseList();
		return courseList;
	}
	
	public void updateCourse(CourseVO course) {
		courseMapper.updateCourse(course);
	}
	
	public void deleteCourse(int courseId) {
		courseMapper.deleteCourse(courseId);
	}
	
	public List<SearchVO> searchCourse(String cTitle){
		List<SearchVO> courseList = courseMapper.searchCourse(cTitle);
		return courseList;
	}

	public void insertCourse(CourseVO course) {
		// TODO Auto-generated method stub
		
	}
}

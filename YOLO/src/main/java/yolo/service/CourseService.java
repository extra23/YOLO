package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceCourseDAO;
import yolo.vo.CourseVO;
import yolo.vo.SearchVO;

@Service("CourseService")
public class CourseService implements InterfaceCourseService {

	@Autowired
	InterfaceCourseDAO courseDAO;
	
	public void addCourse(CourseVO course) {
		courseDAO.insertCourse(course);
	}
	
	public CourseVO readCourseByUserId(int userId) {
		return courseDAO.selectCourseByUserId(userId);
	}
	
	public CourseVO readCourseByCourseId(int courseId) {
		return courseDAO.selectCourseByCourseId(courseId);
	}
	
	public List<CourseVO> readCourseList(){
		return courseDAO.selectCourseList();
	}
	
	public void modifyCourse(CourseVO course) {
		courseDAO.updateCourse(course);
	}
	
	public void removeCourse(int courseId) {
		courseDAO.deleteCourse(courseId);
	}
	
	public List<SearchVO> searchCourse(String cTitle){
		return courseDAO.searchCourse(cTitle);
	}

	public int countBySearch(String cTitle) {
		return courseDAO.countBySearch(cTitle);
	}
}

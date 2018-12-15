package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceCoCourseDAO;
import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CoCourseListVO;

@Service("CoCourseService")
public class CoCourseService implements InterfaceCoCourseService {

	@Autowired
	private InterfaceCoCourseDAO coCourseDAO;
	
	public int addCoCourse(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseDAO.insertCoCourse(coCourseAndCourse);
	}
	
	public List<CoCourseAndCourseVO> readJoinCourse(int userId) {
		// TODO Auto-generated method stub
		return coCourseDAO.selectJoinCourse(userId);
	}

	public CoCourseAndCourseVO readCoCourseByCourseIdAndUserId(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseDAO.selectCoCourseByCourseIdAndUserId(coCourseAndCourse);
	}

	public void removeCoCourse(int costudy_courseId) {
		coCourseDAO.deleteCoCourse(costudy_courseId);
	}
	
	public List<CoCourseListVO> readcoCourseList(int userId) {
		// TODO Auto-generated method stub
		return coCourseDAO.coCourseList(userId);
	}

}

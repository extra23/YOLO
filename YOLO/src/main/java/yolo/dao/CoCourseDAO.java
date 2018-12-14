package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.CoCourseAndCourseVO;

@Repository("CoCourserDAO")
public class CoCourseDAO implements InterfaceCoCourseDAO {

	@Autowired
	private InterfaceCoCourseMapper coCourseMapper;
	
	public int insertCoCourse(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseMapper.insertCoCourse(coCourseAndCourse);
	}
	
	public List<CoCourseAndCourseVO> selectJoinCourse(int userId) {
		// TODO Auto-generated method stub
		return coCourseMapper.selectJoinCourse(userId);
	}

	public CoCourseAndCourseVO selectCoCourseByCourseIdAndUserId(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseMapper.selectCoCourseByCourseIdAndUserId(coCourseAndCourse);
	}

	public void deleteCoCourse(int costudy_courseId) {
		coCourseMapper.deleteCoCourse(costudy_courseId);
	}
	
}

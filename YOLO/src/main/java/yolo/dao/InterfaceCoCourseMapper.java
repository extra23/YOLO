package yolo.dao;

import java.util.List;

import yolo.vo.CoCourseAndCourseVO;

@AnnotationYoloMapper
public interface InterfaceCoCourseMapper {
	
	public int insertCoCourse(CoCourseAndCourseVO coCourseAndCourse);
	
	public List<CoCourseAndCourseVO> selectJoinCourse(int userId);

	public CoCourseAndCourseVO selectCoCourseByCourseIdAndUserId(CoCourseAndCourseVO coCourseAndCourse);
	
	public void deleteCoCourse(int costudy_courseId);
	
	public List<CoCourseListVO> coCourseList(int userId);
	
}
package yolo.dao;

import java.util.List;

import yolo.vo.CoCourseAndCourseVO;



@AnnotationYoloMapper
public interface InterfaceCoCourseMapper {
	
	public List<CoCourseAndCourseVO> selectJoinCourse(int userId);

}

package yolo.service;

import java.util.List;

import yolo.vo.CoCourseAndCourseVO;

public interface InterfaceCoCourseService {

	public List<CoCourseAndCourseVO> readJoinCourse(int userId);
}

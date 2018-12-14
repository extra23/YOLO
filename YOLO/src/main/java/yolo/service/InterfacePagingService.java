package yolo.service;

import java.util.List;

import yolo.vo.CourseAndModuleVO;
import yolo.vo.ModuleVO;
import yolo.vo.TopicVO;

public interface InterfacePagingService {
	
	public List<TopicVO> selectPaging(TopicVO topic);
	
	public int selectTotalPaging(int moduleId);
	
	public List<CourseAndModuleVO> selectPagingM(CourseAndModuleVO courseAndModule);
	
	public int selectTotalPagignM(int courseId);
	
	public List<ModuleVO> test(int courseId);

}

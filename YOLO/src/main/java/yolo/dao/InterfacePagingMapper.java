package yolo.dao;

import java.util.List;

import yolo.vo.CourseAndModuleVO;
import yolo.vo.ModuleVO;
import yolo.vo.TopicVO;

@AnnotationYoloMapper
public interface InterfacePagingMapper {
	
	//토픽
	public List<TopicVO> selectPaging(TopicVO topic);
	
	public int selectTotalPaging(int moduleId);
	
	//모듈
	public List<CourseAndModuleVO> selectPagingM(CourseAndModuleVO courseAndModule);
	
	public int selectTotalPagignM(int courseId);
	
	public List<ModuleVO> test(int courseId);
	
}

package yolo.dao;

import java.util.List;

import yolo.vo.CourseAndModuleVO;
import yolo.vo.TopicVO;

@AnnotationYoloMapper
public interface InterfacePagingMapper {
	
	//토픽
	public List<TopicVO> selectPaging(TopicVO topic);
	
	public int selectTotalPaging(int moduleId);
	
}

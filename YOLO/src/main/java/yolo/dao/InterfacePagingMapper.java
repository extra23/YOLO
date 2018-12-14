package yolo.dao;

import java.util.List;

import yolo.vo.TopicVO;

@AnnotationYoloMapper
public interface InterfacePagingMapper {
	
	public List<TopicVO> selectPaging(TopicVO topic);
	
	public int selectTotalPaging(int moduleId);
}

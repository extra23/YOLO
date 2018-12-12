package yolo.dao;

import java.util.List;

import yolo.vo.TestVO;
import yolo.vo.TopicVO;

@AnnotationYoloMapper
public interface InterfacePagingMapper {
	
	public List<TopicVO> selectPaging(TestVO test);
	
	public int selectTotalPaging(int moduleId);
}

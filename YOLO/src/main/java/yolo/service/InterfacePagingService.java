package yolo.service;

import java.util.List;

import yolo.vo.TestVO;
import yolo.vo.TopicVO;

public interface InterfacePagingService {
	
	public List<TopicVO> selectPaging(TestVO test);
	
	public int selectTotalPaging(int moduleId);

}

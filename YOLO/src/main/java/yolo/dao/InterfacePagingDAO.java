package yolo.dao;

import java.util.List;

import yolo.vo.TestVO;
import yolo.vo.TopicVO;

public interface InterfacePagingDAO {

	public List<TopicVO> selectPaging(TestVO test);
	
	public int selectTotalPaging(int moduleId);
}

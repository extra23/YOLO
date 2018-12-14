package yolo.dao;

import java.util.List;


import yolo.vo.TopicVO;

public interface InterfacePagingDAO {

	public List<TopicVO> selectPaging(TopicVO topic);
	
	public int selectTotalPaging(int moduleId);
}

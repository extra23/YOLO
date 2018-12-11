package yolo.service;

import java.util.List;

import yolo.vo.TopicVO;

public interface InterfacePagingService {
	
	public List<TopicVO> selectPaging(int moduleId);
	
	public int selectTotalPaging(int moduleId);

}

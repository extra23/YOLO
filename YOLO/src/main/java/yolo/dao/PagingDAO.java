package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.TopicVO;

@Repository("PagingDAO")
public class PagingDAO implements InterfacePagingDAO{
	
	@Autowired
	InterfacePagingMapper pagingMapper;

	public List<TopicVO> selectPaging(TopicVO topic) {
		List<TopicVO> topicList = pagingMapper.selectPaging(topic);
		return topicList;
	}

	public int selectTotalPaging(int moduleId) {
		int total = pagingMapper.selectTotalPaging(moduleId);
		return total;
	}

}

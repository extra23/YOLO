package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.SearchVO;
import yolo.vo.TopicVO;

@Repository("TopicDAO")
public class TopicDAO implements InterfaceTopicDAO {

	@Autowired
	InterfaceTopicMapper topicMapper;
	
	public void insertTopic(TopicVO topic) {
		topicMapper.insertTopic(topic);

	}

	public TopicVO selectTopicByUserId(int userId) {
		TopicVO topic = topicMapper.selectTopicByUserId(userId);
		return topic;
	}

	public TopicVO selectTopicByTopicId(int topicId) {
		TopicVO topic = topicMapper.selectTopicByTopicId(topicId);
		return topic;
	}

	public List<TopicVO> selectTopicList() {
		List<TopicVO> topicList = topicMapper.selectTopicList();
		return topicList;
	}
	
	public List<TopicVO> selectTopicListByModuleId(int moduleId) {
		return topicMapper.selectTopicListByModuleId(moduleId);
	}

	public void updateTopic(TopicVO topic) {
		topicMapper.updateTopic(topic);

	}

	public void deleteTopic(int topicId) {
		topicMapper.deleteTopic(topicId);

	}
	
	public void deleteTuser(int userId) {
		topicMapper.deleteTuser(userId);
	}

	public List<SearchVO> searchTopic(String tTitle) {
		List<SearchVO> topicList = topicMapper.searchTopic(tTitle);
		return topicList;
	}

	public int countBySearch(String tTitle) {
		int count = topicMapper.countBySearch(tTitle);
		return count;
	}

}


package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public void updateTopic(TopicVO topic) {
		topicMapper.updateTopic(topic);

	}

	public void deleteTopic(int topicId) {
		topicMapper.deleteTopic(topicId);

	}

	public List<TopicVO> searchTopic(String tTitle) {
		List<TopicVO> topicList = topicMapper.searchTopic(tTitle);
		return topicList;
	}

}

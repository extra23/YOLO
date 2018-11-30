package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceTopicDAO;
import yolo.vo.TopicVO;


@Service("TopicService")
public class TopicService implements InterfaceTopicService {

	@Autowired
	InterfaceTopicDAO topicDAO;
	
	public void addTopic(TopicVO topic) {
		topicDAO.insertTopic(topic);

	}

	public TopicVO readTopicByUserId(int userId) {
		
		return topicDAO.selectTopicByUserId(userId);
	}

	public TopicVO readTopicByTopicId(int topicId) {
		
		return topicDAO.selectTopicByTopicId(topicId);
	}

	public List<TopicVO> readTopicList() {
		
		return topicDAO.selectTopicList();
	}

	public void modifyTopic(TopicVO topic) {
		topicDAO.updateTopic(topic);

	}

	public void removeTopic(int topicId) {
		topicDAO.deleteTopic(topicId);

	}

	public List<TopicVO> searchTopic(String tTitle) {
		
		return topicDAO.searchTopic(tTitle);
	}

}

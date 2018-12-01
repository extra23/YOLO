package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceTopicDAO;
import yolo.vo.SearchVO;
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
	
	public List<TopicVO> readTopicListGroupByModuleId(int moduleId) {
		return topicDAO.selectTopicListByModuleId(moduleId);
	}

	public void modifyTopic(TopicVO topic) {
		topicDAO.updateTopic(topic);

	}

	public void removeTopic(int topicId) {
		topicDAO.deleteTopic(topicId);

	}

	public List<SearchVO> searchTopic(String tTitle) {
		
		return topicDAO.searchTopic(tTitle);
	}

	public int countBySearch(String tTitle) {
		
		return topicDAO.countBySearch(tTitle);
	}

}

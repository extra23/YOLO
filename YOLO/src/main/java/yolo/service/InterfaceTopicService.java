package yolo.service;

import java.util.List;

import yolo.vo.SearchVO;
import yolo.vo.TopicVO;

public interface InterfaceTopicService {
	
	public void addTopic(TopicVO topic);
	
	public TopicVO readTopicByUserId(int userId);
	
	public TopicVO readTopicByTopicId(int topicId);
	
	public List<TopicVO> readTopicList();
	
	public List<TopicVO> readTopicListGroupByModuleId(int moduleId);
	
	public void modifyTopic(TopicVO topic);
	
	public void removeTopic(int topicId);
	
	public List<SearchVO> searchTopic(String tTitle);
	
	public int countBySearch(String tTitle);
}

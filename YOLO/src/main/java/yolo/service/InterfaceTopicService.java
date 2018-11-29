package yolo.service;

import java.util.List;

import yolo.vo.TopicVO;

public interface InterfaceTopicService {
	
	public void addTopic(TopicVO topic);
	
	public TopicVO readTopicByUserId(int userId);
	
	public TopicVO readTopicByTopicId(int topicId);
	
	public List<TopicVO> readTopicList();
	
	public void modifyTopic(TopicVO topic);
	
	public void removeTopic(int topicId);
	
	public List<TopicVO> searchTopic(String tTitle);
}

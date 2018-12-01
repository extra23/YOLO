package yolo.dao;

import java.util.List;

import yolo.vo.SearchVO;
import yolo.vo.TopicVO;

public interface InterfaceTopicDAO {

	public void insertTopic(TopicVO topic);
	
	public TopicVO selectTopicByUserId(int userId);
	
	public TopicVO selectTopicByTopicId(int topicId);
	
	public List<TopicVO> selectTopicList();
	
	public void updateTopic(TopicVO topic);
	
	public void deleteTopic(int topicId);
	
	public List<SearchVO> searchTopic(String tTitle);
	
	public int countBySearch(String tTitle);
}

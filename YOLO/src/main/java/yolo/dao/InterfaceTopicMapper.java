package yolo.dao;

import java.util.List;

import yolo.vo.SearchVO;
import yolo.vo.TopicVO;

@AnnotationYoloMapper
public interface InterfaceTopicMapper {
	
	public void insertTopic(TopicVO topic);
	
	public TopicVO selectTopicByUserId(int userId);
	
	public TopicVO selectTopicByTopicId(int topicId);
	
	public List<TopicVO> selectTopicList();
	
	public List<TopicVO> selectTopicListByModuleId(int moduleId);
	
	public void updateTopic(TopicVO topic);
	
	public void deleteTopic(int topicId);
	
	public void deleteTuser(int userId);
	
	public List<SearchVO> searchTopic(String tTitle);
	
	public int countBySearch(String tTitle);
	
}

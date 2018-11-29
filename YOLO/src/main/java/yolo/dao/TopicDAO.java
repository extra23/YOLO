package yolo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import yolo.vo.TopicVO;

@Repository("TopicDAO")
public class TopicDAO implements InterfaceTopicDAO {

	public void insertTopic(TopicVO topic) {
		// TODO Auto-generated method stub

	}

	public TopicVO selectTopicByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public TopicVO selectTopicByTopicId(int topicId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<TopicVO> selectTopicList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateTopic(TopicVO topic) {
		// TODO Auto-generated method stub

	}

	public void deleteTopic(int topicId) {
		// TODO Auto-generated method stub

	}

	public List<TopicVO> searchTopic(String tTitle) {
		// TODO Auto-generated method stub
		return null;
	}

}

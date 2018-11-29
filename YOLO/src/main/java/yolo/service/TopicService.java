package yolo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import yolo.vo.TopicVO;


@Service("TopicService")
public class TopicService implements InterfaceTopicService {

	public void addTopic(TopicVO topic) {
		// TODO Auto-generated method stub

	}

	public TopicVO readTopicByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public TopicVO readTopicByTopicId(int topicId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<TopicVO> readTopicList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyTopic(TopicVO topic) {
		// TODO Auto-generated method stub

	}

	public void removeTopic(int topicId) {
		// TODO Auto-generated method stub

	}

	public List<TopicVO> searchTopic(String tTitle) {
		// TODO Auto-generated method stub
		return null;
	}

}

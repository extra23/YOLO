package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("Topic")
public class TopicVO {
	private int topicId;
	private int moduleId;
	private int userId;
	private String tTitle;
	private String tContent;
	
	public TopicVO() {}

	//insert시 사용
	public TopicVO(int moduleId, int userId, String tTitle, String tContent) {
		this.moduleId = moduleId;
		this.userId = userId;
		this.tTitle = tTitle;
		this.tContent = tContent;
	}

	
	
	//update시 사용
	public TopicVO(int moduleId, String tTitle, String tContent) {
		this.moduleId = moduleId;
		this.tTitle = tTitle;
		this.tContent = tContent;
	}

	
	
	//getter, setter
	public int getTopicId() {
		return topicId;
	}


	
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}
	
	
}
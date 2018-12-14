package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("Topic")
public class TopicVO {
	private int topicId;
	private int moduleId;
	private int userId;
	private String tTitle;
	private String tContent;
	private LocalDateTime wdate;
	private LocalDateTime udate;
	private int startIndex;
	private int cntPerPage;
	
	public TopicVO() {}

	//insert시 사용
	public TopicVO(int moduleId, int userId, String tTitle, String tContent) {
		this.moduleId = moduleId;
		this.userId = userId;
		this.tTitle = tTitle;
		this.tContent = tContent;
	}

	
	
	//update시 사용
	public TopicVO(int topicId, String tTitle, String tContent) {
		this.topicId = topicId;
		this.tTitle = tTitle;
		this.tContent = tContent;
	}
	
	//pagination
	
	public TopicVO(int moduleId) {
		this.moduleId = moduleId;
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

	public LocalDateTime getWdate() {
		return wdate;
	}

	public void setWdate(LocalDateTime wdate) {
		this.wdate = wdate;
	}

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int pageSize) {
		this.cntPerPage = pageSize;
	}
	
	
}

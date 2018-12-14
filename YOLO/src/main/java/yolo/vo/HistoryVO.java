package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("History")
public class HistoryVO {
	
	private int historyId;
	private int topciId;
	private int userId;
	private String tTitle;
	private LocalDateTime udate;
	
	public HistoryVO() {}
	
	// insert
	/*public HistoryVO(int userId, int topicId, String tTitle) {
		this.userId = userId;
		this.topciId = topicId;
		this.tTitle = tTitle;
	}*/
	public int getHistoryId() {
		return historyId;
	}
	
	public void setHistoryId(int historyId) {
		this.historyId = historyId;
	}

	public int getTopciId() {
		return topciId;
	}


	public void setTopciId(int topciId) {
		this.topciId = topciId;
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

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}
	
	
}
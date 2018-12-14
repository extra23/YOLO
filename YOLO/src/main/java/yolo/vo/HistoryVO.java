package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("History")
public class HistoryVO {
	
	private int historyId;
	private int topciId;
	private int userId;
	private String nickName;
	private String tTitle;
	private LocalDateTime udate;
	
	public HistoryVO() {}
	
	// List
	public HistoryVO(String nickName, String tTitle, LocalDateTime udate) {
		super();
		this.nickName = nickName;
		this.tTitle = tTitle;
		this.udate = udate;
	}
	
	
	
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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
package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("CoCourseList")
public class CoCourseListVO {
	
	
	private int costudy_courseId;
	private int courseId;
	private int userId;
	private String cTitle;
	private String mTitle;
	private String nickname;
	private int writer;
	private LocalDateTime udate;
	
	
	public CoCourseListVO() {}


	public CoCourseListVO(int costudy_courseId, int courseId, int userId, String cTitle, String mTitle, String nickname,
			int writer, LocalDateTime udate) {
		super();
		this.costudy_courseId = costudy_courseId;
		this.courseId = courseId;
		this.userId = userId;
		this.cTitle = cTitle;
		this.mTitle = mTitle;
		this.nickname = nickname;
		this.writer = writer;
		this.udate = udate;
	}


	public int getCostudy_courseId() {
		return costudy_courseId;
	}


	public void setCostudy_courseId(int costudy_courseId) {
		this.costudy_courseId = costudy_courseId;
	}


	public int getCourseId() {
		return courseId;
	}


	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getcTitle() {
		return cTitle;
	}


	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}


	public String getmTitle() {
		return mTitle;
	}


	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getWriter() {
		return writer;
	}


	public void setWriter(int writer) {
		this.writer = writer;
	}


	public LocalDateTime getUdate() {
		return udate;
	}


	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}
	
	

	
	

}

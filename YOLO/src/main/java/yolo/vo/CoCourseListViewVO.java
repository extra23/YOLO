package yolo.vo;

import java.time.LocalDateTime;
import java.util.List;

public class CoCourseListViewVO {
	
	private int costudy_courseId;
	private int courseId;
	private int userId;
	private List<MoLink> moLinks;
	private String cTitle;
	private String nickname;
	private int writer;
	private LocalDateTime udate;
	
	
	public CoCourseListViewVO() {}
	
	public CoCourseListViewVO(int costudy_courseId, int courseId, int userId, List<MoLink> moLinks, String cTitle,
			String nickname, int writer, LocalDateTime udate) {
		
		this.costudy_courseId = costudy_courseId;
		this.courseId = courseId;
		this.userId = userId;
		this.moLinks = moLinks;
		this.cTitle = cTitle;
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
	public List<MoLink> getMoLinks() {
		return moLinks;
	}
	public void setMoLinks(List<MoLink> moLinks) {
		this.moLinks = moLinks;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
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

package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("Course")
public class CourseVO {

	private int courseId;
	private int userId;
	private String cTitle;
	private String cContent;
	private String cSummary;
	private LocalDateTime wdate;
	private LocalDateTime udate;
	
	public CourseVO () {}
	
	//insert
	public CourseVO(int userId, String cTitle, String cContent, String cSummary) {
		this.userId = userId;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cSummary = cSummary;
	}

	//update
	public CourseVO(String cTitle, String cContent, String cSummary) {
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cSummary = cSummary;
	}
	
	//CourseList
		public CourseVO(int courseId, int userId, String cTitle, String cContent, String cSummary, LocalDateTime wdate,
				LocalDateTime udate) {
			this.courseId = courseId;
			this.userId = userId;
			this.cTitle = cTitle;
			this.cContent = cContent;
			this.cSummary = cSummary;
			this.wdate = wdate;
			this.udate = udate;
		}

	//getter, setter
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

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcSummary() {
		return cSummary;

	}

	public void setcSummary(String cSummary) {
		this.cSummary = cSummary;
	}
	

}


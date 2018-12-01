package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("Course")
public class CourseVO {

	private int courseId;
	private int userId;
	private String cTitle;
	private String cContent;
	private String cSummary;
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


package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("CoCourseAndCourse")
public class CoCourseAndCourseVO {
	
	private int costudy_courseId;
	private int courseId;
	private int userId;
	private String cTitle;
	
	public CoCourseAndCourseVO() {}
	
	public CoCourseAndCourseVO(int costudy_courseId, int courseId, int userId, String cTitle) {
		super();
		this.costudy_courseId = costudy_courseId;
		this.courseId = courseId;
		this.userId = userId;
		this.cTitle = cTitle;
	}
	
	// CostudyController에서 사용하는 생성자
	public CoCourseAndCourseVO(int courseId, int userId) {
		this.courseId = courseId;
		this.userId = userId;
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

}

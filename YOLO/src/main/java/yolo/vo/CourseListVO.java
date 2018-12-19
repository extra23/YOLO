package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("CourseList")
public class CourseListVO {
	private int courseId;
	private String cTitle;
	private int userId;
	private String nickName;
	private int moduleId;
	private String mTitle;
	private LocalDateTime udate;
	
	public CourseListVO() {}

	public CourseListVO(int courseId, String cTitle, int userId, String nickName, int moduleId, String mTitle, LocalDateTime udate) {
		super();
		this.courseId = courseId;
		this.cTitle = cTitle;
		this.userId = userId;
		this.nickName = nickName;
		this.moduleId = moduleId;
		this.mTitle = mTitle;
		this.udate = udate;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
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

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}

}

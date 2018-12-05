package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("ModuleList")
public class ModuleListVO {
	private int moduleId;
	private String mTitle;
	private int userId;
	private String nickName;
	private LocalDateTime udate;
	private int courseId;
	private String cTitle;
	
	
	
	public ModuleListVO() {	}

	public ModuleListVO(int moduleId, String mTitle, int userId, String nickName, LocalDateTime udate,
			int courseId, String cTitle) {
		this.moduleId = moduleId;
		this.mTitle = mTitle;
		this.userId = userId;
		this.nickName = nickName;
		this.udate = udate;
		this.courseId = courseId;
		this.cTitle = cTitle;
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

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
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
	
	
	
	
}

package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("Module")
public class ModuleVO {
	
	private int moduleId;
	private int courseId;
	private String mTitle;
	private String mContent;
	private String mSummary;
	private int userId;
	private LocalDateTime wdate;
	private LocalDateTime udate;

	public ModuleVO() {}

	//insert 
	
	public ModuleVO(int courseId, String mTitle, String mContent, String mSummary, int userId) {

		this.courseId = courseId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mSummary = mSummary;
		this.userId = userId;
	}

	
	
	//update

	public ModuleVO(int moduleId, String mTitle, String mContent, String mSummary) {
		
		this.moduleId = moduleId;
		this.mTitle = mTitle;
		this.mContent = mContent;
		this.mSummary = mSummary;
	}



	public int getModuleId() {
		return moduleId;
	}



	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}



	public int getCourseId() {
		return courseId;
	}



	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}



	public String getmTitle() {
		return mTitle;
	}



	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}



	public String getmContent() {
		return mContent;
	}



	public void setmContent(String mContent) {
		this.mContent = mContent;
	}



	public String getmSummary() {
		return mSummary;
	}



	public void setmSummary(String mSummary) {
		this.mSummary = mSummary;
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	
	
	@Override
	public String toString() {
		return "ModuleVO [moduleId=" + moduleId + ", courseId=" + courseId + ", mTitle=" + mTitle + ", mContent="
				+ mContent + ", mSummary=" + mSummary + ", userId=" + userId + "]";
	}
	
	
	
	

	
	
	
	

	
	
	
	
	
}

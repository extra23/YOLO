package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("CoModuleAndModule")
public class CoModuleAndModuleVO {
	
	private int costudy_moduleId;
	private int moduleId;
	private int userId;
	private String mTitle;

	public CoModuleAndModuleVO() {}
	
	public CoModuleAndModuleVO(int costudy_moduleId, int moduleId, int userId, String mTitle) {
		super();
		this.costudy_moduleId = costudy_moduleId;
		this.moduleId = moduleId;
		this.userId = userId;
		this.mTitle = mTitle;
	}

	public int getCostudy_moduleId() {
		return costudy_moduleId;
	}
	
	public void setCostudy_moduleId(int costudy_moduleId) {
		this.costudy_moduleId = costudy_moduleId;
	}
	
	public int getModuleId() {
		return moduleId;
	}
	
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getmTitle() {
		return mTitle;
	}
	
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

}

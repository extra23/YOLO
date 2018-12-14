package yolo.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import yolo.vo.ModuleListVO;

public class ModuleRequest {
	private int moduleId;
	private String mTitle;
	private int userId;
	private String nickName;
	private LocalDateTime udate;
	private int courseId;
	private List<String> cTitleList;

	public ModuleRequest(ModuleListVO module) {
		moduleId = module.getModuleId();
		mTitle = module.getmTitle();
		userId = module.getUserId();
		nickName = module.getNickName();
		udate = module.getUdate();
		courseId = module.getCourseId();
		cTitleList = new ArrayList<String>();
		cTitleList.add(module.getcTitle());
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

	public List<String> getcTitleList() {
		return cTitleList;
	}

	public void setcTitleList(List<String> cTitleList) {
		this.cTitleList = cTitleList;
	}
	
	public void addcTitle(String cTitle) {
		cTitleList.add(cTitle);
	}

	@Override
	public String toString() {
		return "ModuleRequest [moduleId=" + moduleId + ", mTitle=" + mTitle + ", userId=" + userId + ", nickName="
				+ nickName + ", udate=" + udate + ", courseId=" + courseId + ", cTitleList=" + cTitleList + "]";
	}
}

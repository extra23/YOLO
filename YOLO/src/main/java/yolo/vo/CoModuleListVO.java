package yolo.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;


@Alias("CoModuleList")
public class CoModuleListVO {
	
	private int costudy_moduleId;
	private int moduleId;
	private int userId;
	private String cTitle;
	private String mTitle;
	private String nickname;
	private int writer;
	private LocalDateTime udate;
	
	
	public CoModuleListVO() {}
	
	public CoModuleListVO(int costudy_moduleId, int moduleId, int userId, String cTitle, String mTitle, String nickname,
			int writer, LocalDateTime udate) {
		super();
		this.costudy_moduleId = costudy_moduleId;
		this.moduleId = moduleId;
		this.userId = userId;
		this.cTitle = cTitle;
		this.mTitle = mTitle;
		this.nickname = nickname;
		this.writer = writer;
		this.udate = udate;
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

package yolo.vo;

public class MoLink {
	private String mTitle;
	private int moduleId;
	
	
	
	public MoLink() {}
	
	public MoLink(String mTitle, int moduleId) {
		
		this.mTitle = mTitle;
		this.moduleId = moduleId;
	};
	
	
	public String getmTitle() {
		return mTitle;
	}


	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}


	public int getModuleId() {
		return moduleId;
	}


	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}


	
	
	
	

}

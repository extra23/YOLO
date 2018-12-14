package yolo.vo;

import org.apache.ibatis.type.Alias;

//검색 결과를 저장하고 출력하기 위한 VO
@Alias("Search")
public class SearchVO {
	private String nickName;
	private String email;
	private String tTitle;
	private String tContent;
	private String mTitle;
	private String cTitle;
	private int topicId;
	private int moduleId;
	private int courseId;
	private String mSummary;
	private String cSummary;

	public SearchVO () {}


	public SearchVO(String nickName, String email, String tTitle, String tContent) {
		this.nickName = nickName;
		this.email = email;
		this.tTitle = tTitle;
		this.tContent = tContent;
	}

	//getter, setter
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getcTitle() {
		return cTitle;
	}	
	

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	
	public int getTopicId() {
		return topicId;
	}




	public void setTopicId(int topicId) {
		this.topicId = topicId;
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




	public String getmSummary() {
		return mSummary;
	}




	public void setmSummary(String mSummary) {
		this.mSummary = mSummary;
	}




	public String getcSummary() {
		return cSummary;
	}




	public void setcSummary(String cSummary) {
		this.cSummary = cSummary;
	}

	
}

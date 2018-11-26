package yolo.vo;

import java.time.LocalDateTime;

public class UserVO {

	private int userId;
	private boolean userType;
	private String profileImage;
	private String nickName;
	private String email;
	private String password;
	private int p_qId;
	private String p_answer;
	private LocalDateTime wdate;
	private LocalDateTime udate;
	
	// insert 시 사용할 생성자 테스트222
	public UserVO(String profileImage, String nickName, String email, String password, int p_qId, String p_answer) {
		this.profileImage = profileImage;
		this.nickName = nickName;
		this.email = email;
		this.password = password;
		this.p_qId = p_qId;
		this.p_answer = p_answer;
	}
	
	// select 시 사용할 생성자
	public UserVO(int userId, boolean userType, String profileImage, String nickName, String email, String password, int p_qId, String p_answer, LocalDateTime wdate, LocalDateTime udate) {
		this.userId = userId;
		this.userType = userType;
		this.profileImage = profileImage;
		this.nickName = nickName;
		this.email = email;
		this.password = password;
		this.p_qId = p_qId;
		this.p_answer = p_answer;
		this.wdate = wdate;
		this.udate = udate;
	}
	
	// update 시 사용할 생성자
	public UserVO(String profileImage, String nickName, String password, int p_qId, String p_answer) {
		super();
		this.profileImage = profileImage;
		this.nickName = nickName;
		this.password = password;
		this.p_qId = p_qId;
		this.p_answer = p_answer;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean isUserType() {
		return userType;
	}

	public void setUserType(boolean userType) {
		this.userType = userType;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getP_qId() {
		return p_qId;
	}

	public void setP_qId(int p_qId) {
		this.p_qId = p_qId;
	}

	public String getP_answer() {
		return p_answer;
	}

	public void setP_answer(String p_answer) {
		this.p_answer = p_answer;
	}

	public LocalDateTime getWdate() {
		return wdate;
	}

	public void setWdate(LocalDateTime wdate) {
		this.wdate = wdate;
	}

	public LocalDateTime getUdate() {
		return udate;
	}

	public void setUdate(LocalDateTime udate) {
		this.udate = udate;
	}
	
}

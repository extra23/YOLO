package yolo.vo;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class UserVO {

	private int userId;
	private boolean userType;
	private String profileImage;
	private String nickName;
	private String email;
	private String password;
	private int pwQId;
	private String pwA;
	private LocalDateTime wdate;
	private LocalDateTime udate;

	public UserVO() {}

	// insert 시 사용할 생성자 테스트
	
	public UserVO(String profileImage, String nickName, String email, String password, int pwQId, String pwA) {
		super();
		this.profileImage = profileImage;
		this.nickName = nickName;
		this.email = email;
		this.password = password;
		this.pwQId = pwQId;
		this.pwA = pwA;
	}

	
	
	//update
	public UserVO(int userId, String profileImage, String nickName, String email, String password, int pwQId,
			String pwA) {
		super();
		this.userId = userId;
		this.profileImage = profileImage;
		this.nickName = nickName;
		this.email = email;
		this.password = password;
		this.pwQId = pwQId;
		this.pwA = pwA;
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

	public int getPwQId() {
		return pwQId;
	}

	public void setPwQId(int pwQId) {
		this.pwQId = pwQId;
	}

	public String getPwA() {
		return pwA;
	}

	public void setPwA(String pwA) {
		this.pwA = pwA;
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

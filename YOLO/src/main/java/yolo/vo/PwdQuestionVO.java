package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("PwdQuestion")
public class PwdQuestionVO {

	private int pwQId;
	private String question;
	
	public int getPwQId() {
		return pwQId;
	}
	
	public void setPwQId(int pwQId) {
		this.pwQId = pwQId;
	}
	
	public String getQuestion() {
		return question;
	}
	
	public void setQuestion(String question) {
		this.question = question;
	}
	
}

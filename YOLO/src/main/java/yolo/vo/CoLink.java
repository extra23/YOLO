package yolo.vo;

public class CoLink {
	private String cTitle;
	private int courseId;
	
	public CoLink () {}
	
	public CoLink(String cTtile, int courseId) {
		this.cTitle = cTtile;
		this.courseId = courseId;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
}

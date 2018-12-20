package yolo.vo;

import org.apache.ibatis.type.Alias;

@Alias("Como")
public class ComoVO {
	private int courseId;
	private int moduleId;

	
	public ComoVO() {}


	public ComoVO(int courseId, int moduleId) {
		this.courseId = courseId;
		this.moduleId = moduleId;
	}


	public int getCourseId() {
		return courseId;
	}


	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}


	public int getModuleId() {
		return moduleId;
	}


	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}


	@Override
	public String toString() {
		return "ComoVO [courseId=" + courseId + ", moduleId=" + moduleId + "]";
	}
	
	
}

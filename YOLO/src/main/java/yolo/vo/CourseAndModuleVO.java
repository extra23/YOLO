package yolo.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("CourseAndModuleVO")
public class CourseAndModuleVO {
	private CourseVO course;
	private UserVO user;
	private List<ModuleAndTopicVO> moduleList; 
	
	public CourseAndModuleVO() {}

	public CourseAndModuleVO(CourseVO course, UserVO user, List<ModuleAndTopicVO> moduleList) {
		super();
		this.course = course;
		this.user = user;
		this.moduleList = moduleList;
	}

	public CourseVO getCourse() {
		return course;
	}

	public void setCourse(CourseVO course) {
		this.course = course;
	}

	public UserVO getUser() {
		return user;
	}

	public void setUser(UserVO user) {
		this.user = user;
	}

	public List<ModuleAndTopicVO> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<ModuleAndTopicVO> moduleList) {
		this.moduleList = moduleList;
	}
	
	
}

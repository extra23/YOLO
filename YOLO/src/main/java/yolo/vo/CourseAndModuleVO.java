package yolo.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("CourseAndModuleVO")
public class CourseAndModuleVO {
	private CourseVO course;
	private UserVO user;
	private List<ModuleAndTopicVO> moduleAndTopicList; 
	
	public CourseAndModuleVO() {}

	public CourseAndModuleVO(CourseVO course, UserVO user, List<ModuleAndTopicVO> moduleAndTopicList) {
		super();
		this.course = course;
		this.user = user;
		this.moduleAndTopicList = moduleAndTopicList;
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

	public List<ModuleAndTopicVO> getModuleAndTopicList() {
		return moduleAndTopicList;
	}

	public void setModuleAndTopicList(List<ModuleAndTopicVO> moduleAndTopicList) {
		this.moduleAndTopicList = moduleAndTopicList;
	}
	
}

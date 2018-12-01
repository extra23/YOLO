package yolo.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("ModuleAndTopicVO")
public class ModuleAndTopicVO {

	private ModuleVO module;
	private UserVO user;
	private List<TopicVO> topicList;
	
	public ModuleAndTopicVO() {}

	public ModuleAndTopicVO(ModuleVO module, UserVO user, List<TopicVO> topicList) {
		super();
		this.module = module;
		this.user = user;
		this.topicList = topicList;
	}

	public ModuleVO getModule() {
		return module;
	}

	public void setModule(ModuleVO module) {
		this.module = module;
	}

	public UserVO getUser() {
		return user;
	}

	public void setUser(UserVO user) {
		this.user = user;
	}

	public List<TopicVO> getTopicList() {
		return topicList;
	}

	public void setTopicList(List<TopicVO> topicList) {
		this.topicList = topicList;
	}
	
}

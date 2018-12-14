package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.CourseAndModuleVO;
import yolo.vo.ModuleVO;
import yolo.vo.TopicVO;

@Repository("PagingDAO")
public class PagingDAO implements InterfacePagingDAO{
	
	@Autowired
	InterfacePagingMapper pagingMapper;

	public List<TopicVO> selectPaging(TopicVO topic) {
		List<TopicVO> topicList = pagingMapper.selectPaging(topic);
		return topicList;
	}

	public int selectTotalPaging(int moduleId) {
		int total = pagingMapper.selectTotalPaging(moduleId);
		return total;
	}

	public List<CourseAndModuleVO> selectPagingM(CourseAndModuleVO courseAndModule) {
		List<CourseAndModuleVO> moduleList= pagingMapper.selectPagingM(courseAndModule);
		return moduleList;
	}

	public int selectTotalPagignM(int courseId) {
		int total = pagingMapper.selectTotalPagignM(courseId);
		return total;
	}

	public List<ModuleVO> test(int courseId) {
		List<ModuleVO> moduleList = pagingMapper.test(courseId);
		return moduleList;
	}

}

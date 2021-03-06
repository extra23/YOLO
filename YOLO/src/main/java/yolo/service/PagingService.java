package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfacePagingDAO;
import yolo.vo.CourseAndModuleVO;
import yolo.vo.ModuleVO;
import yolo.vo.TopicVO;

@Service("PagingService")
public class PagingService implements InterfacePagingService {

	@Autowired
	InterfacePagingDAO pagingDao;
	


	public int selectTotalPaging(int moduleId) {
		return pagingDao.selectTotalPaging(moduleId);
	}
	
	public List<TopicVO> selectPaging(TopicVO topic) {
		return pagingDao.selectPaging(topic);
	}


	public int selectTotalPagignM(int courseId) {
		return pagingDao.selectTotalPagignM(courseId);
	}

	public List<ModuleVO> selectPagingM(int courseId) {
		
		return pagingDao.selectPagingM(courseId);
	}

}

package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfacePagingDAO;
import yolo.vo.TestVO;
import yolo.vo.TopicVO;

@Service("PagingService")
public class PagingService implements InterfacePagingService {

	@Autowired
	InterfacePagingDAO pagingDao;
	


	public int selectTotalPaging(int moduleId) {
		return pagingDao.selectTotalPaging(moduleId);
	}
	
	public List<TopicVO> selectPaging(TestVO test) {
		return pagingDao.selectPaging(test);
	}

}

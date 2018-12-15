package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceCoModuleDAO;
import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;

@Service("CoModuleService")
public class CoModuleService implements InterfaceCoModuleService {
	
	@Autowired
	private InterfaceCoModuleDAO coModuleDAO;
	
	public int addCoModule(CoModuleAndModuleVO coModuleAndModule) {
		return coModuleDAO.insertCoModule(coModuleAndModule);
	}

	public List<CoModuleAndModuleVO> readJoinModule(int userId) {
		return coModuleDAO.selectJoinModule(userId);
	}

	public List<CoModuleListVO> readcoModuleList(int userId) {
		return coModuleDAO.coModuleList(userId);
	}

	public CoModuleAndModuleVO readCoModuleAndModuleByModuleIdAndUserId(CoModuleAndModuleVO coModuleAndModule) {
		return coModuleDAO.selectCoModuleAndModuleByModuleIdAndUserId(coModuleAndModule);
	}

	public void removeCoModule(int costudy_moduleId) {
		coModuleDAO.deleteCoModule(costudy_moduleId);
	}

}

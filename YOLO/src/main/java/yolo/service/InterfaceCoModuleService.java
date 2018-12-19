package yolo.service;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;
import yolo.vo.CoModuleListViewVO;

public interface InterfaceCoModuleService {
	
	public int addCoModule(CoModuleAndModuleVO coModuleAndModule);
	
	public List<CoModuleAndModuleVO> readJoinModule(int userId);

	public CoModuleAndModuleVO readCoModuleAndModuleByModuleIdAndUserId(CoModuleAndModuleVO coModuleAndModule);
	
	public void removeCoModule(int costudy_moduleId);
	
	public List<CoModuleListViewVO> readcoModuleList(int userId);
	
}

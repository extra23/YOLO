package yolo.dao;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;

public interface InterfaceCoModuleDAO {
	
	public int insertCoModule(CoModuleAndModuleVO coModuleAndModule);
	
	public List<CoModuleAndModuleVO> selectJoinModule(int userId);
	
	public List<CoModuleListVO> coModuleList(int userId);

	public CoModuleAndModuleVO selectCoModuleAndModuleByModuleIdAndUserId(CoModuleAndModuleVO coModuleAndModule);
	
	public void deleteCoModule(int costudy_moduleId);
	
}

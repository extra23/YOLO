package yolo.dao;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;

public interface InterfaceCoModuleDAO {
	
	public List<CoModuleAndModuleVO> selectJoinModule(int userId);
	
	 
	public List<CoModuleListVO> coModuleList(int userId);

}

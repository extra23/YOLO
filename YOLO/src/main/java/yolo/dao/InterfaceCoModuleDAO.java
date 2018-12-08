package yolo.dao;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;

public interface InterfaceCoModuleDAO {
	
	public List<CoModuleAndModuleVO> selectJoinModule(int userId);

}

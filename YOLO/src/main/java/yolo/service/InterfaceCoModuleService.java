package yolo.service;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;

public interface InterfaceCoModuleService {
	
	public List<CoModuleAndModuleVO> readJoinModule(int userId);

}

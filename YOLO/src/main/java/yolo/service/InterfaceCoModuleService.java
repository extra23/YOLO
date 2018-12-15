package yolo.service;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;

public interface InterfaceCoModuleService {
	
	public List<CoModuleAndModuleVO> readJoinModule(int userId);
	
	public List<CoModuleListVO> readcoModuleList(int userId);

}

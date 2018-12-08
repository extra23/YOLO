package yolo.dao;

import java.util.List;

import yolo.vo.CoModuleAndModuleVO;

@AnnotationYoloMapper
public interface InterfaceCoModuleMapper {
	
	public List<CoModuleAndModuleVO> selectJoinModule(int userId);

}

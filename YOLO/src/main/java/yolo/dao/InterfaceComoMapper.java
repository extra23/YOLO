package yolo.dao;

import java.util.List;

import yolo.vo.ComoVO;

@AnnotationYoloMapper
public interface InterfaceComoMapper {
	
	public void insertComo(ComoVO como);
	
	public void deleteComoByModuleId(int moduleId);
	
	public void deleteComo(ComoVO como);
	
	public void deleteByUser(int userId);
	
	public List<ComoVO> selectComoList(int moduleId);
	
}

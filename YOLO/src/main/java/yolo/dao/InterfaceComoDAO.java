package yolo.dao;

import java.util.List;

import yolo.vo.ComoVO;

public interface InterfaceComoDAO {
	
	public void insertComo(ComoVO como);
	
	public void deleteComoByModuleId(int moduleId);
	
	public void deleteComo(ComoVO como);
	
	public List<ComoVO> selectComoList(int moduleId);

}

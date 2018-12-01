package yolo.dao;

import java.util.List;

import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

public interface InterfaceModuleDAO {
	
	
	public void insertModule(ModuleVO module);
	
	public ModuleVO selectModuleByUserId(int userId);

	public ModuleVO selectModuleByModuleId(int moduleId);
	
	public List<ModuleVO> selectModuleList();
	
	public void updateModule(ModuleVO module);
	
	public void deleteModule(int moduleId);
	
	//검색 결과를 출력ss
	public List<SearchVO> searchModule(String mTitle);
	
	public int countBySearch(String mTitle);

}

package yolo.dao;

import java.util.List;
import java.util.Map;

import yolo.service.ModuleRequest;
import yolo.vo.ModuleListVO;
import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

public interface InterfaceModuleDAO {
	
	
	public int insertModule(ModuleVO module);
	
	public ModuleVO selectModuleByUserId(int userId);

	public ModuleVO selectModuleByModuleId(int moduleId);
	
	public List<ModuleVO> selectModuleList();
	
	public List<ModuleVO> selectModuleListByCourseId(int courseId);
	
	public List<ModuleVO> selectModuleListByUserId(int userId);
	
	public void updateModule(ModuleVO module);
	
	public void deleteModule(int moduleId);
	
	public void deleteMuser(int userId);
	
	public List<SearchVO> searchModule(String mTitle);
	
	public int countBySearch(String mTitle);
	
	public List<ModuleListVO> relatedModule();
	
	public List<ModuleListVO> moduleListPage();
	
	public List<ModuleListVO> myModuleList(int userId);
	
	public List<ModuleVO> moduleListBox();

	public int lastInsertId();
}

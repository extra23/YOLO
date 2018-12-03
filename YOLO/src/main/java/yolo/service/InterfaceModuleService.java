package yolo.service;

import java.util.List;

import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

public interface InterfaceModuleService {
	
	public void addModule(ModuleVO module);
	
	public ModuleVO readModuleByUserId(int userId);
	
	public ModuleVO readModuleByModuleId(int moduleId);
	
	public List<ModuleVO> readModuleList();
	
	public List<ModuleVO> readModuleListByCourseId(int courseId);
	
	public void modifyModule(ModuleVO module);
	
	public void removeModule(int moduleId);
	
	public List<SearchVO> searchModule(String mTitle);
	
	public int countBySearch(String mTitle);

}

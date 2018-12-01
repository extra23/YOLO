package yolo.dao;

import java.util.List;

import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

@AnnotationUserMapper
public interface InterfaceModuleMapper {
	//ss

	public void insertModule(ModuleVO module);
	
	public ModuleVO selectModuleByUserId(int userId);
	
	public ModuleVO selectModuleByModuleId(int moduleId);
	
	public List<ModuleVO> selectModuleList();
	
	public void updateModule(ModuleVO module);
	
	public void deleteModule(int moduleId);
	
	public List<SearchVO> searchModule(String mTitle);
}

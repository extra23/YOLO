package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;
//ss
@Repository("ModuleDAO")
public class ModuleDAO implements InterfaceModuleDAO {
	
	@Autowired
	InterfaceModuleMapper moduleMapper;

	public void insertModule(ModuleVO module) {
		
		moduleMapper.insertModule(module);

	}

	public ModuleVO selectModuleByUserId(int userId) {
		
		ModuleVO module = moduleMapper.selectModuleByUserId(userId);
		
		return module;
	}

	public ModuleVO selectModuleByModuleId(int moduleId) {
		
		ModuleVO module = moduleMapper.selectModuleByModuleId(moduleId);
		
		return module;
	}

	public List<ModuleVO> selectModuleList() {
		
		List<ModuleVO> moduleList =moduleMapper.selectModuleList();	
			
		return moduleList ;		
	}
	
	public List<ModuleVO> selectModuleListByCourseId(int courseId) {
		List<ModuleVO> moduleList = moduleMapper.selectModuleListByCourseId(courseId);
		return moduleList;
	}

	public void updateModule(ModuleVO module) {
		
		moduleMapper.updateModule(module);

	}

	public void deleteModule(int moduleId) {
		
		moduleMapper.deleteModule(moduleId);

	}

	public List<SearchVO> searchModule(String mTitle) {
		
		List<SearchVO> moduleList = moduleMapper.searchModule(mTitle);
		
		return moduleList;
	}

	public int countBySearch(String mTitle) {
		int count = moduleMapper.countBySearch(mTitle);
		return count;
	}

}

package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceModuleDAO;

import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

@Service("ModuleService")
public class ModuleService implements InterfaceModuleService {
	
	//ss
	@Autowired
	InterfaceModuleDAO moduleDAO;

	public void addModule(ModuleVO module) {
		
		moduleDAO.insertModule(module);

	}

	public ModuleVO readModuleByUserId(int userId) {
		
		
		return moduleDAO.selectModuleByUserId(userId);
	}

	public ModuleVO readModuleByModuleId(int moduleId) {
		// TODO Auto-generated method stub
		return moduleDAO.selectModuleByModuleId(moduleId);
	}

	public List<ModuleVO> readModuleList() {
		// TODO Auto-generated method stub
		return moduleDAO.selectModuleList();
	}

	public void modifyModule(ModuleVO module) {
		
		moduleDAO.updateModule(module);

	}

	public void removeModule(int moduleId) {
		
		moduleDAO.deleteModule(moduleId);

	}

	public List<SearchVO> searchModule(String mTitle) {
		// TODO Auto-generated method stub
		return moduleDAO.searchModule(mTitle);
	}

	public int countBySearch(String mTitle) {
		
		return moduleDAO.countBySearch(mTitle);
	}

}

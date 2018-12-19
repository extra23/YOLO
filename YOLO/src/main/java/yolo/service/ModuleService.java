package yolo.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceModuleDAO;
import yolo.vo.ModuleListVO;
import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;

@Service("ModuleService")
public class ModuleService implements InterfaceModuleService {
	
	@Autowired
	InterfaceModuleDAO moduleDAO;

	public void addModule(ModuleVO module) {
		moduleDAO.insertModule(module);
	}

	public ModuleVO readModuleByUserId(int userId) {
		return moduleDAO.selectModuleByUserId(userId);
	}

	public ModuleVO readModuleByModuleId(int moduleId) {
		return moduleDAO.selectModuleByModuleId(moduleId);
	}

	public List<ModuleVO> readModuleList() {
		return moduleDAO.selectModuleList();
	}
	
	public List<ModuleVO> readModuleListByCourseId(int courseId) {
		return moduleDAO.selectModuleListByCourseId(courseId);
	}
	
	public List<ModuleVO> readModuleListByUserId(int userId) {
		return moduleDAO.selectModuleListByUserId(userId);
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
	
	public Map<Integer, ModuleRequest> relatedModule() {
		List<ModuleListVO> relatedModule = moduleDAO.relatedModule();
		Map<Integer, ModuleRequest> moduleMap = new LinkedHashMap<Integer, ModuleRequest>();
		
		for (ModuleListVO module : relatedModule) {
			if (moduleMap.containsKey(module.getModuleId())) {
				moduleMap.get(module.getModuleId()).addcTitle(module.getcTitle());
			} else {
				moduleMap.put(module.getModuleId(), new ModuleRequest(module));
			}
		}
		
		return moduleMap;
	}
	
	public List<ModuleListVO> moduleListPage(){
		return moduleDAO.moduleListPage();
	}
	
	public List<ModuleListVO> myModuleList(int userId){
		return moduleDAO.myModuleList(userId);
	}

	public List<ModuleVO> moduleListBox(){
		return moduleDAO.moduleListBox();
	}

}

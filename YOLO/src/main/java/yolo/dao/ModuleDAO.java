package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.ModuleListVO;
import yolo.vo.ModuleVO;
import yolo.vo.SearchVO;
//ss
@Repository("ModuleDAO")
public class ModuleDAO implements InterfaceModuleDAO {
	
	@Autowired
	InterfaceModuleMapper moduleMapper;

	public int insertModule(ModuleVO module) {
		
		int moduleId = moduleMapper.insertModule(module);
		return moduleId;
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
	
	public List<ModuleVO> selectModuleListByUserId(int userId) {
		List<ModuleVO> moduleList = moduleMapper.selectModuleListByUserId(userId);
		return moduleList;
	}

	public void updateModule(ModuleVO module) {
		
		moduleMapper.updateModule(module);

	}

	public void deleteModule(int moduleId) {
		
		moduleMapper.deleteModule(moduleId);

	}
	
	public void deleteMuser(int userId) {
		
		moduleMapper.deleteMuser(userId);

	}

	public List<SearchVO> searchModule(String mTitle) {
		
		List<SearchVO> moduleList = moduleMapper.searchModule(mTitle);
		
		return moduleList;
	}

	public int countBySearch(String mTitle) {
		int count = moduleMapper.countBySearch(mTitle);
		return count;
	}
	
	public List<ModuleListVO> relatedModule(){
		List<ModuleListVO> relatedModule = moduleMapper.relatedModule();
		return relatedModule;
	}
	
	public List<ModuleListVO> moduleListPage(){
		List<ModuleListVO> moduleListPage = moduleMapper.moduleListPage();
		return moduleListPage;
	}
	
	public List<ModuleListVO> myModuleList(int userId){
		List<ModuleListVO> myModuleList = moduleMapper.myModuleList(userId);
		return myModuleList;
	}

	public List<ModuleVO> moduleListBox(){
		List<ModuleVO> moduleListBox = moduleMapper.moduleListBox();
		return moduleListBox;
	}

	public int lastInsertId() {
		// TODO Auto-generated method stub
		return 0;
	}


	

}

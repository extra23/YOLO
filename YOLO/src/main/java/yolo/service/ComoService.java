package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceComoDAO;
import yolo.dao.InterfaceModuleDAO;
import yolo.vo.ComoVO;
import yolo.vo.ModuleVO;

@Service("ComoService")
public class ComoService implements InterfaceComoService {

	@Autowired
	InterfaceComoDAO comoDAO;
	
	@Autowired
	InterfaceModuleDAO moduleDAO;
	
	public void insertComo(int[] courseIdArr, ModuleVO module) {
		
		/*int moduleId = moduleDAO.insertModule(module);*/
		moduleDAO.insertModule(module);
		int moduleId = module.getModuleId();
		System.out.println("moduleId : " + moduleId);
		
		for(int i = 0; i<courseIdArr.length; i++) {
			
			ComoVO como = new ComoVO(courseIdArr[i], moduleId);
			
			comoDAO.insertComo(como);
		}
		

	}

	public void updateComo(int moduleId, int[]courseIdArr, ModuleVO module) {
		
		moduleDAO.updateModule(module);
		
		comoDAO.deleteComoByModuleId(moduleId);
		
		for(int i = 0; i<courseIdArr.length; i++) {
			
			ComoVO como = new ComoVO(courseIdArr[i], moduleId);
			
			comoDAO.insertComo(como);
		}
		
	}

	public void deleteComo(int moduleId) {
		
		moduleDAO.deleteModule(moduleId);
		
		comoDAO.deleteComoByModuleId(moduleId);
		
	}

	public List<ComoVO> selectComoList(int moduleId) {
		
		return comoDAO.selectComoList(moduleId);
	}


	

}

package yolo.service;

import java.util.List;

import yolo.vo.ComoVO;
import yolo.vo.ModuleVO;

public interface InterfaceComoService {
	
	public void insertComo(int[] courseIdArr, ModuleVO module);
	
	public void updateComo(int moduleId, int[]courseIdArr, ModuleVO module);
	
	public void deleteComo(int moduleId);
	
	public List<ComoVO> selectComoList(int moduleId);
	

}

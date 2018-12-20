package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.ComoVO;

@Repository("ComoDAO")
public class ComoDAO implements InterfaceComoDAO {
	
	@Autowired InterfaceComoMapper comoMapper;

	public void insertComo(ComoVO como) {
		comoMapper.insertComo(como);
	}

	public void deleteComoByModuleId(int moduleId) {
		comoMapper.deleteComoByModuleId(moduleId);
	}

	public void deleteComo(ComoVO como) {
		comoMapper.deleteComo(como);
	}
	
	public void deleteByUser(int userId) {
		comoMapper.deleteByUser(userId);
	}

	public List<ComoVO> selectComoList(int moduleId) {
		List<ComoVO> comoList = comoMapper.selectComoList(moduleId);
		return comoList;
	}

}

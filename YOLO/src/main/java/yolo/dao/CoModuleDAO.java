package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.CoModuleAndModuleVO;

@Repository("CoModuleDAO")
public class CoModuleDAO implements InterfaceCoModuleDAO {
	
	@Autowired
	private InterfaceCoModuleMapper coModuleMapper;

	public List<CoModuleAndModuleVO> selectJoinModule(int userId) {
		return coModuleMapper.selectJoinModule(userId);
	}

}

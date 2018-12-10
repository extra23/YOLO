package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.PwdQuestionVO;

@Repository("PwdQuestionDAO")
public class PwdQuestionDAO implements InterfacePwdQuestionDAO {

	@Autowired
	private InterfacePwdQuestionMapper pwdQuestionMapper;
	
	public List<PwdQuestionVO> selectQuestionList() {
		List<PwdQuestionVO> qList = pwdQuestionMapper.selectQList();
		return qList;
	}

}

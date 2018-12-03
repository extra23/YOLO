package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.P_Question;

@Repository("PQuestionDAO")
public class PQuestionDAO implements InterfacePQuestionDAO {

	@Autowired
	private InterfacePQuestionMapper pQuestionMapper;
	
	public List<P_Question> selectQuestionList() {
		List<P_Question> qList = pQuestionMapper.selectQList();
		return qList;
	}

}

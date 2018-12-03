package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfacePQuestionDAO;
import yolo.vo.P_Question;

@Service("PQuestionService")
public class PQuestionService implements InterfacePQuestionService {

	@Autowired
	InterfacePQuestionDAO pQuestionDAO;
	
	public List<P_Question> readQList() {
		return pQuestionDAO.selectQuestionList();
	}

}

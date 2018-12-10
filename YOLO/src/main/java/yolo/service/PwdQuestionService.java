package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfacePwdQuestionDAO;
import yolo.vo.PwdQuestionVO;

@Service("PwdQuestionService")
public class PwdQuestionService implements InterfacePwdQuestionService {

	@Autowired
	InterfacePwdQuestionDAO pwdQuestionDAO;
	
	public List<PwdQuestionVO> readQList() {
		return pwdQuestionDAO.selectQuestionList();
	}

}

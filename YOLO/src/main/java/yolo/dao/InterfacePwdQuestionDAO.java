package yolo.dao;

import java.util.List;

import yolo.vo.PwdQuestionVO;

public interface InterfacePwdQuestionDAO {
	public List<PwdQuestionVO> selectQuestionList();
}

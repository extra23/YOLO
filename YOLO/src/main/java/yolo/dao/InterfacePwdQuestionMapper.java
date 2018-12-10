package yolo.dao;

import java.util.List;

import yolo.vo.PwdQuestionVO;

@AnnotationYoloMapper
public interface InterfacePwdQuestionMapper {

public List<PwdQuestionVO> selectQList();
}

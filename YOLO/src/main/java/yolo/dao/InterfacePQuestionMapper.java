package yolo.dao;

import java.util.List;

import yolo.vo.P_Question;

@AnnotationYoloMapper
public interface InterfacePQuestionMapper {

public List<P_Question> selectQList();
}

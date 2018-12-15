package yolo.dao;

import java.util.List;

import yolo.vo.HistoryVO;

@AnnotationYoloMapper
public interface InterfaceHistoryMapper {

	public int insertHistory(HistoryVO history);
	
	public List<HistoryVO> selectHistoryByUserId(int userId);
	
	public HistoryVO selectHistoryByhistoryId(int historyId);
	
	public HistoryVO selectHistoryByUserId(HistoryVO history);
	
	public List<HistoryVO> selectHistoryList();
	
	public void deleteHistory(int historyId);
	
	public List<HistoryVO> historyListPage();
	
	public List<HistoryVO> myHistoryList(int userId);
	
	
}
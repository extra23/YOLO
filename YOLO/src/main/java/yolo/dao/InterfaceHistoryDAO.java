package yolo.dao;

import java.util.List;

import yolo.vo.HistoryVO;

public interface InterfaceHistoryDAO {
	
	public void insertHistory(HistoryVO history);
	
	public List<HistoryVO> selectHistoryByUserId(int userId);
	
	public HistoryVO selectHistoryByHistoryId(int historyId);
	
	public List<HistoryVO> selectHistoryList();
	
	public void deleteHistory(int historyId);
	
	public List<HistoryVO> historyListPage();
	
	public List<HistoryVO> myHistoryList(int userId);


}
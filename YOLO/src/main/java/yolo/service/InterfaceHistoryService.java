package yolo.service;

import java.util.List;

import yolo.vo.HistoryVO;

public interface InterfaceHistoryService {

	public void addHistory(HistoryVO history);
	
	public List<HistoryVO> readHistoryByUserId(int userId);
	
	public HistoryVO readHistoryByHistoryId(int historyId);
	
	public List<HistoryVO> readHistoryList();
	
	public void removeHistory(int historyId);
	
	public List<HistoryVO> historyListPage();
	
	public List<HistoryVO> myHistoryList(int userId);
}
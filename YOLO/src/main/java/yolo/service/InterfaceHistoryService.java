package yolo.service;

import java.util.List;

import yolo.vo.HistoryVO;

public interface InterfaceHistoryService {

	public int addHistory(HistoryVO history);
	
	public HistoryVO readHistoryByTopicIdAndUserId(HistoryVO history);
	
	/*public List<HistoryVO> readHistoryByUserId(int userId);
	
	public HistoryVO readHistoryByHistoryId(int historyId);
	
	public HistoryVO readHistoryByUserId(HistoryVO history);
	
	public List<HistoryVO> readHistoryList();*/
	
	public void removeHistory(int removeHistoryId);
	
	/*public List<HistoryVO> historyListPage();
	
	public List<HistoryVO> myHistoryList(int userId);*/
}
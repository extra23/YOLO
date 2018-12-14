package yolo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.vo.HistoryVO;

@Repository("HistoryDAO")
public class HistoryDAO implements InterfaceHistoryDAO{
	
	@Autowired
	InterfaceHistoryMapper historyMapper;

	public void insertHistory(HistoryVO history) {
		historyMapper.insertHistory(history);
		
	}

	public List<HistoryVO> selectHistoryByUserId(int userId) {
		List<HistoryVO> history = historyMapper.selectHistoryByUserId(userId);
		return history;
	}

	public HistoryVO selectHistoryByHistoryId(int historyId) {
		HistoryVO history = historyMapper.selectHistoryByhistoryId(historyId);
		return history;
	}

	public List<HistoryVO> selectHistoryList() {
		List<HistoryVO> historyList = historyMapper.selectHistoryList();
		return historyList;
	}

	public void deleteHistory(int historyId) {
		historyMapper.deleteHistory(historyId);
		
	}
	

	public List<HistoryVO> historyListPage() {
		List<HistoryVO> historyListPage = historyMapper.historyListPage();
		return historyListPage;
	}

	public List<HistoryVO> myHistoryList(int userId) {
		List<HistoryVO> myHistoryList = historyMapper.myHistoryList(userId);
		return myHistoryList;
	}

	
	

}
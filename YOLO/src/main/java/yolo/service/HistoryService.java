package yolo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceHistoryDAO;
import yolo.vo.HistoryVO;

@Service("HistoryService")
public class HistoryService implements InterfaceHistoryService{

	@Autowired
	InterfaceHistoryDAO historyDAO;
	
	public int addHistory(HistoryVO history) {
		return historyDAO.insertHistory(history);	
	}
	
	public HistoryVO readHistoryByTopicIdAndUserId(HistoryVO history) {
		return historyDAO.selectHistoryByTopicIdAndUserId(history);
	}

	/*public List<HistoryVO> readHistoryByUserId(int userId) {
		return historyDAO.selectHistoryByUserId(userId);
	}

	public HistoryVO readHistoryByHistoryId(int historyId) {
		return historyDAO.selectHistoryByHistoryId(historyId);
	}

	public HistoryVO readHistoryByUserId(HistoryVO history) {
		return historyDAO.selectHistoryByUserId(history);
	}
	public List<HistoryVO> readHistoryList() {
		return historyDAO.selectHistoryList();
	}*/

	public void removeHistory(int historyId) {
		historyDAO.deleteHistory(historyId);	
	}

	/*public List<HistoryVO> historyListPage() {
		return historyDAO.historyListPage();
	}

	public List<HistoryVO> myHistoryList(int userId) {
		return historyDAO.myHistoryList(userId);
	}*/
	
}
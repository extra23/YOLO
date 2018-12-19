package yolo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceCoModuleDAO;
import yolo.vo.CoLink;
import yolo.vo.CoModuleAndModuleVO;
import yolo.vo.CoModuleListVO;
import yolo.vo.CoModuleListViewVO;

@Service("CoModuleService")
public class CoModuleService implements InterfaceCoModuleService {
	
	@Autowired
	private InterfaceCoModuleDAO coModuleDAO;
	
	public int addCoModule(CoModuleAndModuleVO coModuleAndModule) {
		return coModuleDAO.insertCoModule(coModuleAndModule);
	}

	public List<CoModuleAndModuleVO> readJoinModule(int userId) {
		return coModuleDAO.selectJoinModule(userId);
	}



	public CoModuleAndModuleVO readCoModuleAndModuleByModuleIdAndUserId(CoModuleAndModuleVO coModuleAndModule) {
		return coModuleDAO.selectCoModuleAndModuleByModuleIdAndUserId(coModuleAndModule);
	}

	public void removeCoModule(int costudy_moduleId) {
		coModuleDAO.deleteCoModule(costudy_moduleId);
	}
	
	public List<CoModuleListViewVO> readcoModuleList(int userId) {
		List<CoModuleListVO> comList= coModuleDAO.coModuleList(userId);
		List<CoModuleListViewVO> coModuleListViewVOs = new ArrayList<CoModuleListViewVO>();
		List<CoLink> cLinks= new ArrayList<CoLink>();
		
		for (int i = 0; i< comList.size(); i++) {//디비에있던 로우수만큼 반복해서 도는 for문 생성.
			
			//리스트에선 1, 1+1 번째의 모듈 아이디가 서로 같으면!!
			if(i+1 < comList.size() && comList.get(i).getModuleId() == comList.get(i+1).getModuleId()) {
				cLinks.add(new CoLink(comList.get(i).getcTitle(),comList.get(i).getCourseId()));
				continue;
			}else {
				cLinks.add(new CoLink(comList.get(i).getcTitle(),comList.get(i).getCourseId()));
			}
			
			
			System.out.println(comList.get(i).getCourseId()+": i"+i);
			coModuleListViewVOs.add(
					new CoModuleListViewVO(
							comList.get(i).getCostudy_moduleId(),
							comList.get(i).getModuleId(),
							comList.get(i).getUserId(),
							cLinks,
							comList.get(i).getmTitle(),
							comList.get(i).getNickname(),
							comList.get(i).getUserId(),
							comList.get(i).getUdate()
							)
					);
			cLinks= new ArrayList<CoLink>();
			
		}
		return coModuleListViewVOs;
	}


}

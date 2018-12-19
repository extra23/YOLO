package yolo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.dao.InterfaceCoCourseDAO;
import yolo.vo.CoCourseAndCourseVO;
import yolo.vo.CoCourseListVO;
import yolo.vo.CoCourseListViewVO;
import yolo.vo.MoLink;

@Service("CoCourseService")
public class CoCourseService implements InterfaceCoCourseService {

	@Autowired
	private InterfaceCoCourseDAO coCourseDAO;
	
	public int addCoCourse(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseDAO.insertCoCourse(coCourseAndCourse);
	}
	
	public List<CoCourseAndCourseVO> readJoinCourse(int userId) {
		// TODO Auto-generated method stub
		return coCourseDAO.selectJoinCourse(userId);
	}

	public CoCourseAndCourseVO readCoCourseByCourseIdAndUserId(CoCourseAndCourseVO coCourseAndCourse) {
		return coCourseDAO.selectCoCourseByCourseIdAndUserId(coCourseAndCourse);
	}

	public void removeCoCourse(int costudy_courseId) {
		coCourseDAO.deleteCoCourse(costudy_courseId);
	}
	
	public List<CoCourseListViewVO> readcoCourseList(int userId) {
		
		List<CoCourseListVO> cocList = coCourseDAO.coCourseList(userId);
		List<CoCourseListViewVO> coCourseListViewVOs = new ArrayList<CoCourseListViewVO>();
		List<MoLink> mLinks = new ArrayList<MoLink>();
		
		
    for (int i = 0; i< cocList.size(); i++) {//디비에있던 로우수만큼 반복해서 도는 for문 생성.
			
			//리스트에선 1, 1+1 번째의 모듈 아이디가 서로 같으면!!
			if(i+1 < cocList.size() && cocList.get(i).getCourseId() == cocList.get(i+1).getCourseId()) {
				mLinks.add(new MoLink(cocList.get(i).getmTitle(),cocList.get(i).getModuleId()));
				continue;
			}else {
				mLinks.add(new MoLink(cocList.get(i).getmTitle(),cocList.get(i).getModuleId()));
			}
			

			coCourseListViewVOs.add(
					new CoCourseListViewVO(
							cocList.get(i).getCostudy_courseId(),
							cocList.get(i).getCourseId(),
							cocList.get(i).getUserId(),
							mLinks,
							cocList.get(i).getcTitle(),
							cocList.get(i).getNickname(),
							cocList.get(i).getUserId(),
							cocList.get(i).getUdate()
							)
					);
		
			mLinks=new ArrayList<MoLink>();
		}
		return coCourseListViewVOs;
	}

	


}

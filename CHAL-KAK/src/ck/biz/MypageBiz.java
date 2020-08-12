package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.MypageDao;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;
import ck.vo.PictureVO;
import ck.vo.ReservationVO;

@Service
public class MypageBiz {
	
	@Autowired
	private MypageDao mypagedao;
	
	public List<NoticeBoardVO> Photo_Mypage(String id) {
		return mypagedao.Photo_Mypage(id);
	}

	// mypage from reservation
	public List<ReservationVO> Model_Mypage(String id) {
		return mypagedao.Model_Mypage(id);
	}

	public List<ReservationVO> Reserv_List(int bseq) {
		return mypagedao.Reserv_List(bseq);
	}
	
	public int updateReser(int rseq) {
		return mypagedao.updateReser(rseq);
	}

	public int findProfile(String id) {
		return mypagedao.findProfile(id);
	}
	
	public List<PhotographerVO> selectPhotographer(String id) {
		return mypagedao.selectPhotographer(id);
	}
	
	public int updatePhotographer(PhotographerVO vo) {
		return mypagedao.updatePhotographer(vo);
	}
	
	public int insertSaveProfile(PictureVO vo) {
		return mypagedao.insertSaveProfile(vo);
	}

	public String confirmProfile(String id) {
		return mypagedao.confirmProfile(id);
	}
	
}

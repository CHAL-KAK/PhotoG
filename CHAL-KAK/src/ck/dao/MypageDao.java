package ck.dao;

import java.util.List;

import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;
import ck.vo.PictureVO;
import ck.vo.ReservationVO;

public interface MypageDao {
	
	public List<NoticeBoardVO> Photo_Mypage(String id);

	public List<ReservationVO> Model_Mypage(String id);

	public List<ReservationVO> Reserv_List(int bseq);

	public int updateReser(int rseq);

	public int findProfile(String id);

	public List<PhotographerVO> selectPhotographer(String id);

	public int updatePhotographer(PhotographerVO vo);

	public int insertSaveProfile(PictureVO vo);

	public String confirmProfile(String id);
}

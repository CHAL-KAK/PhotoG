package ck.dao;

import java.util.List;

import ck.vo.NoticeBoardVO;
import ck.vo.ReservationVO;

public interface NoticeBoardDao {
	
	public List<NoticeBoardVO> boardAll();
	
	public List<NoticeBoardVO> boardOne(int seq);
	
	public int insertNoticeForm(NoticeBoardVO noticeboard);
	
	public int insertReservationForm(ReservationVO vo);
}

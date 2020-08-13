package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.NoticeBoardDao;
import ck.vo.NoticeBoardVO;
import ck.vo.ReservationVO;

@Service
public class NoticeBoardBiz {

	@Autowired
	private NoticeBoardDao noticeBoardDao;

	public List<NoticeBoardVO> boardAll() {
		return noticeBoardDao.boardAll();
	}

	public List<NoticeBoardVO> boardOne(int seq) {
		return noticeBoardDao.boardOne(seq);
	}

	public int insertNoticeForm(NoticeBoardVO vo) {
		return noticeBoardDao.insertNoticeForm(vo);
	}

	public int insertReservationForm(ReservationVO vo) {
		return noticeBoardDao.insertReservationForm(vo);
	}
	
	public List<NoticeBoardVO> searchBoard(NoticeBoardVO vo){
		return noticeBoardDao.boardSearch(vo);
	}

}

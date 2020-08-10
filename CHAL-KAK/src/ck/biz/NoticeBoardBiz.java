package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.MypageJDBC;
import ck.dao.NoticeBoardDao;
import ck.vo.NoticeBoardVO;

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



}

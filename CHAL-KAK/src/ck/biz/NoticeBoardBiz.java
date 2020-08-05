package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.MypageJDBC;
import ck.dao.NoticeBoardDaoImpl;
import ck.vo.NoticeBoardVO;

@Service
public class NoticeBoardBiz {
	@Autowired
	private NoticeBoardDaoImpl noticeboarddao;

	
	@Autowired
	@Qualifier("mypageJDBC")
	private MypageJDBC mypageJDBC;
	
	public List<NoticeBoardVO> boardAll() {
		return noticeboarddao.boardAll();
	}

	// mypage notice board
	public List<NoticeBoardVO> select(String id) {
		return mypageJDBC.Photo_Mypage(id);
	}

	//
}

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
	@Qualifier("noticeBoardDaoImpl")
	private NoticeBoardDaoImpl noticeBoardDaoImpl;

	
	@Autowired
	@Qualifier("mypageJDBC")
	private MypageJDBC mypageJDBC;
	
	public List<NoticeBoardVO> boardAll() {
		return noticeBoardDaoImpl.boardAll();
	}

	//photographer mypage notice board
	public List<NoticeBoardVO> photo_mypage(String id) {
		return mypageJDBC.Photo_Mypage(id);
	}

	//model mypage reservation 
	public List<NoticeBoardVO> model_mypage(String id) {
		return mypageJDBC.Model_Mypage(id);
	}
}

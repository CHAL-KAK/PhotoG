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

	/*
	 * @Autowired private PhotoSaveDao photoSaveDao;
	 */

	public List<NoticeBoardVO> boardAll() {
		return noticeBoardDaoImpl.boardAll();
	}

	// mypage notice board
	public List<NoticeBoardVO> photo_mypage(String id) {
		return mypageJDBC.Photo_Mypage(id);
	}
	
	//mypage from reservation
	public List<NoticeBoardVO> model_mypage(String id) {
		return mypageJDBC.Model_Mypage(id);
	}

}

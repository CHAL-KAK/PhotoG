package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.MypageJDBC;
import ck.vo.NoticeBoardVO;
import ck.vo.ReservationVO;

@Service
public class MypageListBiz {
	
	@Autowired
	@Qualifier("mypageJDBC")
	private MypageJDBC mypageJDBC;
	
	// mypage notice board
		public List<NoticeBoardVO> photo_mypage(String id) {
			return mypageJDBC.Photo_Mypage(id);
		}
		
		//mypage from reservation
		public List<ReservationVO> model_mypage(String id) {
			return mypageJDBC.Model_Mypage(id);
		}
}

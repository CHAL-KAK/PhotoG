package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.controller.CKController;
import ck.dao.NoticeFormDao;
import ck.vo.NoticeBoardVO;

@Service
public class NoticeFormBiz {
	
	@Autowired
	@Qualifier(value="noticeFormDaoImpl")
	private NoticeFormDao noticeFormDao;
	
	public int insertNoticeForm(NoticeBoardVO vo) {
		return noticeFormDao.insertNoticeForm(vo);
	};
	
	

}

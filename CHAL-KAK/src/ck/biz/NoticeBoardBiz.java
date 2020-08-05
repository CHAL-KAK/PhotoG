package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.NoticeBoardDaoImpl;
import ck.vo.NoticeBoardVO;

@Service
public class NoticeBoardBiz {

	@Autowired
	@Qualifier("noticeBoardDaoImpl")
	private NoticeBoardDaoImpl noticeBoardDaoImpl;

	public List<NoticeBoardVO> boardAll() {
		return noticeBoardDaoImpl.boardAll();
	}
}

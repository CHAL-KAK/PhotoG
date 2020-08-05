package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.PhotographerJoinDao;
import ck.vo.PhotographerVO;

@Service("photographerJoinBiz")
public class PhotographerJoinBiz {
	@Autowired
	private PhotographerJoinDao photographerjoindao;
	
	
	public void insertPhotographer(PhotographerVO vo) {
		photographerjoindao.insertPhotographer(vo);
	}

}

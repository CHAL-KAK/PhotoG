package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.PhotographerJoinDao;
import ck.vo.PhotographerVO;

@Service
public class PhotographerJoinBiz {
	@Autowired
	private PhotographerJoinDao photographerjoindao;
	
	
	public int insertPhotographer(PhotographerVO vo) {
		return photographerjoindao.insertPhotographer(vo);
	}

}
package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.JoinDao;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Service
public class JoinBiz {

	@Autowired
	private JoinDao joindao;

	public int insertModel(ModelVO vo) {
		return joindao.insertModel(vo);
	}

	public int insertPhotographer(PhotographerVO vo) {
		return joindao.insertPhotographer(vo);
	}

	public int model_idcheck(String id) {
		return joindao.Model_IDCheck(id);
	}

	public int photo_idcheck(String id) {
		return joindao.Photo_IDCheck(id);
	}
	
}

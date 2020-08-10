package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.ModelLoginDao;
import ck.dao.PhotographerLoginDao;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Service(value = "photographerLoginBiz")
public class PhotographerLoginBiz {
	
	@Autowired
	private  PhotographerLoginDao photographerLoginDao;
	

	public PhotographerVO searchPhotographer(PhotographerVO vo) {
		return photographerLoginDao.searchPhotographer(vo);
	}

}

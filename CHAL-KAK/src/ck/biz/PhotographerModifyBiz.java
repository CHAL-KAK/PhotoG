package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.PhotographerModifyDao;
import ck.vo.PhotographerVO;


@Service
public class PhotographerModifyBiz {
	
	@Autowired
	@Qualifier(value="photographerModifyDaoImpl")
	private PhotographerModifyDao photographerModifyDao;
	
	public List<PhotographerVO> selectPhotographer(String id) {
		return photographerModifyDao.selectPhotographer(id);
	}
	
	public int updatePhotographer(PhotographerVO vo) {
		return photographerModifyDao.updatePhotographer(vo);
	
	
}
}
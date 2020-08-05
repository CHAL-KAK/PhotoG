package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.ModelLoginDao;
import ck.vo.ModelVO;

@Service(value = "modelLoginBiz")
public class ModelLoginBiz {
	
	@Autowired
	private  ModelLoginDao loginDao;
	

	public ModelVO searchModel(ModelVO vo) {
		return loginDao.searchModel(vo);
	}

}

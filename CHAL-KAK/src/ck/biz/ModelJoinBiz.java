package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.ModelJoinDao;
import ck.vo.ModelVO;

@Service
public class ModelJoinBiz {
	@Autowired
	private ModelJoinDao modeljoindao;
	
	public int insertModel(ModelVO vo) {
		return modeljoindao.insertModel(vo);
	}

}

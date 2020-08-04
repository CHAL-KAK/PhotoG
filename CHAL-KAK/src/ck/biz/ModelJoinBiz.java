package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.ModelJoinDao;
import ck.dao.NoticeBoardDaoImpl;
import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;

@Service("memberJoinBiz")
public class ModelJoinBiz {
	@Autowired
	private ModelJoinDao modeljoindao;
	
	public void insertModel(ModelVO vo) {
		modeljoindao.insertModel(vo);
	}

}

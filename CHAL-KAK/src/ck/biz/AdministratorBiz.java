package ck.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.AdministratorDao;
import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;

@Service
public class AdministratorBiz {

	@Autowired
	private AdministratorDao administratorDao;
	
	public List<ModelVO> confirmModelList() {
		return administratorDao.confrimModelList();
	}

	public List<PhotographerVO> confirmPhotographerList() {
		return administratorDao.confirmPhotographerList();
	}

	public void deleteModel(int seq) {
		administratorDao.deleteModel(seq);
	}

	public void deletePhotographer(int seq) {
		administratorDao.deletePhotographer(seq);
	}

	public List<NoticeBoardVO> confirmBoardList() {
		return administratorDao.confirmBoardList();
	}

}

package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.LoginDao;
import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Service
public class LoginBiz {

	@Autowired
	private LoginDao logindao;

	public ModelVO searchModel(ModelVO vo) {
		return logindao.searchModel(vo);
	}

	public PhotographerVO searchPhotographer(PhotographerVO vo) {
		return logindao.searchPhotographer(vo);
	}

	public AdministratorVO searchAdministrator(AdministratorVO vo) {
		return logindao.searchAdministrator(vo);
	}
	
}

package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.AdministratorLoginDao;
import ck.dao.ModelLoginDao;
import ck.vo.AdministratorVO;
import ck.vo.ModelVO;

@Service
public class AdministratorLoginBiz {
	
	@Autowired
	private  AdministratorLoginDao administratorLoginDao;
	

	public AdministratorVO searchAdministrator(AdministratorVO vo) {
		return administratorLoginDao.searchAdministrator(vo);
	}

}

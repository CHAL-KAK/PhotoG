package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.AdministratorLoginDao;
import ck.dao.ModelLoginDao;
import ck.vo.AdministratorVO;
import ck.vo.ModelVO;

@Service(value = "administratorLoginBiz")
public class AdministratorLoginBiz {
	
	@Autowired
	private  AdministratorLoginDao loginDao;
	

	public AdministratorVO searchAdministrator(AdministratorVO vo) {
		return loginDao.searchAdministrator(vo);
	}

}

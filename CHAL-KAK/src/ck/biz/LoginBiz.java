package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.LoginDao;
import ck.vo.ModelVO;

@Service(value = "loginBiz")
public class LoginBiz {
	
	@Autowired
	private  LoginDao loginDao;
	

	public ModelVO searchModel(ModelVO vo) {
		return loginDao.searchModel(vo);
	}

}

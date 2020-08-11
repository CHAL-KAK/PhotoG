package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.IdCheckJDBC;

@Service
public class CheckIDBiz {

	@Autowired
	private IdCheckJDBC idCheckJDBC;

	public int model_idcheck(String id) {
		return idCheckJDBC.Model_IDCheck(id);
	}

	public int photo_idcheck(String id) {
		return idCheckJDBC.Photo_IDCheck(id);
	}
}

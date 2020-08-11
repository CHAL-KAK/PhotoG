package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ck.dao.ProfileDao;
import ck.vo.PictureVO;

@Service
public class ProfileBiz {
	@Autowired
	private ProfileDao profileDao;
	
	public int insertSaveProfile(PictureVO vo) {
		return profileDao.insertSaveProfile(vo);
	}

	public String confirmProfile(String id) {
		return profileDao.confirmProfile(id);
	}

}

package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;

import ck.dao.PhotoSaveDao;
import ck.vo.PhotoSaveVO;

public class PhotoSaveBiz {

	@Autowired
	private PhotoSaveDao photoSaveDao;

	public int insertPhoto(PhotoSaveVO ps) {
		return photoSaveDao.insertPhoto(ps);
	}
}

package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import ck.vo.PhotoSaveVO;

public class PhotoSaveDaoImpl implements PhotoSaveDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertPhoto(PhotoSaveVO ps) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("INSERT INTO MAP VALUES(MAP_SEQ.NEXTVAL, ?, ?, ?, ?)",
				new Object[] {ps.getLat(), ps.getLon(), ps.getPath(), ps.getP_id()});	
	}
}

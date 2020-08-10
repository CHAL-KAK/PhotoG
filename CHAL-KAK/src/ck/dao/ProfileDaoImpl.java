package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ck.vo.PictureVO;

@Repository
public class ProfileDaoImpl implements ProfileDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public int insertSaveProfile(PictureVO vo) {
		return jdbcTemplate.update("INSERT INTO PICTURE VALUES(PIC_SEQ.NEXTVAL, ?, ?, ?)", new Object[] {vo.getP_id(), vo.getFile_path01(), vo.getFile_path02()});
	}

}

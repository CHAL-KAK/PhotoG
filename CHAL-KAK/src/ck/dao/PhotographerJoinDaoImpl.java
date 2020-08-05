package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ck.vo.PhotographerVO;

@Repository
public class PhotographerJoinDaoImpl implements PhotographerJoinDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int insertPhotographer(PhotographerVO vo) {
		return jdbcTemplate.update("INSERT INTO PHOTOGRAPHER VALUES(PHOTOG_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				new Object[] { vo.getP_id(), vo.getP_password(), vo.getP_name(), vo.getP_gender(), vo.getP_bday(),
						vo.getP_ka_id(), vo.getCamera_seq(), vo.getConcept(), vo.getCareer(), vo.getUrl() });
	}

}

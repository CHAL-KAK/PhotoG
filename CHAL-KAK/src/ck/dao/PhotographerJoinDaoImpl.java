package ck.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import ck.vo.PhotographerVO;

public class PhotographerJoinDaoImpl extends JdbcDaoSupport implements PhotographerJoinDao {

	@Override
	public void insertPhotographer(PhotographerVO vo) {
		getJdbcTemplate().update("BEGIN PHOTOGRAPHER_JOIN(PHOTOG_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); END;", new Object[] {vo.getP_id(), vo.getP_password(), vo.getP_name(), vo.getP_gender(), vo.getP_bday(), vo.getP_ka_id(), vo.getCamera_seq(), vo.getConcept(), vo.getCareer(), vo.getUrl()});
	}

}

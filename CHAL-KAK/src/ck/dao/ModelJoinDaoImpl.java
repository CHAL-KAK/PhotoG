package ck.dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import ck.vo.ModelVO;


public class ModelJoinDaoImpl extends JdbcDaoSupport implements ModelJoinDao {
	@Override
	public void insertModel(ModelVO vo) {
		getJdbcTemplate().update("BEGIN MODEL_JOIN(MODEL_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?); END;", new Object[] {vo.getM_id(), vo.getM_password(), vo.getM_name(), vo.getM_gender(), vo.getM_bday(), vo.getM_ka_id()});
	}


}

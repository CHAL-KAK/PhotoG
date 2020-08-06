package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ck.vo.ModelVO;

@Repository
public class ModelJoinDaoImpl implements ModelJoinDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int insertModel(ModelVO vo) {
		return jdbcTemplate.update("INSERT INTO MODEL VALUES(MODEL_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)", new Object[] {
				vo.getM_id(), vo.getM_password(), vo.getM_name(), vo.getM_gender(), vo.getM_bday(), vo.getM_ka_id() });
	}

}

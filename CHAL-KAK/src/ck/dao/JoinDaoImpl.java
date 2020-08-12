package ck.dao;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Repository
public class JoinDaoImpl implements JoinDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	@Override
	public int insertPhotographer(PhotographerVO vo) {
		return jdbcTemplate.update("INSERT INTO PHOTOGRAPHER VALUES(PHOTOG_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				new Object[] { vo.getP_id(), vo.getP_password(), vo.getP_name(), vo.getP_gender(), vo.getP_bday(),
						vo.getP_ka_id(), vo.getCamera_seq(), vo.getConcept(), vo.getCareer(), vo.getUrl() });
	}

	@Override
	public int insertModel(ModelVO vo) {
		return jdbcTemplate.update("INSERT INTO MODEL VALUES(MODEL_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)", new Object[] {
				vo.getM_id(), vo.getM_password(), vo.getM_name(), vo.getM_gender(), vo.getM_bday(), vo.getM_ka_id() });
	}

	@Override
	public int Model_IDCheck(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("M_IDCHECK");
		SqlParameterSource in = new MapSqlParameterSource().addValue("MID", id);
		Map out = simpleJdbcCall.execute(in);
		BigDecimal ret = (BigDecimal) out.get("RES");
		System.out.println(ret + "/" + ret.intValue());
		return ret.intValue();
	}

	@Override
	public int Photo_IDCheck(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("P_IDCHECK");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID", id);
		Map out = simpleJdbcCall.execute(in);
		BigDecimal ret = (BigDecimal) out.get("RES");
		return ret.intValue();
	}
	
}

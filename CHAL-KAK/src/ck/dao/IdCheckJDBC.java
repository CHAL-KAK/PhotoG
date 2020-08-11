package ck.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class IdCheckJDBC {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public int Model_IDCheck(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("M_IDCHECK");
		SqlParameterSource in = new MapSqlParameterSource().addValue("MID", id);
		Map out = simpleJdbcCall.execute(in);
		BigDecimal ret =  (BigDecimal) out.get("RES");
		System.out.println(ret+"/"+ret.intValue());
		return ret.intValue();
	}
	
	public int Photo_IDCheck(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("P_IDCHECK");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID", id);
		Map out = simpleJdbcCall.execute(in);
		BigDecimal ret =  (BigDecimal) out.get("RES");
		return ret.intValue();
	}
}

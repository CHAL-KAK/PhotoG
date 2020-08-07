package ck.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.NoticeBoardVO;

@Repository
public class MypageJDBC {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}
	
	public List<NoticeBoardVO> Photo_Mypage(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("P_MYPAGE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID", id);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<NoticeBoardVO> all = (List<NoticeBoardVO>) list.get("RES");
		return all;
	}
	
	public List<NoticeBoardVO> Model_Mypage(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("M_MYPAGE");
		System.out.println("Mypage JDBC 호출");
		SqlParameterSource in = new MapSqlParameterSource().addValue("MID", id);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<NoticeBoardVO> all = (List<NoticeBoardVO>) list.get("RES");
		return all;
	}
	
}

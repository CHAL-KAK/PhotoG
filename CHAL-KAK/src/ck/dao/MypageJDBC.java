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
//application 에 등록한 beans 호출

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public List<NoticeBoardVO> Photo_Mypage(String id) {
		simpleJdbcCall.withProcedureName("P_MYPAGE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID", id);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<NoticeBoardVO> all = (List<NoticeBoardVO>) list.get("RES");
		return all;
	}
}

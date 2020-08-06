package ck.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public List<NoticeBoardVO> boardAll(){
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
		.withProcedureName("BOARD_ALL")
		.returningResultSet("NoticeBoardVO", new RowMapper<NoticeBoardVO>() {
			public NoticeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException{
				NoticeBoardVO vo = new NoticeBoardVO();
				vo.setP_id(rs.getString("P_ID"));
				vo.setPlace(rs.getString("PLACE"));
				vo.setConcept(rs.getInt("CONCEPT"));
				vo.setMax(rs.getInt("MAX"));
				vo.setStart_time(rs.getString("START_TIME"));
				vo.setEnd_time(rs.getString("END_TIME"));
				vo.setDay(rs.getDate("DAY"));
				return vo;
			}
		});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<NoticeBoardVO> all = (List<NoticeBoardVO>)out.get("RES");
		return all;
	}
	
	
	
//	public List<NoticeBoardVO> boardAll() {
//		
//		RowMapper<NoticeBoardVO> rowMapper = new BoardRowMapper();
//		
//		return jdbcTemplate.query("SELECT * FROM NOTICE_BOARD WHERE PROGRESS = 0", rowMapper);
//	}
//	
//	public class BoardRowMapper implements RowMapper<NoticeBoardVO>{
//
//		@Override
//		public NoticeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//			NoticeBoardVO vo = new NoticeBoardVO();
//			vo.setP_id(rs.getString("P_ID"));
//			vo.setPlace(rs.getString("PLACE"));
//			vo.setConcept(rs.getInt("CONCEPT"));
//			vo.setMax(rs.getInt("MAX"));
//			vo.setStart_time(rs.getDate("START_TIME"));
//			vo.setEnd_time(rs.getDate("END_TIME"));
//			return vo;
//		}
//		
//	}

}

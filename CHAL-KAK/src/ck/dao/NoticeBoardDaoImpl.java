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
import ck.vo.ReservationVO;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	public List<NoticeBoardVO> boardAll() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("BOARD_ALL").returningResultSet("NoticeBoardVO",
				new RowMapper<NoticeBoardVO>() {
					public NoticeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						NoticeBoardVO vo = new NoticeBoardVO();
						vo.setBrd_seq(rs.getInt("BRD_SEQ"));
						vo.setP_id(rs.getString("P_ID"));
						vo.setPlace(rs.getString("PLACE"));
						vo.setConcept(rs.getInt("CONCEPT"));
						vo.setMax(rs.getInt("MAX"));
						vo.setStart_time(rs.getString("START_TIME"));
						vo.setEnd_time(rs.getString("END_TIME"));
						vo.setDay(rs.getDate("DAY"));
						vo.setTitle(rs.getString("TITLE"));
						vo.setContent(rs.getString("CONTENT"));
						return vo;
					}
				});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<NoticeBoardVO> all = (List<NoticeBoardVO>) out.get("RES");
		return all;
	}

	@Override
	public List<NoticeBoardVO> boardOne(int seq) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("BOARD_ONE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("SEQ", seq);
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<NoticeBoardVO> one = (List<NoticeBoardVO>) out.get("RES");
		return one;
	}

	@Override
	public int insertNoticeForm(NoticeBoardVO vo) {
		return jdbcTemplate.update("insert into notice_board values(brd_seq.nextval,?,?,?,?,?,?,0,?,?,?)",
				new Object[] {vo.getP_id(),
						vo.getStart_time(), vo.getEnd_time(), 
						vo.getPlace(), vo.getConcept(), vo.getMax(),vo.getDay(), vo.getTitle(), vo.getContent()});
	}

	@Override
	public int insertReservationForm(ReservationVO vo) {
		return jdbcTemplate.update("insert into reservation values (rev_seq.nextval,?,?,?,?,?,?,0,?)",
				new Object[] {vo.getBrd_seq(),vo.getM_id(),vo.getConcept(),vo.getPeople_num(),vo.getStart_time(),
						vo.getEnd_time(),vo.getDay()});
	}

}

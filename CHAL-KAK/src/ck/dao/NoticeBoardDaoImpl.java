package ck.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import ck.vo.NoticeBoardVO;

public class NoticeBoardDaoImpl extends JdbcDaoSupport implements NoticeBoardDao {

	public List<NoticeBoardVO> boardAll() {
		RowMapper<NoticeBoardVO> rowMapper = new BoardRowMapper();
		
		return super.getJdbcTemplate().query("SELECT * FROM NOTICE_BOARD WHERE PROGRESS = 0", rowMapper);
	}
	
	public class BoardRowMapper implements RowMapper<NoticeBoardVO>{

		@Override
		public NoticeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			NoticeBoardVO vo = new NoticeBoardVO();
			vo.setP_id(rs.getString("P_ID"));
			vo.setPlace(rs.getString("PLACE"));
			vo.setConcept(rs.getInt("CONCEPT"));
			vo.setMax(rs.getInt("MAX"));
			vo.setStart_time(rs.getDate("START_TIME"));
			vo.setEnd_time(rs.getDate("END_TIME"));
			return vo;
		}
		
	}

}

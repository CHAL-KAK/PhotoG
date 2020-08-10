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

import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;

@Repository
public class AdministratorDaoImpl implements AdministratorDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	@Override
	public List<ModelVO> confrimModelList() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
		.withProcedureName("ADMIN_MODEL_LIST")
		.returningResultSet("ModelVO", new RowMapper<ModelVO>() {
			
			@Override
			public ModelVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ModelVO vo = new ModelVO();
				vo.setModel_seq(rs.getInt("MODEL_SEQ"));
				vo.setM_bday(rs.getDate("M_BDAY"));
				vo.setM_gender(rs.getString("M_GENDER"));
				vo.setM_id(rs.getString("M_ID"));
				vo.setM_ka_id(rs.getString("M_KA_ID"));
				vo.setM_name(rs.getString("M_NAME"));
				vo.setM_password(rs.getString("M_PASSWORD"));
				return vo;
			}
		});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<ModelVO> all = (List<ModelVO>) out.get("RES");
		return all;
	}

	@Override
	public List<PhotographerVO> confirmPhotographerList() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
		.withProcedureName("ADMIN_PHOTOGRAPHER_LIST")
		.returningResultSet("PhotographerVO", new RowMapper<PhotographerVO>() {

			@Override
			public PhotographerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				PhotographerVO vo = new PhotographerVO();
				vo.setPhotog_seq(rs.getInt("PHOTOG_SEQ"));
				vo.setCamera_seq(rs.getInt("CAMERA_SEQ"));
				vo.setCareer(rs.getString("CAREER"));
				vo.setConcept(rs.getInt("CONCEPT"));
				vo.setP_bday(rs.getDate("P_BDAY"));
				vo.setP_gender(rs.getString("P_GENDER"));
				vo.setP_id(rs.getString("P_ID"));
				vo.setP_ka_id(rs.getString("P_KA_ID"));
				vo.setP_name(rs.getString("P_NAME"));
				vo.setP_password(rs.getString("P_PASSWORD"));
				vo.setUrl(rs.getString("URL"));
				return vo;
			}
		});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<PhotographerVO> all = (List<PhotographerVO>)out.get("RES");
		return all;
	}

	@Override
	public void deleteModel(int seq) {
		jdbcTemplate.update("DELETE FROM MODEL WHERE MODEL_SEQ = ?", new Object[] {seq});
	}

	@Override
	public void deletePhotographer(int seq) {
		jdbcTemplate.update("DELETE FROM PHOTOGRAPHER WHERE PHOTOG_SEQ = ?", new Object[] {seq});
	}

	@Override
	public List<NoticeBoardVO> confirmBoardList() {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
		.withProcedureName("ADMIN_BOARD_ALL")
		.returningResultSet("NoticeBoardVO", new RowMapper<NoticeBoardVO>() {

			@Override
			public NoticeBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeBoardVO vo = new NoticeBoardVO();
				vo.setConcept(rs.getInt("CONCEPT"));
				vo.setDay(rs.getDate("DAY"));
				vo.setEnd_time(rs.getString("END_TIME"));
				vo.setMax(rs.getInt("MAX"));
				vo.setP_id(rs.getString("P_ID"));
				vo.setPlace(rs.getString("PLACE"));
				vo.setProgress(rs.getInt("PROGRESS"));
				vo.setStart_time(rs.getString("START_TIME"));
				return vo;
			}
		});
		Map<String, Object> out = simpleJdbcCall.execute();
		List<NoticeBoardVO> all = (List<NoticeBoardVO>)out.get("RES");
		return all;
	}
	
	
	
	
	

}

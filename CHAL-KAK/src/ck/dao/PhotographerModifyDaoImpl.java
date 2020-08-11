package ck.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.PhotographerVO;

@Repository
public class PhotographerModifyDaoImpl implements PhotographerModifyDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}
	

	@Override
	public List<PhotographerVO> selectPhotographer(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("PHOTOGRAPHER_ONE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID",id);
		Map<String, Object> out = simpleJdbcCall.execute(in);
		List<PhotographerVO> one=(List<PhotographerVO>)out.get("RES");
		return one;
	}


	@Override
	public int updatePhotographer(PhotographerVO vo) {
		return jdbcTemplate.update("UPDATE PHOTOGRAPHER SET CAMERA_SEQ=?,CONCEPT=?,CAREER=?,"
				+ "URL=? WHERE P_ID=?", new Object[] {
						vo.getCamera_seq(),vo.getConcept(),vo.getCareer(),vo.getUrl(),vo.getP_id()
				});
		
	}
	
	


}

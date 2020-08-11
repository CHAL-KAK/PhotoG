package ck.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.PictureVO;

@Repository
public class ProfileDaoImpl implements ProfileDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;
	
	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}
	
	
	@Override
	public int insertSaveProfile(PictureVO vo) {
		return jdbcTemplate.update("INSERT INTO PICTURE VALUES(PIC_SEQ.NEXTVAL, ?, ?, ?)", new Object[] {vo.getP_id(), vo.getFile_path(), vo.getFile_name()});
	}


	@Override
	public String confirmProfile(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall
		.withProcedureName("FINDPROFILE");
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PID", id);
		Map out = simpleJdbcCall.execute(in);
		String fname = (String)out.get("FNAME");
		return fname;
	}

}

package ck.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;
import ck.vo.PictureVO;
import ck.vo.ReservationVO;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SimpleJdbcCall simpleJdbcCall;

	public SimpleJdbcCall createSimpleJdbcCall() {
		return new SimpleJdbcCall(this.jdbcTemplate);
	}

	@Override
	public List<NoticeBoardVO> Photo_Mypage(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("P_MYPAGE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("PID", id);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<NoticeBoardVO> all = (List<NoticeBoardVO>) list.get("RES");
		return all;
	}

	@Override
	public List<ReservationVO> Model_Mypage(String id) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("M_MYPAGE");
		SqlParameterSource in = new MapSqlParameterSource().addValue("MID", id);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<ReservationVO> all = (List<ReservationVO>) list.get("RES");
		return all;
	}

	@Override
	public List<ReservationVO> Reserv_List(int bseq) {
		simpleJdbcCall = createSimpleJdbcCall();
		simpleJdbcCall.withProcedureName("RESERVATION_SPRAY");
		SqlParameterSource in = new MapSqlParameterSource().addValue("SEQ", bseq);
		Map<String, Object> list = simpleJdbcCall.execute(in);
		List<ReservationVO> all = (List<ReservationVO>) list.get("RES");
		return all;
	}

	@Override
	public int updateReser(int rseq) {
		return jdbcTemplate.update("UPDATE RESERVATION set PROGRESS=1 WHERE REV_SEQ=?", rseq);
	}

	@Override
	public int findProfile(String id) {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM PICTURE WHERE P_ID = ?", int.class, id);
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

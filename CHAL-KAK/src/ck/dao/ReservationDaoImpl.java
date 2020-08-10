package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ck.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int insertReservationForm(ReservationVO vo) {
		return jdbcTemplate.update("insert into reservation values (rev_seq.nextval,?,?,?,?,?,?,0,?)",
				new Object[] {vo.getBrd_seq(),vo.getM_id(),vo.getConcept(),vo.getPeople_num(),vo.getStart_time(),
						vo.getEnd_time(),vo.getDay()});
	}

}

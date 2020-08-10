package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int updateReser(int rseq) {
		return jdbcTemplate.update("UPDATE RESERVATION set PROGRESS=1 WHERE REV_SEQ=?", rseq);
	}
}

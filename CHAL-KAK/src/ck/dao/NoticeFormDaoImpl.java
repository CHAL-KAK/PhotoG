package ck.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import ck.vo.NoticeBoardVO;

@Repository
public class NoticeFormDaoImpl implements NoticeFormDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertNoticeForm(NoticeBoardVO vo) {
		return jdbcTemplate.update("insert into notice_board values(brd_seq.nextval,?,?,?,?,?,?,0,?,?,?)",
				new Object[] {vo.getP_id(),
						vo.getStart_time(), vo.getEnd_time(), 
						vo.getPlace(), vo.getConcept(), vo.getMax(),vo.getDay(), vo.getTitle(), vo.getContent()});
	}
	
	

}

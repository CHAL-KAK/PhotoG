package ck.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ck.vo.ModelVO;
import ck.vo.PhotographerVO;


@Repository(value = "photographerLoginDao")
public class PhotographerLoginDao {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public PhotographerVO searchPhotographer(PhotographerVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		PhotographerVO res = null;

		try {
			res = session.selectOne("ck.mapper.PhotographerLoginMapper.searchPhotographer",vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return res;
	}

}

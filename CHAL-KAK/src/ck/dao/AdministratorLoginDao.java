package ck.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ck.vo.AdministratorVO;
import ck.vo.ModelVO;


@Repository
public class AdministratorLoginDao {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public AdministratorVO searchAdministrator(AdministratorVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		AdministratorVO res = null;

		try {
			res = session.selectOne("ck.mapper.AdministratorLoginMapper.searchAdministrator",vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return res;
	}

}

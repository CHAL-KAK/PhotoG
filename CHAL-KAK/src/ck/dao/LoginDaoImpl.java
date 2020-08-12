package ck.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public ModelVO searchModel(ModelVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		ModelVO res = null;

		try {
			res = session.selectOne("ck.mapper.LoginMapper.searchModel", vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return res;
	}

	@Override
	public PhotographerVO searchPhotographer(PhotographerVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		PhotographerVO res = null;

		try {
			res = session.selectOne("ck.mapper.LoginMapper.searchPhotographer", vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}
		return res;
	}

	@Override
	public AdministratorVO searchAdministrator(AdministratorVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		AdministratorVO res = null;

		try {
			res = session.selectOne("ck.mapper.LoginMapper.searchAdministrator", vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}
		return res;
	}
	
}

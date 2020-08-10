package ck.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ck.vo.ModelVO;


@Repository(value = "modelLoginDao")
public class ModelLoginDao {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public ModelVO searchModel(ModelVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		ModelVO res = null;

		try {
			res = session.selectOne("ck.mapper.ModelLoginMapper.searchModel",vo);
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.close();
		}

		return res;
	}
	
}
package ck.dao;

import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

public interface JoinDao {
	
	public int insertPhotographer(PhotographerVO vo);
	
	public int insertModel(ModelVO vo);
	
	public int Model_IDCheck(String id);
	
	public int Photo_IDCheck(String id);
}

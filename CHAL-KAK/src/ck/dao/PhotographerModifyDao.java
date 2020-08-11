package ck.dao;

import java.util.List;

import ck.vo.PhotographerVO;

public interface PhotographerModifyDao {
	
	public int updatePhotographer(PhotographerVO vo);

	public List<PhotographerVO> selectPhotographer(String id);
}

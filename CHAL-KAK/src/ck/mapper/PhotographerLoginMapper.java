package ck.mapper;

import org.apache.ibatis.annotations.Select;

import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

public interface PhotographerLoginMapper {
	
	@Select("select * from photographer where p_id=#{p_id} and p_password=#{p_password}")
	public PhotographerVO searchPhotographer(PhotographerVO vo);

}

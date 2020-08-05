package ck.mapper;

import org.apache.ibatis.annotations.Select;

import ck.vo.ModelVO;

public interface ModelLoginMapper {
	
	@Select("select * from model where m_id=#{m_id} and m_password=#{m_password}")
	public ModelVO searchModel(ModelVO vo);

}

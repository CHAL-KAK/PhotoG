package ck.mapper;

import org.apache.ibatis.annotations.Select;

import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

public interface LoginMapper {
	
	@Select("select * from model where m_id=#{m_id} and m_password=#{m_password}")
	public ModelVO searchModel(ModelVO vo);

	@Select("select * from Administrator where id=#{id} and password=#{password}")
	public AdministratorVO searchAdministrator(AdministratorVO vo);

	@Select("select * from photographer where p_id=#{p_id} and p_password=#{p_password}")
	public PhotographerVO searchPhotographer(PhotographerVO vo);

}

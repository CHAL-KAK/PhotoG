package ck.mapper;

import org.apache.ibatis.annotations.Select;

import ck.vo.AdministratorVO;


public interface AdministratorLoginMapper {
	
	@Select("select * from Administrator where id=#{id} and password=#{password}")
	public AdministratorVO searchAdministrator(AdministratorVO vo);

}

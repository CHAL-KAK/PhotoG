package ck.dao;

import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

public interface LoginDao {
	
	public ModelVO searchModel(ModelVO vo);

	public PhotographerVO searchPhotographer(PhotographerVO vo);

	public AdministratorVO searchAdministrator(AdministratorVO vo);

}

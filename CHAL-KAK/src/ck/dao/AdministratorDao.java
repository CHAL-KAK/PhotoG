package ck.dao;

import java.util.List;

import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;

public interface AdministratorDao {

	List<ModelVO> confrimModelList();

	List<PhotographerVO> confirmPhotographerList();

	void deleteModel(int seq);

	void deletePhotographer(int seq);

	List<NoticeBoardVO> confirmBoardList();

}

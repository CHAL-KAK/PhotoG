package ck.dao;

import java.util.List;

import ck.vo.NoticeBoardVO;

public interface NoticeBoardDao {
	public List<NoticeBoardVO> boardAll();
	
	public List<NoticeBoardVO> boardOne(int seq);
}

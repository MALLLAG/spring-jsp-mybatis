package test20.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;


import org.apache.ibatis.annotations.Param;

import test20.dto.BoardDto;

public class BoardDao {
	
	SqlSession ss;
	
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	public List<BoardDto> selectBoardList() throws Exception{
		return ss.selectList("selectBoardList");
	}
	
	public BoardDto selectBoardOne(String boardno) throws Exception{
		return ss.selectOne("selectBoardOne", boardno);
	}
	
	public void insertBoard(BoardDto dto) throws Exception{
		ss.insert("insertBoard", dto);
	}
	
	public void updateBoard(BoardDto dto) throws Exception{
		ss.update("updateBoard", dto);
	}
	
	public void deleteBoard(String boardno) throws Exception{
		ss.delete("deleteBoardOne", boardno);
	}

	
	public List<BoardDto> selectSearchList(String select, String search) {
		if(select.equals("title"))
			return ss.selectList("selectTitleList", search);
		else if(select.equals("writer"))
			return ss.selectList("selectWriterList", search);
		else if(select.equals("content"))
			return ss.selectList("selectContentList", search);
		else
			return ss.selectList("selectSearchList", search);
	}

}

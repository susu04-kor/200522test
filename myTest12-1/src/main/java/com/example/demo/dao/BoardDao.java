package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.BoardVo;

// 민아) 5/10
public interface BoardDao {
	
	//자유게시판 목록
	List<BoardVo> listBoard(SearchCriteria scri);
	
	//자유게시판 게시물 총 갯수(페이징처리를 위함)
	int countBoard(SearchCriteria scri);
	
	//게시물 등록
	int insertBoard(BoardVo b);

	//게시물 상세보기
	BoardVo getBoard(BoardVo b);
	
	//게시물 조회수증가
	int updateHit(int board_no);
	
	//게시물 수정
	int updateBoard(BoardVo b);
	
	//게시물 삭제
	int deleteBoard(BoardVo b);
	
	//마지막 글번호
	int lastBoard();
	
}

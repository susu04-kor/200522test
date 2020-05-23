package com.example.demo.service;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.BoardVo;

//민아) 5/10
public interface BoardService {

	// 자유게시판 게시글작성
	public int insertBoard(BoardVo b);

	// 게시물 목록
	public List<BoardVo> listBoard(SearchCriteria scri);

	// 게시물 총 개수
	public int boardCount(SearchCriteria scri);

	// 게시물 상세보기
	public BoardVo getBoard(BoardVo b);

	// 조회수 증가
	public int updateHit(int board_no);

	// 게시물 수정
	public int updateBoard(BoardVo b);

	// 게시물 삭제
	public int deleteBoard(BoardVo b);

	// 마지막 글번호
	int lastBoard();

}

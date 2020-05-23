package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dao.Board_fileDao;
import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.BoardVo;
import com.example.demo.vo.Board_fileVo;

//민아) 5/10
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private Board_fileDao bfDao;
	
	@Override
	public List<BoardVo> listBoard(SearchCriteria scri){
		return boardDao.listBoard(scri);
	}

	@Override
	public int insertBoard(BoardVo b) {
		int re = boardDao.insertBoard(b);
		return re;
	}

	@Override
	public int boardCount(SearchCriteria scri) {
		return boardDao.countBoard(scri);
	}

	@Override
	public BoardVo getBoard(BoardVo b) {
		return boardDao.getBoard(b);
	}

	@Override
	public int updateHit(int board_no) {
		return boardDao.updateHit(board_no);
	}

	@Override
	public int updateBoard(BoardVo b) {
		return boardDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(BoardVo b) {
		return boardDao.deleteBoard(b);
	}

	@Override
	public int lastBoard() {
		// TODO Auto-generated method stub
		return boardDao.lastBoard();
	}

}

package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dao.Board_CommentDao;
import com.example.demo.util.Criteria;
import com.example.demo.vo.Board_CommentVo;

//민아) 5/10
@Service
public class Board_CommentServiceImlp implements Board_CommentService {
	@Autowired
	private Board_CommentDao bcDao;

	@Autowired
	private BoardDao boardDao;

	// 댓글목록
	@Override
	public List<Board_CommentVo> listComment(int board_no) {
		return bcDao.listComment(board_no);
	}

	// 댓글등록
	@Override
	public int insertComment(Board_CommentVo bc) {
		return bcDao.insertComment(bc);
	}

	// 댓글삭제
	@Override
	public int deleteComment(Board_CommentVo bc) {
		return bcDao.deleteComment(bc);
	}

	@Override
	public int deleteCommBoard(Board_CommentVo bc) {
		return bcDao.deleteCommBoard(bc);
	}

	// 선택한 댓글보기(삭제를 위해)
	@Override
	public Board_CommentVo selectComment(int comm_num) {
		return bcDao.selectComment(comm_num);
	}

}

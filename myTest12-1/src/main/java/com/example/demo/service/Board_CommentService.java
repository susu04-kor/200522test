package com.example.demo.service;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.vo.Board_CommentVo;
//민아) 5/10
public interface Board_CommentService {
	
	// 댓글목록
	List<Board_CommentVo> listComment(int board_no);

	// 댓글등록
	int insertComment(Board_CommentVo bc);

	// 댓글삭제
	int deleteComment(Board_CommentVo bc);

	int deleteCommBoard(Board_CommentVo bc);

	// 선택한 댓글보기(수정,삭제를 위해)
	Board_CommentVo selectComment(int comm_num);
}

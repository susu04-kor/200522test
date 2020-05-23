package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.vo.Pic_Board_CommentVo;

//봉현)5/13
public interface Pic_Board_CommentDao {
   // 댓글목록
   List<Pic_Board_CommentVo> plistComment(int photo_no);

   // 댓글등록
   int pinsertComment(Pic_Board_CommentVo pbc);

   // 댓글삭제
   int pdeleteComment(Pic_Board_CommentVo pbc);

   int pdeleteCommBoard(Pic_Board_CommentVo pbc);

   // 선택한 댓글보기(수정,삭제를 위해)
   Pic_Board_CommentVo pselectComment(int photo_comm_no);
}
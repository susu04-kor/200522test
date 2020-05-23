package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.dao.Board_CommentDao;
import com.example.demo.dao.Pic_Board_CommentDao;
import com.example.demo.dao.Pic_BoardDao;
import com.example.demo.vo.Board_CommentVo;
import com.example.demo.vo.Pic_Board_CommentVo;
//봉현) 5/13
@Service
public class Pic_Board_CommentServiceImlp implements Pic_Board_CommentService {
   
   @Autowired
   private Pic_Board_CommentDao pbcDao;
   
   @Autowired
   private Pic_BoardDao pDao;

   
   //댓글목록
   @Override
   public List<Pic_Board_CommentVo> plistComment(int photo_no) {
      return pbcDao.plistComment(photo_no);
   }
   //댓글등록
   @Override
   public int pinsertComment(Pic_Board_CommentVo pbc) {
      
      return pbcDao.pinsertComment(pbc);
   }
   //댓글삭제
   @Override
   public int pdeleteComment(Pic_Board_CommentVo pbc) {
      System.out.println("댓글삭제aaaaaaaaaaaaaaaaa");
      return pbcDao.pdeleteComment(pbc);
   }
   
   @Override
   public int pdeleteCommBoard(Pic_Board_CommentVo pbc) {
      return pbcDao.pdeleteCommBoard(pbc);
   }
   //선택한 댓글보기
   @Override
   public Pic_Board_CommentVo pselectComment(int photo_comm_no) {
      return pbcDao.pselectComment(photo_comm_no);
   }

}
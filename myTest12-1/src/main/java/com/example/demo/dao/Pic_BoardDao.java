package com.example.demo.dao;

import java.util.List;

import javax.servlet.http.HttpServlet;

import com.example.demo.util.Criteria;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_FileVo;

public interface Pic_BoardDao {

   public List<Pic_Board_FileVo> listFile(Criteria cri) throws Exception;

   public List<Pic_BoardVo> listPic_Board(Criteria cri) throws Exception;

   
   //민아) 5/17, 좋아요기능 추가
   int upcntLike(int photo_no);
   
   // 페이징
   int listCount() throws Exception;

   // 상세보기
   Pic_BoardVo detailPic_Board(Pic_BoardVo pb);

   // 상세보기 사진
   Pic_Board_FileVo detailFile(Pic_Board_FileVo pbf);

   // 게시물등록
   int insertPic_Board(Pic_BoardVo pb);

   // 사진파일
   int insertfile(Pic_Board_FileVo pbf);

   // 좋아요
   int insertlikeit(LikeItVo l);

   // 좋아요 수
   int likecnt(LikeItVo l);

   // 마지막 글번호
   int photo_no();

   // 게시글 삭제
   int deletePic_Board(Pic_BoardVo pb);

   // 게시글 수정
   int updatePic_Board(Pic_BoardVo pb);
   
   //파일삭제
   int deleteFile(Pic_BoardVo pb);

}
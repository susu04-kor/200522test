package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.TogetherVo;

public interface ReplyDao {
		//함께가요 댓글 조회
		public List<ReplyVo> togetherReply(int t_num) throws Exception;
		
		//함께가요 댓글 작성
		public void writeReply(ReplyVo rv) throws Exception;
		
		//함께가요 댓글 수정
		public void updateReply(ReplyVo rv) throws Exception;
		
		//함께가요 댓글 삭제
		public void deleteReply(ReplyVo rv) throws Exception;
		
		//선택된 댓글 조회
		public ReplyVo selectReply(int t_r_num) throws Exception;
		
		//게시물삭제시 댓글 삭제
		public void deleteAll(TogetherVo togetherVo) throws Exception;
}

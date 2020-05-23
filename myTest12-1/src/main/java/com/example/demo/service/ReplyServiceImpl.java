package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.TogetherVo;

@Service
public class ReplyServiceImpl implements ReplyService {
		
		@Autowired
		private ReplyDao rDao;
	
	//함께가요 댓글 조회
		@Override
		public List<ReplyVo> togetherReply(int t_num) throws Exception{
			return rDao.togetherReply(t_num);
		}
		
		//함께가요 댓글 작성
		@Override
		public void writeReply(ReplyVo rv) throws Exception {
			rDao.writeReply(rv);
		}
		
		//함께가요 댓글 수정
		@Override
		public void updateReply(ReplyVo rv) throws Exception {
			rDao.updateReply(rv);
		}
		
		//함께가요 댓글 수정
		@Override
		public void deleteReply(ReplyVo rv) throws Exception {
			rDao.deleteReply(rv);
		}
		
		//선택된 댓글 조회
		@Override
		public ReplyVo selectReply(int t_r_num) throws Exception {
			return rDao.selectReply(t_r_num);
		}

		@Override
		public void deleteAll(TogetherVo togetherVo) throws Exception {
			// TODO Auto-generated method stub
			rDao.deleteAll(togetherVo);
		}
		

}

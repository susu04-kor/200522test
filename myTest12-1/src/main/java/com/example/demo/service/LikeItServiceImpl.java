package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.LikeItDao;
import com.example.demo.dao.Pic_BoardDao;
import com.example.demo.vo.LikeItVo;

//민아) 5/17, 좋아요기능 추가
//나도 컨트롤러에서 다 처리하게 했지만... 원래는 컨트롤러에선 사용자 요청에 관한 일들만 처리하고 
//여기 서비스임플리먼츠단에서 운영에 관한 일들을 처리하는게 맞다고 함.

@Service
public class LikeItServiceImpl implements LikeItService {

	@Autowired
	private LikeItDao likeDao;

	@Autowired
	private Pic_BoardDao picDao;

	@Override
	public int insertLike(LikeItVo vo) {
		int re = 0;

		// 좋아요 수가 늘어나면, pic_board에서도 좋아요수가 같이 증가해야함
		//asd
		int re_likeit = likeDao.insertLike(vo);
		int re_pic = picDao.upcntLike(vo.getPhoto_no());

		if (re_likeit > 0 && re_pic > 0) {
			re = 1;
		}
		return re;
	}

	@Override
	public int deleteLike(LikeItVo vo) {
		int re = 0;

		int re_likeit = likeDao.deleteLike(vo);
		int re_pic = picDao.upcntLike(vo.getPhoto_no());

		if (re_likeit > 0 && re_pic > 0) {
			re = 1;
		}

		return re;
	}
	
	// 진짜 좋아요를 누른 상태인지를 확인.(두번누르면 좋아요 취소나 마찬가지니까??? 말로 뭐라고 설명할지....)
	@Override
	public int checkLike(LikeItVo vo) {
		int re = 0;
		if( likeDao.checkLike(vo) > 0) {
			re = 1;
		}
		return re;
	}

}

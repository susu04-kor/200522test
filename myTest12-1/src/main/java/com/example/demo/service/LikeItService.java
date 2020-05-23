package com.example.demo.service;

import com.example.demo.vo.LikeItVo;

//민아) 5/17, 좋아요기능 추가

public interface LikeItService {

	int insertLike(LikeItVo vo);

	int deleteLike(LikeItVo vo);

	int checkLike(LikeItVo vo);
}

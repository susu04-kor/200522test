package com.example.demo.dao;

import com.example.demo.vo.LikeItVo;

//민아) 5/17, 좋아요기능 추가

public interface LikeItDao {

	int insertLike(LikeItVo vo);

	int deleteLike(LikeItVo vo);

	int checkLike(LikeItVo vo);
}

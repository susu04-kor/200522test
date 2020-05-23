package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.ReplyVo;
import com.example.demo.vo.TogetherVo;

public interface TogetherService {
	
	//함께가요 작성
	public int writeTogether(TogetherVo togetherVo) throws Exception;
	
	//함께가요 목록
	public List<TogetherVo> listTogether(SearchCriteria scri) throws Exception;
	
	//게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;

	//함께가요 상세
	public TogetherVo detailTogether(int t_num) throws Exception;
	
	//함께가요 수정
	public int updateTogether(TogetherVo togetherVo) throws Exception;
		
	//함께가요 삭제
	public void deleteTogether(int t_num) throws Exception;

}

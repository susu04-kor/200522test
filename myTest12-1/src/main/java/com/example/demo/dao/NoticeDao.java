package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.NoticeUpdateVo;
import com.example.demo.vo.NoticeVo;
//영수) 5월12일 공지사항Dao
public interface NoticeDao {
	//공지사항 리스트
	public List<NoticeVo> allNoticeList(SearchCriteria scri);
	
	//전체 게시물수
	public int countNotice(SearchCriteria scri);
	
	//공지사항 등록
	public int insertNotice(NoticeVo n);

	//공지사항 삭제
	public int deleteNotice(NoticeVo n);

	//공지사항 수정
	public int updateNotice(NoticeUpdateVo nu);
	
	//공지사항 상세보기
	public NoticeVo detailNotice(NoticeVo n);
	
	//조회수
	public int hit(NoticeVo n);
}

package com.example.demo.dao;

import java.util.List;

import com.example.demo.util.Criteria;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.Aop_LogVo;
import com.example.demo.vo.ChartVo;
import com.example.demo.vo.MemberInfoVo;

// 민아) 5/19, 관리자페이지
public interface ManagerPageDao {
	
	// 로그 차트 
	List<ChartVo> chartLog();
	
	// 로그 기록(등록)
	int insertLog(Aop_LogVo al);
	
	// 로그 목록
	List<Aop_LogVo> listLog(Criteria cri);
	
	// 로그 총 개수
	int countLog(Criteria cri);
	
	// 회원목록
	List<MemberInfoVo> listMember(SearchCriteria scri);

	// 총 회원 수
	int countMember(SearchCriteria scri);

	// 회원정보 상세보기
	MemberInfoVo getMember(MemberInfoVo m);

	// 회원삭제(강퇴)
	int deleteMember(MemberInfoVo m);
}

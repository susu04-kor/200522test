package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.AlarmVo;
import com.example.demo.vo.ApplicationVo;

public interface AlarmService {

	//함께가요 신청 알림 등록
	int insert_together_alarm(AlarmVo a);
		
	//함께가요 취소 알림 등록
	int cancle_insert_together_alarm(AlarmVo a);
	
	//함께가요 신청 번호 조회
	Integer together_no(ApplicationVo a);
	
	//함께가요 삭제 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
	Integer delete_application(ApplicationVo a);
		
	//신청알림 있는지 조회
	List<AlarmVo> search_insert_together_alarm(AlarmVo a);
		
	//취소알림  있는지 조회
	List<AlarmVo> search_cancle_together_alarm(AlarmVo a);
		
	//등록 알람수
	int search_insert_together_count(AlarmVo a);
		
	//취소 알람수
	int search_cancle_together_count(AlarmVo a);
		
	//신청 알람 확인
	int check_alarm_in(AlarmVo a);
		
	//취소 알람 확인
	int check_alarm_cancle(AlarmVo a);
		
	//알람 삭제
	int delete_together_alarm(AlarmVo a);	
	
	//자유게시판 댓글 등록 알람 등록
	int insert_board_alarm(AlarmVo a);
	
	//자유게시판 댓글 삭제 알람 등록
	int cancle_insert_board_alarm(AlarmVo a);
	
	//자유게시판 댓글 등록 알람 조회
	List<AlarmVo> search_insert_board_alarm(AlarmVo a);
	
	//자유게시판 댓글 삭제 알람 조회
	List<AlarmVo> search_cancle_board_alarm(AlarmVo a);
	
	//자유게시판 댓글 등록 수
	int search_insert_board_alarm_count(AlarmVo a);
	
	//자유게시판 댓글 취소 수
	int search_cancle_board_alarm_count(AlarmVo a);	
	
	//자유게시판 알람 삭제
	int delete_board_alarm(AlarmVo a);
	
	//자유게시판 작성자가 상세보기로가면 댓글 등록된거 확인해서 알람 안가게 셋팅
	int chk_board_alarm(AlarmVo a);
	
	//함께가요 작성자가 상세보기하면 알람 확인해서 알람 안가게
	int chk_together_alarm(AlarmVo a);
}

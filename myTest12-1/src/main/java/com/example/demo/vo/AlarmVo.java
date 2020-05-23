package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmVo {
	private int alarm_no; 	//알람번호
	private String user_id;	//게시물 작성하한 아이디
	private int chk;		//알람 확인유무		1 등록 2 취소
	private String in_user_id;	//댓글,신청한 아이디
	private String category;	//게시물 카테고리
	private int board_num;		//신청번호, 댓글번호
	private int t_num;			//자유게시판, 함께가요 글번호
}



//ALARM_NO                                  NOT NULL NUMBER
//USER_ID                                            VARCHAR2(225)
//CHK                                                NUMBER
//IN_USER_ID                                         VARCHAR2(225)
//CATEGORY                                           VARCHAR2(225)
//BOARD_NUM                                          NUMBER
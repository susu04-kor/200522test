package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//민아 5/10
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board_CommentVo {
	private int comm_num;		//댓글번호
	private Date comm_date;		//댓글등록일시
	private String comm_cont;	//댓글내용
	private int board_no;		//게시물번호
	private String user_id;		//아이디
}	

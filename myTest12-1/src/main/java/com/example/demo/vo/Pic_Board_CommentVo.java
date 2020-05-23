package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//봉현) 5/12
public class Pic_Board_CommentVo {
	private int photo_comm_no;
	private Date photo_comm_date;
	private String photo_comm_cont;
	private String user_id;
	private int photo_no;
}

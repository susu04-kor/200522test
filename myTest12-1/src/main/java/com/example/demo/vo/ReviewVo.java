package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVo {
	private int r_no;
	private String review_content;
	private int grade;
	private Date insert_date;
	private Date update_date;
	private int open_status;
	private int facility_no;
	private String user_id;
}


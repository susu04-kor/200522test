package com.example.demo.vo;
//영수) 5월12일 NoticeVo
import java.util.Date;
//영수) 5월12일 NoticeVo
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class NoticeVo {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_hit;
	private Date notice_date;
	private int cs_no;
}


//NOTICE_NO                                 NOT NULL NUMBER
//NOTICE_TITLE                                       VARCHAR2(225)
//NOTICE_CONTENT                                     CLOB
//NOTICE_HIT                                         NUMBER
//NOTICE_DATE                                        DATE
//CS_NO                                              NUMBER
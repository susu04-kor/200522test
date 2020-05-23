package com.example.demo.vo;
//영수) 5월12일 NoticeUpdateVo
import java.util.Date;
//영수) 5월12일 NoticeVo
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class NoticeUpdateVo {
	private int u_notice_no;
	private String u_notice_title;
	private String u_notice_content;
	private int u_notice_hit;
	private Date u_notice_date;
	private int u_cs_no;
}


//NOTICE_NO                                 NOT NULL NUMBER
//NOTICE_TITLE                                       VARCHAR2(225)
//NOTICE_CONTENT                                     CLOB
//NOTICE_HIT                                         NUMBER
//NOTICE_DATE                                        DATE
//CS_NO                                              NUMBER
package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


//봉현) 5/12
//민아) 5/17, 좋아요 기능 추가중 

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Pic_BoardVo {

	private int photo_no;
	private Date photo_date;
	private String photo_detail;
	private String user_id;
	private int cntLike; // 좋아요 수

}

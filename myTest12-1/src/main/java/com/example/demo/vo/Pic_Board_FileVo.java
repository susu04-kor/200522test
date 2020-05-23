package com.example.demo.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//봉현) 5/12
public class Pic_Board_FileVo {

	private int photo_file_no;
	private String photo_file_name;
	private int photo_no;
	
	private MultipartFile uploadFile;
}

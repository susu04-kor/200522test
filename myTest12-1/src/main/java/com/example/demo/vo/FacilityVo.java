package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacilityVo {
	private int facility_no;
	private String facility_name;
	private String facility_addr;
	private String f_phone;
	private String f_minprice;
	private String f_feature;
	private String f_intro;
	private String f_pic;
	private String f_checkin;
	private String f_checkout;
}



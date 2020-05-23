package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.example.demo.service.FacilityService;

import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

@Controller
@RequestMapping("/facility/*")
public class FacilityController{
	private static final Logger LOGGER = LoggerFactory.getLogger(FacilityController.class);
	
	
	@Autowired
	FacilityService service;
	
	//숙소 목록	
	@RequestMapping(value="/facility/list",method = RequestMethod.GET)
	public String listFacility(HttpServletRequest request,Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("listFacility");		
		model.addAttribute("listFacility",service.listFacility(scri));
		model.addAttribute("keyword",scri);
		return "facility/list";
	}		
	
	//검색결과	
	@RequestMapping(value="/facility/search",method = RequestMethod.GET)
	public String get(HttpServletRequest request,Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		LOGGER.info("search");
		model.addAttribute("listFacility",service.listFacility(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		return "facility/search";
	}	
	

	//숙소 상세(객실목록 및 리뷰목록)
	@RequestMapping(value="/facility/detail",method = RequestMethod.GET)
	public String get(HttpServletRequest request,@RequestParam("facility_no") int facility_no,FacilityVo facilityVo,RoomVo roomVo, Model model) throws Exception{
		LOGGER.info("getFacility");
		//LOGGER.info("listReview");
		model.addAttribute("getFacility",service.getFacility(facilityVo.getFacility_no()));
		model.addAttribute("listRoom",service.listRoom(roomVo.getFacility_no()));
//		model.addAttribute("listReview",service.listReview(reviewVo.getFacility_no()));
		return "facility/detail";
	}	
	
	//예약 페이지
	@RequestMapping(value="/facility/reserve",method = RequestMethod.GET)
	public String reserve() throws Exception{
		return "facility/reserve";
	}
	
	//리뷰 작성 화면
	@RequestMapping(value="/facility/postReview",method = RequestMethod.GET)
	public String postReview(HttpServletRequest request) throws Exception{
		return "facility/postReview";
	}
	//리뷰 등록
	@RequestMapping(value="facility/postSuccess",method = RequestMethod.POST)
	public String insert(@ModelAttribute ReviewVo vo) throws Exception{
		service.postReview(vo);
		return "redirect:/facility/detail?n="+vo.getFacility_no();
	}

	
	
	
	
	


	
}

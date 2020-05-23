package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FacilityDao;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.FacilityVo;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.RoomVo;

@Service
public class FacilityServiceImpl implements FacilityService {
	@Autowired
	private FacilityDao dao;
	//숙소 리스트
	public List<FacilityVo> listFacility(SearchCriteria scri) throws Exception {
		return dao.listFacility(scri);
	}
	//검색조건과 일치하는 숙소 총 개수
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	//숙소 상세뷰 
	public FacilityVo getFacility(int facility_no) throws Exception {
		return dao.getFacility(facility_no);
	}

	//객실 리스트
	public List<RoomVo> listRoom(int facility_no) throws Exception {
		return dao.listRoom(facility_no);
	}
	//리뷰 작성
	public int postReview(ReviewVo reviewVo) throws Exception {
		int re = dao.postReview(reviewVo);
		return re; 
		
	}


}

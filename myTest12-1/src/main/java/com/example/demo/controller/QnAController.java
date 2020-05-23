package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.QnAService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.util.SearchCriteria;
import com.example.demo.vo.QnAUpdateVo;
import com.example.demo.vo.QnAVo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
//영수) 5월12일 QnA컨트롤러 
//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리
@RestController
public class QnAController {
	
	@Autowired
	QnAService service;
	
	//고객센터 메인
	@NoLogging
	@RequestMapping("/customerservice/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/customerservice/index");
		
		return mav;
	}
	
	//모든 qna리스트
	@RequestMapping("/customerservice/List")
	public ModelAndView allQnAList(HttpServletRequest request, @ModelAttribute("scri") SearchCriteria scri){
		ModelAndView mav = new ModelAndView();
		
		
		
		Gson gson = new Gson();
		mav.addObject("list", gson.toJson(service.allQnAList(scri)));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		mav.addObject("pageMaker", pageMaker);
		
//		mav.addObject("list", service.allQnAList());
		
		mav.setViewName("/customerservice/QnAList");
		
		return mav;
	}
	
	
	//qna등록
	@RequestMapping("/customerservice/insertQnA")
	public void insertQnA(HttpServletRequest request, QnAVo q, Criteria cri,@ModelAttribute("scri") SearchCriteria scri) {
		
		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(scri));
		mav.addObject("pageMaker", pageMaker);
		
		if( service.allQnAList(scri) == null ) {
			q.setRef(1);
		}else if(service.lastNo() == -1){
			q.setRef(1);
		}else {
			q.setRef(service.lastNo() + 1);
		}
		
		service.insertQnA(q);
	}
	
	//섬머노트 사진업로드
	@NoLogging
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("inq_file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image_QnA\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
		File targetFile = new File(fileRoot + savedFileName);	
			
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
					
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		System.out.println(multipartFile);
		return jsonObject;
	}
	
	//섬머노트 사진업로드
		@NoLogging
		@PostMapping(value="/uploadSummernoteImageFile2", produces = "application/json")
		@ResponseBody
		public JsonObject uploadSummernoteImageFile2(@RequestParam("up_inq_file") MultipartFile multipartFile) {
			
			JsonObject jsonObject = new JsonObject();
			
			String fileRoot = "C:\\summernote_image_QnA\\";	//저장될 외부 파일 경로
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
						
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
			File targetFile = new File(fileRoot + savedFileName);	
				
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
				jsonObject.addProperty("responseCode", "success");
						
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			System.out.println(multipartFile);
			return jsonObject;
		}
	
	//qna상세보기
	@RequestMapping("/customerservice/detailQnA")
	public QnAVo detailQnA(HttpServletRequest request,QnAVo q) {
		QnAVo detail = service.detailQnA(q);
		return detail;
	}
	
	//qna삭제
	@RequestMapping("/customerservice/deleteQnA")
	public void deleteQnA(HttpServletRequest request,QnAVo q) {
		service.deleteQnA(q);
	}
	
//	답변있는 글은 삭제 못하게
//	@RequestMapping("/customerservice/checkQnA")
//	public ModelAndView no_delete(QnAVo q) {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("답변유무 :" + service.no_delete(q));
//		
//		//답변이 있는경우
//		if(service.no_delete(q) > 0) {
//			System.out.println("답변 있음");
//			mav.addObject("r", 2);
//		//답변이 없는 경우
//		}else {
//			System.out.println("답변 없음");
//			mav.addObject("r", 1);
//		}
//		
//		return mav;
//	}
	
	//답변있는 경우 삭제 못하게
	@NoLogging
	@RequestMapping("/customerservice/checkQnA")
	public String no_delete(QnAVo q) {
		String str = "";
		System.out.println("답변유무 :" + service.no_delete(q));
		//답변이 있는경우
		if(service.no_delete(q) > 0) {
			System.out.println("답변 있음");
			str = "o";
		//답변이 없는 경우
		}else {
			System.out.println("답변 없음");
			str = "x";
		}
		return str;
	}
	
	//답변등록
	@RequestMapping("/customerservice/insertRe")
	public void insertRe(HttpServletRequest request,QnAVo q, String re_inq_content, QnAUpdateVo qu) {
		//부모글 번호로 묶음
//		q.setRef(q.getInq_no());
		//정렬순서
//		q.setRef_step(q.getRef_step()+1);
		//들여쓰기
//		q.setRef_level(q.getRef_level()+1);
		
		q.setInq_title(qu.getRe_inq_title());
		
		//부모글 번호로 묶음
		q.setRef(qu.getRe_ref());
		//정렬순서
		q.setRef_step(qu.getRe_ref_step()+1);
		//들여쓰기
		q.setRef_level(qu.getRe_ref_level()+1);

		q.setInq_content(re_inq_content);
		service.insertRe(q);
	}
	
	//수정
	@RequestMapping("/customerservice/updateQnA")
	public void updateQnA(HttpServletRequest request,QnAUpdateVo qu, String up_inq_file) {
		qu.setUp_inq_file(up_inq_file);
		service.updateQnA(qu);
	}
}

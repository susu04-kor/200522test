package com.example.demo.controller;


import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.LoginMapperDao;
import com.example.demo.service.MypageService;
import com.example.demo.service.SecurityService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.vo.Animal_infoVo;
import com.example.demo.vo.MemberInfoVo;
//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
@Controller
public class MyPageController {
	

	@Autowired
	LoginMapperDao loginMapperDao;
	
	@Autowired
	SecurityService securityService;
	
	@Autowired
	MypageService mypageservice;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	//마이페이지 메인
	@RequestMapping("/mypage/mypage")
	public ModelAndView mypage(HttpServletRequest request) {

		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/main");
//		mav.setViewName("/mypage/MypageMain");

		//아이디 임의로 설정
		m.setUser_id(m.getUser_id());
		//내 정보
		mav.addObject("myinfo", mypageservice.select_myinfo(m));
		
		//내가 작성한 글
		mav.addObject("myboard", mypageservice.search_my_board(m));
		
		//내가 작성한 sns글
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		
		//내가 작성한 sns글파일
		mav.addObject("mysnspic", mypageservice.search_my_sns_file(m));
		
		//내가 쓴 함께가요
		mav.addObject("mytogether", mypageservice.search_my_together(m));
//		System.out.println(mypageservice.select_myinfo(m));
		
		//반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
//		System.out.println("동물리스트" + mypageservice.search_my_animal(m));
		return mav;
	}
	
	//반려동물 관리폼
	@RequestMapping("/mypage/animal_info_up_form")
	public ModelAndView update_animal_info_form(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(user.getUser_id());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_info");
		
		//나의 반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
		mav.addObject("user_id", mypageservice.select_myinfo(m));
//		System.out.println("동물 리스트 "+mypageservice.search_my_animal(m));
		
		return mav;
	}
	
	//반려동물 등록
	@RequestMapping(value = "/mypage/animal_info_up", method = RequestMethod.POST)
	public String update_animal_info(HttpServletRequest request,Animal_infoVo a,MultipartFile aa) {
//		System.out.println("반려동물 등록 컨트롤러");
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		m.setUser_id(user.getUser_id());
	
		String str = aa.getOriginalFilename();
//		System.out.println("업로드 파일 이름"+str);
		
		String path = request.getRealPath("/img/animalImg");
		System.out.println(path);
		
		if(str != null && !str.equals("")) {
			System.out.println("사진  첨부함");
			System.out.println("업로드 파일 이름"+str);
			a.setPet_pic(str);
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}else {
			System.out.println("사진 첨부 안함");
			a.setPet_pic("사진없음");
		}
//		System.out.println("동물등록");
		
//		System.out.println(a.getPet_date());
		
		
		
		ModelAndView mav = new ModelAndView();
		mypageservice.insert_pet(a);
		//나의 반려동물 리스트
		mav.addObject("animal_list", mypageservice.search_my_animal(m));
		
		return "redirect:/mypage/animal_info_up_form?user_id="+m.getUser_id();
	}

	
	//사람 정보 수정 폼
	@NoLogging
	@RequestMapping("/mypage/people_info_up_form")
	public ModelAndView people_info_up_form(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();		
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
		m.setUser_id(user.getUser_id());
		mav.setViewName("/mypage/people_info");
		mav.addObject("m", mypageservice.select_myinfo(m));
		return mav;
	}
	
	//사람 정보 수정
	@RequestMapping(value = "/mypage/people_info_up", method = RequestMethod.POST)
	public String people_info_up(HttpServletRequest request, MultipartFile aa, MemberInfoVo m) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo memberInfo = (MemberInfoVo) authentication.getPrincipal();

		String user_id = m.getUser_id();

		memberInfo = loginMapperDao.getSelectMemberInfo(user_id);
		memberInfo.setUser_id(user_id);

		String str = aa.getOriginalFilename();
		String o_str = m.getFname();
		String path = request.getRealPath("/img/peopleImg");
		System.out.println(path);
		
		if(str != null && !str.equals("")) {
			System.out.println("사진첨부함");
			m.setFname(str);
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			int re = -1;
						
			re = mypageservice.update_myinfo(m);
			
			if(re > 0 && str != null && !str.equals("") && o_str != null && !o_str.equals("")) {
				File file = new File(path + "/" + o_str);
				file.delete();
			}
			
		}else {
			System.out.println("사진첨부안함");
			m.setFname("사진없음");
		}
		
		
		
		mypageservice.update_myinfo(m);
		session.invalidate();
		//수정 끝나고 리스트 컨트롤러 호출
		return "redirect:/mypage/mypage";
	}
	
	//패스워드 체크
	@NoLogging
	@RequestMapping(value="/join/passCheck", method=RequestMethod.POST)
	@ResponseBody
	public boolean passCheck(MemberInfoVo vo, String user_id) throws Exception {
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user_id);
		boolean pwdChk = passwordEncoder.matches(vo.getPwd(), m.getPwd());
		return pwdChk;
		
	}
	
	
	
	
	
	//내가 작성한 글
	@RequestMapping("/mypage/board_list")
	public ModelAndView board_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();	
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		m.setUser_id(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(user.getUser_id());
		mav.setViewName("/mypage/board_list");
		mav.addObject("myboard", mypageservice.search_my_board(m));
		return mav;
	}
	
	//내 결제 내역
	@RequestMapping("/mypage/pay_list")
	public ModelAndView pay_list(HttpServletRequest request, String user_id) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/pay_list");
		return mav;
	}
	
	//내가 쓴 함께가요 리스트
	@RequestMapping("/mypage/together_list")
	public ModelAndView together_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
		
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id(user.getUser_id());
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/together_list");
		mav.addObject("mytogether", mypageservice.search_my_together(m));
		return mav;
	}
	
	//내가 쓴 sns리스트
	@RequestMapping("/mypage/sns_list")
	public ModelAndView sns_list(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo m = (MemberInfoVo) authentication.getPrincipal();
		
		m.setUser_id(m.getUser_id());
		ModelAndView mav = new ModelAndView();
//		MemberInfoVo m = new MemberInfoVo();
//		m.setUser_id("user1");
		m.setUser_id(m.getUser_id());
		mav.setViewName("/mypage/sns_list");
		mav.addObject("mysns", mypageservice.search_my_sns(m));
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping("/mypage/delete_member")
	public String delete_member(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(m.getUser_id());
		mypageservice.delete_myinfo(m);
		return "redirect:/MainPage";
	}
	
	//비밀번호 변경
	@NoLogging
	@RequestMapping("/mypage/update_pwd")
	@ResponseBody
	public String update_pwd(HttpServletRequest request, String o_pwd,String o_user_id) {
//		System.out.println("AAAAAAAAAAAAAAAAA");
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();	
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());
	
		m.setPwd(o_pwd);
		m.setUser_id(o_user_id);
		mypageservice.update_pwd(m);
		return "ok";
	}
	
	//반려동물 정보 수정폼
	@NoLogging
	@RequestMapping("/mypage/update_animal_form")
	public ModelAndView update_animal_form(Animal_infoVo a) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/animal_update");
		mav.addObject("animal_info", mypageservice.detail_animal(a));
		
		return mav;
	}
	

	//반려동물 정보 수정
	@RequestMapping(value = "/mypage/update_animal", method = RequestMethod.POST)
	public String update_animal(HttpServletRequest request,Animal_infoVo a, MultipartFile aa) {
		System.out.println(aa);
		
		String path = request.getRealPath("/img/animalImg");
		System.out.println(path);
		
		String str = aa.getOriginalFilename();
		String o_str = a.getPet_pic();
		
		if(aa.getOriginalFilename() != null && !"".equals(aa.getOriginalFilename())) {
			System.out.println("사진 첨부함");
			a.setPet_pic(aa.getOriginalFilename());
			
			try {
				byte []data = aa.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+str);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
			int re = -1;
			re = mypageservice.update_animal(a);
			
			if(re > 0 && str != null && !str.equals("") && o_str != null && !o_str.equals("")) {
				File file = new File(path + "/" + o_str);
				file.delete();
			}
		}else {
			System.out.println("사진 첨부안함");
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/mypage/animal_info");
		mypageservice.update_animal(a);
		
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//반려동물 정보 삭제
	@RequestMapping(value = "/mypage/delete_animal", method = RequestMethod.GET)
	public String delete_animal(HttpServletRequest request,Animal_infoVo a) {
		
		mypageservice.delete_animal(a);
		
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//동물사진 삭제
	@RequestMapping(value = "/mypage/delete_animal_pic", method = RequestMethod.GET)
	public String delete_animal_pic(HttpServletRequest request, Animal_infoVo a) {
		String path = request.getRealPath("/img/animalImg");
		
		String o_str = a.getPet_pic();
		File file = new File(path + "/" + o_str);
		file.delete();
		
		mypageservice.delete_animal_pic(a);
		return "redirect:/mypage/animal_info_up_form?user_id="+a.getUser_id();
	}
	
	//사람사진 삭제
	@RequestMapping(value = "/mypage/delete_people_pic", method = RequestMethod.GET)
	public String delete_people_pic(HttpServletRequest request) {
		String path = request.getRealPath("/img/peopleImg");
		HttpSession session = request.getSession();
	    Authentication authentication = (Authentication) session.getAttribute("user");
	    MemberInfoVo user = (MemberInfoVo) authentication.getPrincipal();
		MemberInfoVo m = loginMapperDao.getSelectMemberInfo(user.getUser_id());

		m.setUser_id(user.getUser_id());
		
		String o_str = m.getFname();
		System.out.println(o_str);
		File file = new File(path + "/" + o_str);
		file.delete();
		
		mypageservice.delete_people_pic(m);
		return "redirect:/mypage/mypage?user_id"+m.getUser_id();
	}
	
}

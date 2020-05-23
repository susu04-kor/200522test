package com.example.demo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.LikeItService;
import com.example.demo.service.Pic_BoardService;
import com.example.demo.service.Pic_Board_CommentService;
import com.example.demo.util.AopLog.NoLogging;
import com.example.demo.util.Criteria;
import com.example.demo.util.PageMaker;
import com.example.demo.vo.LikeItVo;
import com.example.demo.vo.Pic_BoardVo;
import com.example.demo.vo.Pic_Board_CommentVo;
import com.example.demo.vo.Pic_Board_FileVo;
import com.google.gson.Gson;

//봉현) 5/12
//민아) 5/17, 좋아요기능 추가
//민아) 5/19, HttpServletRequest request 이랑 @NoLogging 처리 
@Controller
public class Pic_BoardController {
   @Autowired
   private Pic_BoardService pic_boardService;

   @Autowired
   private LikeItService likeService;
   
   @Autowired
   private Pic_Board_CommentService pbc;

   // 사진에 좋아요를 누른적이 있는지 판단
   @NoLogging
   @GetMapping("/pic_board/okLike")
   @ResponseBody
   public String checkLike(LikeItVo vo) {
      String re = "0";
      int cntLike = likeService.checkLike(vo);
      if (cntLike > 0) {
         re = "1";
      }
      return re;
   }

   // 좋아요 추가
      @GetMapping("/pic_board/insertLike")
      @ResponseBody
      public String insertLike(HttpServletRequest request,LikeItVo vo) {
         String re = "0";
         int r = likeService.insertLike(vo);
         if (r > 0) {
            re = "1";
         }
         return re;
      }

      // 좋아요 삭제
      @GetMapping("/pic_board/deleteLike")
      @ResponseBody
      public String deleteLike(HttpServletRequest request,LikeItVo vo) {
         String re = "0";
         int r = likeService.deleteLike(vo);
         if (r > 0) {
            re = "1";
         }
         return re;
      }


      // 자신이 등록한 모든사진
      @RequestMapping(value = "/pic_board/list", method = RequestMethod.GET)
      public ModelAndView listAll(HttpServletRequest request,Criteria cri) throws Exception {
         ModelAndView mav = new ModelAndView();
         List<Pic_Board_FileVo> list_file = pic_boardService.listFile(cri);

         List<Pic_BoardVo> list_board = pic_boardService.listPic_Board(cri);

         String str_file = "";
         String str_board = "";

         Gson gson = new Gson();
         str_board = gson.toJson(list_board);

         PageMaker pageMaker = new PageMaker();
         pageMaker.setCri(cri);
         pageMaker.setTotalCount(pic_boardService.listCount());
         mav.addObject("pageMaker", pageMaker);
//         System.out.println("ddddd :  " + pageMaker);
//         mav.addObject("listAll",str_board);
         mav.addObject("board", gson.toJson(list_board)); // 오류시 삭제
         mav.addObject("file", gson.toJson(list_file));
         mav.setViewName("/pic_board/list");
         return mav;
      }

      // 상세보기
      @GetMapping("/pic_board/detail")
      public ModelAndView detailPic_Board(HttpServletRequest request,Pic_BoardVo pb,Pic_Board_FileVo pbf) {   
         ModelAndView mav = new ModelAndView();
//         System.out.println(pic_boardService.detailPic_Board(pb));
         //System.out.println(pic_boardService.detailFile(pbf));
         
         mav.addObject("Board", pic_boardService.detailPic_Board(pb));
         mav.addObject("file", pic_boardService.detailFile(pbf));
         mav.setViewName("/pic_board/detail");
         
         return mav;
      }

      // sns 글 등록 폼
      @NoLogging
      @RequestMapping("/pic_board/insertForm")
      public ModelAndView insertform(Criteria cri) {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/pic_board/insert");
         return mav;
      }

      @RequestMapping("/pic_board/insert")
      public ModelAndView insertPic_Board(HttpServletRequest request, Pic_BoardVo pb, Pic_Board_FileVo pbf, MultipartFile multipartFile,
             Criteria cri) throws Exception {
         int re = -1;
         re = pic_boardService.insertPic_Board(pb); // sns글등록
         //System.out.println("마지막 글번호:" + pic_boardService.photo_no());
         pbf.setPhoto_no(pic_boardService.photo_no());
         String path = request.getRealPath("/img");
         //System.out.println(path);

         String oldFname = pbf.getPhoto_file_name();
         MultipartFile uploadFile = pbf.getUploadFile();
         String fname = null;
         if (uploadFile != null) {
            fname = uploadFile.getOriginalFilename();
            if (fname != null && !fname.equals("")) {
               pbf.setPhoto_file_name(fname);
               try {
                  byte[] data = uploadFile.getBytes();
                  FileOutputStream fos = new FileOutputStream(path + "/" + fname);

                  fos.write(data);
                  fos.close();

               } catch (Exception e) {
                  // TODO: handle exception
                  System.out.println(e.getMessage());
               }
            }
         }


         // 파일 업로드
         uploadFile = pbf.getUploadFile();
         fname = uploadFile.getOriginalFilename();
         pbf.setPhoto_file_name(fname);

         // 파일 테이블 등록
         re = pic_boardService.insertfile(pbf);
         ModelAndView mav = new ModelAndView();

         Gson gson = new Gson();
         String str_file = "";
         str_file = gson.toJson(pic_boardService.listFile(cri));

         String str_board = "";
         str_board = gson.toJson(pic_boardService.listPic_Board(cri));

         mav.addObject("file", str_file);
         mav.addObject("board", str_board);
         mav.setViewName("redirect:/pic_board/list");
         return mav;
      }
      // sns 글 삭제
      @RequestMapping("/pic_board/delete")
      public String deletePic_Board(HttpServletRequest request,Pic_BoardVo pb) {
         Pic_Board_CommentVo c = new Pic_Board_CommentVo();
         c.setPhoto_no(pb.getPhoto_no()); 
         System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+pb.getUser_id());
         LikeItVo l = new LikeItVo();
         l.setPhoto_no(pb.getPhoto_no());
         likeService.deleteLike(l);
         pbc.pdeleteCommBoard(c);
         System.out.println("좋아요삭제결과"+likeService.deleteLike(l));
         System.out.println("댓글삭제 결과 " + pbc.pdeleteCommBoard(c));
         pic_boardService.deleteFile(pb);
         System.out.println("파일삭제 결과"+pic_boardService.deleteFile(pb));
         pic_boardService.deletePic_Board(pb);
         System.out.println("게시물삭제결과"+pic_boardService.deletePic_Board(pb));
         return "redirect:/pic_board/list";
      }

      // sns수정폼
      @GetMapping("/pic_board/update")
      public String updateForm(Pic_BoardVo pb, Model model ) {
         model.addAttribute("up",pic_boardService.detailPic_Board(pb));
         
         Pic_Board_FileVo pbf = new Pic_Board_FileVo();
         pbf.setPhoto_no(pb.getPhoto_no());
         
         model.addAttribute("pic", pic_boardService.detailFile(pbf));
         return "/pic_board/update";
      }

      
      //sns 수정
//      @ResponseBody
//      @PostMapping(value = "/pic_board/update")
//      public String updateSubmit(Pic_BoardVo pb, Pic_Board_FileVo pbf, Model model,
//                                 HttpServletRequest request, Criteria cri)throws Exception {
//         //System.out.println("수정한 글번호"+pb.getPhoto_no());
//         pic_boardService.updatePic_Board(pb);
//         
//         model.addAttribute("pic_board_no",pb.getPhoto_no());
//         model.addAttribute("pic_board_file_",pbf.getPhoto_file_no());
//         
//         //사진만 수정
//         if(!pb.getPhoto_detail().equals("")) {
//            if(!pbf.getPhoto_file_name().equals("")) {
//               pic_boardService.insertfile(pbf);
//            }
//         }
//         
//         List<Pic_Board_FileVo> listImg = pic_boardService.listFile(pb.getPhoto_no());
//         
//         for(Pic_Board_FileVo pbf1 : listImg) {
//            String pic_board_detail = pb.getPhoto_detail();
//            if(!pic_board_detail.contains(pbf1.getPhoto_file_name())) {
//               pic_boardService.deleteFile(pbf1.getPhoto_file_name());
//            }
//         }
//      
//         return pb.getPhoto_no()+"";
//      }
}
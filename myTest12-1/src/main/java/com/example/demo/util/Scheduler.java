package com.example.demo.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.Board_fileService;
import com.example.demo.service.QnAService;
import com.example.demo.vo.Board_fileVo;
import com.example.demo.vo.QnAVo;

// 민아) 5/11 , 스케쥴러 테스트 
// 민아) 5/13, 서머노트 실제업로드된것이 아닌 사진 스케쥴러로 지우기 
// 민아) 수정해야함 ㅠㅠㅠ 
@Controller
public class Scheduler {

   @Autowired
   private Board_fileService bf_service;

   public void setBf_service(Board_fileService bf_service) {
      this.bf_service = bf_service;
   }

   // https://kms0209.tistory.com/69 @Scheduled표현식이 정리가 잘 되어있음! 매일 새벽4시에 파일테이블에 없는,
   // 실제 업로드가 되지 않은 파일은 C:\\summernote_image 경로에서 삭제된다.
   // @Scheduled 를 적용할 메소드에는 매개변수가 있으면 안됨!!!!!! public void deleteImg(board_fileVo
   // bf){}
   // 이렇게 썻더니 에러나면서 서버 안켜짐... 삽질만 2시간.... ㅎ
   // org.springframework.beans.factory.BeanCreationException: Error creating bean
   // with name defined in file~~~~~~~~

//   // 새벽4시마다 지움    cron = "0 0 4 * * * "
   @Scheduled(cron = "0 0 4 * * *")
   public void deleteImg() {
      // System.out.println("파일 지우는 스케쥴러 동작함");
      List<Board_fileVo> realFile = bf_service.realFile();

      File path = new File("C:\\summernote_image"); // c드라이브에 파일이 저장되는곳 경로
      File[] ImgList = path.listFiles(); // 위 경로에 있는 이미지파일들을 imgList에 담음

      ArrayList<String> fnameList = new ArrayList<String>(); // ImgList(경로에있는 이미지파일들)의 이름만 담음

      for (int i = 0; i < ImgList.length; i++) {
         fnameList.add(ImgList[i].getName());
//            System.out.println(ImgList[i].getName());
//            151a052a-3f50-46fa-805a-aa567ecea91a.png
      }

      for (int j = 0; j < fnameList.size(); j++) {
         String allFname = fnameList.get(j); // 경로(폴더)에 저장된 파일 중 j 번째 파일이름
         // System.out.println("폴더에 있는 파일 : " + allFname);
         // 폴더에 있는 파일 : 151a052a-3f50-46fa-805a-aa567ecea91a.png
         // System.out.println("리얼파일: " + realFile);
         for (Board_fileVo bfv : realFile) {
            String realUuid = bfv.getUuid();

            // System.out.println("리얼uuid: "+ realFname);
            // 리얼uuid: 151a052a-3f50-46fa-805a-aa567ecea91a.png

            // 경로에 저장된 파일중 j번째 파일이름이 realUuid와 같지 않고,
            // ImgList[j]에 파일이 존재 한다면 그 파일을 지워줘!
            if (!allFname.equals(realUuid) && ImgList[j].exists()) {
               ImgList[j].delete();
            }
         }
      }

   }
  // !allFname.equals(realUuid)
  
//   @Scheduled(cron = "* * * * * *")
//   public void SchedulerService() {
//      System.out.println("스케쥴러 동작함");
//   }

}
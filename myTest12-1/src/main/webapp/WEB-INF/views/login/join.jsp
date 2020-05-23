<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--  <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script> -->
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

   <style type="text/css">
      /* .help-block을 일단 보이지 않게 설정 */
      #myForm .help-block{
         display: none;
      }
      /* glyphicon을 일단 보이지 않게 설정 */
      #myForm . glyphicon{
         display: none;
      }
   </style>

</head>
<body>
<div class="container">
   <h3>회원가입 폼</h3>
   <form action="/join/insert" method="post" id="myForm">
   <input type="hidden" id="token" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- 모든 폼에 다 필요해 -->
      <div class="form-group has feedback">
         <label class="control-label" for="user_id">아이디</label>
         <input class="form-control" type="text" name="user_id" id="user_id" required="required"/>
       
         <button type="button" id="idCheck">아이디 중복 확인</button> 
         <span id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
         <span class="glyphicon glyphicon-ok form-control-feedback"></span>
         
      </div>      <!-- input name은 securityConfig에서  정해주었습니다-->
      <div class="form-group has-feedback">
      
         <label class="control-label" for="name">이름</label>
         <input class="form-control" type="text" name="name" id="name" required="required"/>
      </div>
      <div class="form-group has feedback">
      
         <label class="control-label" for="pwd">비밀번호</label>
         <input class="form-control" type="password" name="pwd" id="pwd" required="required"/>
         
         <span id="pwdRegErr" class="help-block">숫자와 글자 조합으로 6글자 이상 10글자 이하를 입력하세요</span>
         <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      </div>
   
      <div class="form-group has feedback">
         <label class="control-label" for="rePwd">비밀번호 재확인</label>
         <input class="form-control" type="password" name="rePwd" id="rePwd" required="required"/>
         <span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
         <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
         <label class="control-label" for="email">이메일</label>
         <input class="form-control" type="email" name="email" id="email" required="required"/>
         <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
         <span class="form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
         <label class="control-label" for="tel">전화번호</label>
         <input class="form-control" type="text" name="tel" id="tel" required="required"/>
         <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
         <span class="form-control-feedback"></span>
      </div>
        
      <div class="form-group has-feedback">
         <label class="control-label" for="birth">생년월일</label>
         <input class="form-control" type="text" name="birth" id="birth" required="required"/>
         <span class="form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
         <label class="control-label" for="address">주소</label>
         <input class="form-control" type="text" name="address" id="address" required="required"/>
         <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
         <span class="form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
         <label class="control-label" for="gender">성별</label>
         <select class="form-control" id="gender" name="gender">
            <option value="female">여성</option>
            <option value="male">남성</option>
         </select>
      </div>
      <div class="form-group has feedback">
         <label class="control-label" for="nick_name">닉네임</label>
         <input class="form-control" type="text" name="nick_name" id="nick_name" required="required"/>
       
         <button type="button" id="nickCheck">닉네임 중복 확인</button> 
         <span id="overlapNick" class="help-block">이미 존재하는 닉네임입니다.</span>
         <span class="glyphicon glyphicon-ok form-control-feedback"></span>
         
      </div> 
        
      <div class="form-group">
           <label for="comment">소개글:</label>
           <textarea class="form-control" rows="5" id="comment"></textarea>
      </div>
      
<!--       <button class="btn btn-success" type="submit" id="btn">가입</button> -->
      <button class="btn btn-success" id="btn">가입</button>
   </form>
<!--     <button class="btn btn-success" id="btn">가입</button> -->
</div>
	
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script type="text/javascript">

//아이디 중복체크 등 건너뛰면 가입도 안되게 처리 해야하는데!!!
//성공적이면 "회원가입 성공!"멘트 뜨게!어떻게 하지?
$("#btn").on("click", function(){
	alert("회원가입 성공");
	
})

//아이디 중복체크
var idx = false;
	$("#idCheck").on("click", function(){ 
		
		 $.ajax({
	         url: "${pageContext.request.contextPath}/join/idCheck",
	         type: "GET",
	         data: {user_id:$("#user_id").val()},
	         success: function(data) {
	            //사용 가능한 아이디라면
		    if(data==0 && $.trim($('#user_id').val()) != '' ){   
		       idx=true;
			   $('#user_id').attr("readonly",true);
		       $("#overlapErr").hide();
		       successState("#user_id");
		       alert("사용가능한 아이디입니다.");
		    //정규표현식을 통과하지 못하면
		    }else{
		       $("#overlapErr").show();
		       errorState("#user_id");
		       return false;
		    }
	    }
	 })
	});


//닉네임 중복체크
$("#nickCheck").on("click", function(){ 
	
	 $.ajax({
         url: "${pageContext.request.contextPath}/join/nickCheck",
         type: "GET",
         data: {nick_name:$("#nick_name").val()},
         success: function(data) {
            //사용 가능한 아이디라면
	    if(data==0 && $.trim($('#nick_name').val()) != '' ){   
	       idx=true;
		   $('#nick_name').attr("readonly",true);
	       $("#overlapNick").hide();
	       successState("#nick_name");
	       alert("사용가능한 닉네임입니다.");
	    //정규표현식을 통과하지 못하면
	    }else{
	       $("#overlapNick").show();
	       errorState("#nick_name");
	    }
    }
 })
});

//비밀번호 유효성 검사    
   $("#pwd").keyup(function(){   //오류 수정 필요! - 1. 비밀번호가 8글자 이하인데 에러메시지가 뜨지 않고 2. 비밀번호가 일치해도 오류 메시지 뜸
      var pwd = $('#pwd').val();
      //비밀번호를 검증할 정규 표현식
      var reg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,10}$/;
      //정규표현식을 통과한다면
      if(reg.test(pwd)){   //test() - 찾는 문자열이, 들어있는지 아닌지를 알려줍니다 / 문장 안에 찾으려는 문자가 들어있으면, 결과는 "true"
         $("#pwdRegErr").hide();
         successState("#pwd");
      //정규표현식을 통과하지 못하면
      }else{
         $("#pwdRegErr").show();
         errorState("#pwd");
      }
   });

   //비밀번호 재확인
   $("#rePwd").keyup(function(){
      var rePwd = $('#rePwd').val();

      //비밀번호가 일치하는지 확인
      if(rePwd==$('#pwd').val()){ //비밀번호가 일치하면
         $("#rePwdErr").hide();
   
      }else{   //비밀번호가 불일치한다면
         $("#rePwdErr").show();
         //errorState("#rePwd");
      }
  	 });

   //이메일 유효성 검사
   $("#email").keyup(function(){
       var email=$(this).val();
       // 이메일 검증할 정규 표현식
       var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//     var reg = /^[0-9a-zA-Z][0-9a-zA-Z\_\-\.\+]+[0-9a-zA-Z]@[0-9a-zA-Z][0-9a-zA-Z\_\-]*[0-9a-zA-Z](\.[a-zA-Z]{2,6}){1,2}$/;
       if(reg.test(email)){//정규표현식을 통과 한다면
                   $("#emailErr").hide();
                   successState("#email");
       }else{//정규표현식을 통과하지 못하면
                   $("#emailErr").show();
                   errorState("#email");
       }
   });
   

   //성공 상태로 바꾸는 함수
   function successState(sel){
      $(sel)
      .parent()
      .removeClass("has-error")
      .addClass("has-success")
      .find(".glyphicon")
      .removeClass("glyphicon-remove")
      .addClass("glyphicon-ok")
      .show();
      
      $("#myForm button[type=submit]").removeAttr("disabled");
   }

 
   //에러 상태로 바꾸는 함수
   function errorState(sel){
      $(sel)
      .parent()
      .removeClass("has-success")
      .addClass("has-error")
      .find(".glyphicon")
      .removeClass("glyphicon-ok")
      .addClass("glyphicon-remove")
      .show();

      $("#myForm button[type=submit]").attr("disabled", "disabled");
   };
   
   
   
// 아이디 중복체크 등 무언가 검사를 하지 않았을 경우엔 가입이 아예 안되도록 해야함!!!!

</script>
</html>
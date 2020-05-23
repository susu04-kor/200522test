<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
		  
          <style>
                    body {
                              margin: 0;
                              font-family: sans-serif;
                    }

                    * {
                              box-sizing: border-box;
                    }

                    .rating-box {
                              background: #ddd;
                              max-width: 600px;
                              margin: 40px auto;
                              padding: 50px;
                              display: flex;
                              flex-direction: column;
                    }

                    .rating-box h1 {
                              margin: 0 0 30px;
                              font-size: 40px;
                    }

                    .rating-box .ratings .fa-star {
                              font-size: 40px;
                              color: #ff9800;

                              float: left;

                    }

                    .rating-box input {
                              margin-top: 20px;
                              font-size: 30px;
                              padding: 6px 12px;

                    }
          </style>

          <title>Document</title>
</head>

<body>
	
	<form id="frm">
          <div class="rating-box">
                    <!--pic -->
                    <!--시설 이름-->
                    <!-- 시설 주소-->
                    <!-- <h1>Rating System</h1> -->

                    <p>숙소에 대한 전반적인 평가</p>
                    <div class="ratings">
                              <span class="far fa-star"></span>
                              <span class="far fa-star"></span>
                              <span class="far fa-star"></span>
                              <span class="far fa-star"></span>
                              <span class="far fa-star"></span>

                    </div>
                    <input type="text" name="" id="rating-value">
                    <p>작성자</p>
                    <input type="text" name="" id="user_id">
                    <p>리뷰 내용</p>
                    <textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
                    <a href="#" class="btn" id="write">작성하기</a>
          </div>
 
     </form>
          <script>
                    const stars = document.querySelector('.ratings').children;
                    const ratingValue = document.querySelector('#rating-value');
                    let index;
                    for (let i = 0; i < stars.length; i++) {
                              stars[i].addEventListener('mouseover', function () {
                                        for (let j = 0; j < stars.length; j++) {
                                                  stars[j].classList.remove('fas');
                                                  stars[j].classList.add('far');
                                        }
                                        for (let j = 0; j <= i; j++) {
                                                  stars[j].classList.remove('far');
                                                  stars[j].classList.add('fas');
                                        }
                              })
                              stars[i].addEventListener('click', function () {
                                        ratingValue.value = i + 1;
                                        index = i;
                              })
                              stars[i].addEventListener('mouseout', function () {
                                        for (let j = 0; j < stars.length; j++) {
                                                  stars[j].classList.remove('fas');
                                                  stars[j].classList.add('far');
                                        }
                                        for (let j = 0; j <= index; j++) {
                                                  stars[j].classList.remove('far');
                                                  stars[j].classList.add('fas');
                                        }
                              })
                    }
          </script>
     
</body>

</html>
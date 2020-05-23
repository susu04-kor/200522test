<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PETWEGO | 숙소</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){

    $('#searchForm').submit(function(){
    	//location.href ='/facility/search' + '${pageMaker.makeQuery(1)}' + '&keyword=' + encodeURIComponent($('#keywordInput').val());
    	location.href='/facility/search?keyword='+$('#keywordInput').val();
    });


    $('#searchForm input').keydown(function(e) {
	    if (e.keyCode == 13) {
	        $('#searchForm').submit();
	    }
	});
	
 	$('#searchBtn').click(function() {
		//location.href= "/facility/search"+"?keyword=" + encodeURIComponent($('#keywordInput').val());
		location.href='/facility/search?keyword='+$('#keywordInput').val();
     });
	
});
</script>
    <!--Font awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <style type="text/css">
/*Import the fonts used*/
@import url('https://fonts.googleapis.com/css?family=Courgette|Open+Sans:400,800&display=swap');
/*Basic reset*/
*,
*::before,
*::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
/*Custom properties*/
:root {
    --dark-color: #2d2c2c;
    --purple-solid: #350a4f;
    --skyblue-solid:#86a8e7;
    --purple-transparent: rgba(53, 10, 79, .7);
    --skyblue-transparent:rgba(134,168,231,.7);
    --purple-transparent-alt: rgba(53, 10, 79, .5);
    --skyblue-transparent-alt:rgba(134,168,231,.3);
    --purple-light: #8f50fb;
    --yellow-solid: #fa9e2c;

    --gradient-color:linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5); 

    --gradient-color-alt:linear-gradient(to right, #7F7FD5,  #86A8E7,#91EAE4); 
}





/*Global styles*/
html{
    font-size:10px;
}
body{
    font-family: 'Open Sans',sans-serif;
    font-size: 1.6rem;
    color:var(--dark-color);
}
a{text-decoration: none;color: inherit;}
ul{
    list-style: none;
}
section{
    padding: 5rem 0;
}
select{
   
        border-radius: 0;

        -webkit-appearance: none;
        -webkit-border-radius: 0px;
}

/*Reusable styles*/
.container{
    width:100%;
    max-width: 120rem;
    padding: 0 1.5rem;
    margin: 0 auto;
}
.btn{
    color: #fff;
    font-size: 1.3rem;
    font-weight: bold;
    text-transform: uppercase;
    padding: .5rem 3.5rem;
    border: none;
    border-radius: 10rem;
    display: inline-flex;
    align-items: center;
}
.form-btn{
    margin-top: 2.5rem;
    cursor:pointer;
}
.btn-gradient{
    background-image: var(--gradient-color);
}
.btn-gradient:hover{
    background-image: var(--gradient-color-alt);
}
.btn-purple{
    background-color: var(--skyblue-solid);
}
.btn-purple:hover{
    opacity: 0.8;
    /*var(--purple-light)*/
}
.dots{
    font-size: 2.4rem;
    margin-left: .5rem;
    opacity: .75;
}


/*Header styles*/
.header{
    width:100%;
    height:6rem;
    display: flex;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    background-color: var(--skyblue-transparent);
    z-index: 999;
}
/*Header styles - nav*/
.nav{
    display: flex;
    align-items: center;
    justify-content: space-between;
}
/* .logo img{
    max-width: 80%;
} */
.logo{
    color: #fff;
    font-size: 2.2rem;
    font-weight: bold;
}
.logo i{
    font-size: 3.1rem;
    color:var(--gradient-color);
}

.hamburger-menu{
    font-size: 2.6rem;
    color:#fff;
    cursor: pointer;
    position: relative;
    z-index: 1500;
}
.hamburger-menu .fa-times{
    display: none;
}

.menu-open .hamburger-menu .fa-times{
    display: block;
}
.menu-open .hamburger-menu .fa-bars{
    display: none;
}

.nav-list{
    position: fixed;
    top:0;
    left:0;
    width:100%;
    height: 100vh;
    background-color: var(--skyblue-solid);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    z-index: 1400;
    opacity: 0;
    transform: scale(0);
    transition: opacity .5s;
}
.menu-open .nav-list{
    opacity: 1;
    transform: scale(1);
}
.nav-item:not(:last-child){
    margin-bottom: .5rem;
}

.nav-link{
    display: block;
    color: #fff;
    font-size: 3rem;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 2px;
    padding: 1rem;
}
/* Hero section styles */
.hero{
    width: 100%;
    height: 100vh;
    background: url("../../../img_facility/hero_background.jpg") center no-repeat;
    background-size: cover;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    position: relative;
    z-index: 0;
}
.hero::before{
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: inherit;
    height: inherit;
    background-color: var(--skyblue-transparent-alt);
    z-index: -1;
}
.main-heading{
    color: #fff;
    line-height: 1;
    text-shadow: 1px 1px 1rem rgba(0,0,0,.5);
    margin-bottom: 2.5rem;
}
.title{
    font-size: 4.8rem;
    text-transform: uppercase;
    letter-spacing: 3px;
}
.subtitle{
    font-size: 3.6rem;
    font-weight: 300;
    font-family: 'Courgette',cursive;
}


/* Booking section styles */
.booking{
    background-image: var(--gradient-color);
}
.input-group{
    margin-bottom: 1.5rem;
}
.input-label{
    display: block;
    font-size: 1.3rem;
    text-transform: uppercase;
    color:#fff;
    font-weight: bold;
    margin-bottom: 1rem;
}
.input, .options{
    outline: none;
    border: none;
    width: 100%;
    min-height: 4rem;
    padding: 1rem;
    font-weight: bold;
    color:#a5a5a5;
    letter-spacing: 2px;
    font-family: "Open Sans",sans-serif;
    /* resize: none; */
}
.options{
    height:4rem;
}


/* category */
.select-box{
    position: relative;
    display: flex;
    width: 400px;
    flex-direction: column;
}
.select-box .options-container{
    background: #2f3640;
    color:#f5f6fa;
    max-height: 0;
    width:100%;
    opacity: 0;
    transition: all 0.4s;
    border-radius: 8px;
    overflow: hidden;
    
    order: 1;
    position: absolute;
    z-index: 100;
}

.selected{
    background: #2f3640;
    border-radius: 8px;
    margin-bottom: 8px;
    color:#f5f6fa;
    position: relative;
    order: 0;
}

.selected::after{
    content: '';
    background: url("images/arrow-down.svg");
    background-size: contain;
    background-repeat: no-repeat;
    position: absolute;
    height: 100%;
    width: 32px;
    right:10px;
    top:5px;
    transition: all 0.4s;
}

.select-box .options-container.active{
    max-height:240px;
    opacity: 1;
    overflow-y: scroll;
    margin-top: 104px;
}

.select-box .options-container.active + .selected::after{
    transform: rotateX(180deg);
    top:-6px;
}


.select-box .options-container::-webkit-scrollbar{
    width: 8px;
    background: #0d141f;
    border-radius: 0 8px 8px 0;
}

.select-box .options-container::-webkit-scrollbar-thumb{
    background: #525861;
    border-radius: 0 8px 8px 0;
}


.select-box .option,
.selected{
    padding: 12px 24px;
    cursor: pointer;
}
.select-box .option:hover{
    background: #414b57;
}
.select-box label{
    cursor: pointer;
}
.select-box .option .radio{
    display: none;
}
/* Search Box */
.search-box input{
    width: 100%;
    padding: 12px 16px;
    font-size: 16px;
    position: absolute;
    border-radius: 8px 8px 0 0;
    z-index: 100;
    border: 8px solid #2f3640;

    opacity: 0;
    pointer-events: none;
    transition: all 0.4s;
}
.search-box input:focus{
    outline: none;
}
.select-box .options-container.active ~ .search-box input{
    opacity: 1;
    pointer-events: auto;
}



::placeholder{
    color:inherit;
}

/* Featured hotels section styles */
.section-head{
    text-align: center;
    margin-bottom: 5rem;
}
.heading{
    display: block;
    font-size:4rem;
    text-transform: uppercase;
}
.sub-heading{
    font-size: 1.7rem;
    font-family: 'Courgette',cursive;
    font-weight: 300;
    color:#a5a5a5;
}
.grid{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(30rem,1fr));
    grid-gap: 2.5rem;
}
.grid-item{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.featured-hotels{
    height: 35rem;
    color:#fff;
    padding:1rem;
    position: relative;
    z-index: 0;
}
.featured-hotels::before{
    content: '';
    position: absolute;
    top:0;
    left:0;
    width: 100%;
    height: 100%;
    /* background-color: var(--skyblue-transparent-alt); */
    z-index: -1;
}
.hotel-image{
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top:0;
    left:0;
    z-index: -2;
}
.hotel-name{
    font-size: 2.6rem;
}
.hotel-price{
    font-size: 1.8rem;
}
.hotel-rating{
    margin:1rem 0 2.5rem;
}
.rating{
    color:var(--yellow-solid);
}
/* Special section styles */
.offer{
    background: linear-gradient(to right, rgba(250,158,44,.8), rgba(143,80,251,.8)),
    url("./images/the_paradise_bg.jpg") bottom center no-repeat;
    background-size: cover;

}
.offer-content{
    background-color: #fff;
    text-align: center;
    padding: 5rem 1rem;
    position: relative;
    overflow: hidden;
}
.discount{
    background-color: var(--yellow-solid);
    position: absolute;
    top:0;
    left:0;
    padding: 1rem;
    font-weight: bold;
    text-transform: uppercase;
    outline: 2px solid var(--yellow-solid);
    outline-offset: .5rem;
}
.paragraph{
    color:#a5a5a5;
    margin-bottom: 2.5rem;
}

    
    </style>
</head>

<body>
    <header class="header">
        <div class="container">
            <nav class="nav">
                <a href="MainPage" class="logo">
                    <!-- <img src="./images/logo.png" alt=""> --><i class="fas fa-paw"></i> PETWEGO
                </a>
                <div class="hamburger-menu">
                    <i class="fas fa-bars"></i>
                    <i class="fas fa-times"></i>
                </div>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="MainPage" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Offers</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">News</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Contact</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="hero">
            <div class="container">
                <div class="main-heading">
                    <h1 class="title">Discover</h1>
                    <h2 class="subtitle">Pet hotels</h2>
                </div>
                <a href="#" class="btn btn-gradient">Explore now
                    <span class="dots"><i class="fas fa-ellipsis-h"></i></span>
                </a>
            </div>
        </div>
        <section class="booking">
            <div class="container">
                <form id="searchForm" method="GET" action="${path}/search" class="form">
                    <div class="input-group">
                       	<label for="keywordInput" class="input-label">Destination</label>
                        <input type="text" class="input" id="keywordInput" name="keyword" value="${scri.keyword}" />
                    </div>
                    <div class="input-group">
                        <label for="check-in" class="input-label">Check in</label>
                        <input type="date" class="input" id="check-in">
                    </div>
                    <div class="input-group">
                        <label for="check-out" class="input-label">Check out</label>
                        <input type="date" class="input" id="check-out">
                    </div>
                    <div class="input-group">
                        <label for="adults" class="input-label">Adults</label>
                        <select class="options" id="adults">
                            <option value="0">0</option>
                            <option value="0">1</option>
                            <option value="0">2</option>
                            <option value="0">3</option>
                            <option value="0">4</option>
                            <option value="0">5</option>
                        </select>
                    </div>
                    <button id="searchBtn" type="button" class="btn form-btn btn-purple">검색
                        <span class="dots"><i class="fas fa-ellipsis-h"></i></span>
                    </button>
                </form>
            </div>
        </section>
        <section class="hotels">
            <div class="container">
                <h5 class="section-head">
                    <span class="heading">Explore</span>
                    <span class="sub-heading">Our beautiful hotels</span>
                </h5>
                <div class="grid">
                
					<c:forEach var="c" items="${listFacility}">                
	                    <div class="grid-item featured-hotels">
	                        <img src="${c.f_pic}" alt="" class="hotel-image">
	                        <h5 class="hotel-name"><a href="detail?facility_no=${c.facility_no}">${c.facility_name}</a></h5>
	                        <span class="hotel-price">${c.f_minprice}</span>
	                        <div class="hotel-rating">
	                            <i class="fas fa-star rating"></i>
	                            <i class="fas fa-star rating"></i>
	                            <i class="fas fa-star rating"></i>
	                            <i class="fas fa-star rating"></i>
	                            <i class="fas fa-star-half rating"></i>
	                        </div>
	                        <a href="detail?facility_no=${c.facility_no}" class="btn btn-gradient">Book now
	                            <span class="dots"><i class="fas fa-ellipsis-h"></i></span>
	                        </a>
	                    </div>
	                </c:forEach>
                </div>
            </div>
        </section>

    </main>

    <script src="main.js"></script>
</body>

</html>
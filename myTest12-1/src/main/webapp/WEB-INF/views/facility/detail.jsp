<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
          <meta charset="UTF-8">
          <meta name="viewport"
                    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>PETWEGO | 숙소</title>
          <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
         
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
          <style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Courgette|Open+Sans:400,800&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
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
    /* --gradient-color: linear-gradient(to right, var(--yellow-solid), var(--purple-light)); */
    --gradient-color:linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5); 
    /* --gradient-color-alt: linear-gradient(to right, var(--purple-light), var(--yellow-solid)); */
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
    background: url("./images/hero_background.jpg") center no-repeat;
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
    background-color: var(--skyblue-transparent-alt);
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
/*cart*/
.hotel-head{
    margin-bottom: 5rem;
}
.hotel-name{
    display: block;
    /* font-size: 4rem; */
    font-weight: 200;
    font-size: 32px;
 
}
.hotel-contact{
    /* font-size:1.7rem; */
    color:#a5a5a5;
}


.btn {
    text-align: center;
    vertical-align: middle;
    padding: .67em .67em;
    cursor: pointer;
}

.btn-header {
    margin: .5em 15% 2em 15%;
    color: white;
    border: 2px solid #2D9CDB;
    background-color: rgba(255, 255, 255, .1);
    border-radius: 0;
    font-size: 1.5em;
    font-weight: lighter;
    padding-left: 2em;
    padding-right: 2em;
}

.btn-header:hover {
    background-color: rgba(255, 255, 255, .3);
}

.btn-play {
    display: block;
    margin: 0 auto;
    color: #2D9CDB;
    font-size: 4em;
    border-radius: 50%;
    width: 100px;
    height: 100px;
    padding: 0;
    text-align: center;
}

.btn-primary {
    color: white;
    background-color: #56CCF2;
    border: none;
    border-radius: .3em;
    font-weight: bold;
}

.btn-primary:hover {
    background-color: #2D9CDB;
}

.tour-row {
    border-bottom: 1px solid black;
    padding-bottom: 1em;
    margin-bottom: 1em;
}

.tour-row:last-child {
    border: none;
}

.tour-item {
    display: inline-block;
    padding-right: .5em;
}

.tour-date {
    color: #555;
    width: 11%;
    font-weight: bold;
}

.tour-city {
    width: 24%;
}

.tour-arena {
    width: 42%;
}

.tour-btn {
    max-width: 19%;
}

.shop-item {
    margin: 30px;
}

.shop-item-title {
    display: block;
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 1.5em;
    color: #333;
    margin-bottom: 15px;
}


.shop-item-image {
    height: 250px;
}

.shop-item-details {
    display: flex;
    align-items: center;
    padding: 5px;
}

.shop-item-price {
    flex-grow: 1;
    color: #333;
}

.shop-items {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.cart-header {
    font-weight: bold;
    font-size: 1.25em;
    color: #333;
}

.cart-column {
    display: flex;
    align-items: center;
    border-bottom: 1px solid black;
    margin-right: 1.5em;
    padding-bottom: 10px;
    margin-top: 10px;
}

.cart-row {
    display: flex;
}

.cart-item {
    width: 45%;
}

.cart-price {
    width: 20%;
    font-size: 1.2em;
    color: #333;
}

.cart-quantity {
    width: 35%;
}

.cart-item-title {
    color: #333;
    margin-left: .5em;
    font-size: 1.2em;
}

.cart-item-image {
    width: 75px;
    height: auto;
    /* border-radius: 10px; */
}

.btn-danger {
    color: white;
    background-color: #EB5757;
    border: none;
    border-radius: .3em;
    font-weight: bold;
}

.btn-danger:hover {
    background-color: #CC4C4C;
}

.cart-quantity-input {
    height: 34px;
    width: 50px;
    border-radius: 5px;
    border: 1px solid #56CCF2;
    background-color: #eee;
    color: #333;
    padding: 0;
    text-align: center;
    font-size: 1.2em;
    margin-right: 25px;
}

.cart-row:last-child {
    border-bottom: 1px solid black;
}

.cart-row:last-child .cart-column {
    border: none;
}

.cart-total {
    text-align: end;
    margin-top: 10px;
    margin-right: 10px;
}

.cart-total-title {
    font-weight: bold;
    font-size: 1.5em;
    color: black;
    margin-right: 20px;
}

.cart-total-price {
    color: #333;
    font-size: 1.1em;
}

.btn-purchase {
    display: block;
    margin: 40px auto 80px auto;
    font-size: 1.75em;
}

.hotels{
    font-family: 'Noto Sans KR', sans-serif;
    margin-top:65px;

    /* letter-spacing: -0.78px; */
  
    line-height: 22px;
    -webkit-font-smoothing: antialiased;
    letter-spacing: -2px;
    /* margin-bottom: 42px; */
}

.i-city{
    font-weight: 500;
    font-size: 18px;
    color: #000;
}
.i-address{
    position: relative;
    min-height: 21px;
    margin: 30px 0 0;
    font-weight: 400;
    font-size: 14px;
    line-height: 1.5;
    color: #444;
}
.i-address a{
    color:#909090;
    letter-spacing: -0.4px;
    display: inline-block;
    overflow: hidden;
    max-width: 100%;
    padding: 0 0 4px 0;
    border-bottom: 1px solid #e8e8e8;
    color: #909090;
    letter-spacing: 0;
    letter-spacing: -0.4px;
    text-decoration: none;
    text-overflow: ellipsis;
    word-wrap: normal;
   margin: 0 0 25px 0;
}

.i-address a>span{
    margin: 0 26px 0 0;
}
table{
    border-collapse: collapse;
    width: 100%;
    table-layout: fixed;
}
table td{
    line-height: 1.25;

    border-bottom: 1px solid #d5d5d5;
    padding: 10px 5px 10px 0;
}
td.td-scope-room{
    /* border-right: 1px solid #eaeaea; */
    padding-left: 23px;
}

table td img{
    border-radius: 3px;
}
th span{
    font-size: 14px;
    letter-spacing: -1px;
    color:#444;
    font-weight: 400;
}
thead th{
    padding: 10px 5px 10px 25px;
    border-bottom: 1px solid #d5d5d5;
    background: #f6f6f6;
    color: #727272;
    text-align: left;
}
.th-scope-reserve{
    padding-right: 24px;
    text-align: right;
}
.row2{
    color: #909090;
    font-size: 13px;
    letter-spacing: 0;
}
.i-txt-roomName{
    display: block;
    font-size: 15px;
    color: #000;
    text-align: left;
    text-transform: capitalize;
    letter-spacing: -0.03em;
    word-break: keep-all;
    font-weight:400;
}
.i-icon{
   color: #909090;
   display: block;
   position: relative;
   min-height: 17px;
   padding: 0 0 0 21px;
   line-height: 17px;
   font-weight: 400;
    font-size: 14px;
    line-height: 1.5;
    color: #444;
    letter-spacing: -1px;
}
.hotel-name{
    margin: 7px 0 3px;
}
.td-scope-reserve{
    position: relative;
    min-height: 44px;
    padding: 0 0 0 120px;
    text-align: right;
}
.td-scope-reserve > div{
    display: inline-block;
    padding-right: 20px;
}
.i-bt-reserve{
    display: inline-block;
    width: 62px;
    height: 50px;
    margin: 0 0 0 8px;
    background: #fb5018;
    font-size: 17px;
    line-height: 50px;
    color: #fff;
    text-align: center;

}

.i-price-last > span{
    font-size: 24px;
    color: #000;
    letter-spacing: -2px;
}
.review-title{
    padding: 0  0 15px;
    /* background: #f5f5f5; */
    background: #f8f8f8;
    width: 270px;
    max-width: 270px;
    margin-top:60px;
    display: table-cell;
}
.i-title{
    border-bottom: 1px solid #9e9e9e;
    display: inline-block;
    margin: 0 45px;
    font-size: 22px;
    line-height: 1.5;
    font-weight: 400;
    letter-spacing: -1px;
   
    -webkit-font-smoothing: antialiased;
}
.i-title em{
    font-style: normal;
}
.review-title::before{
    content: "";
    display: block;
    height: 4px;
    margin: 0 0 26px;
    /* background: #00a680; */
    background: var(--skyblue-transparent);
}

.i-hotelName{
    padding: 25px 0 50px;
    font-size: 18px;
    letter-spacing: 0;
    word-break: break-word;
    margin:0 45px;
}
.i-rate-hotel{
    margin: 0 0 40px;
    padding: 0 0 0 45px;
}
.btnWrap{
    overflow: hidden;
    min-height: 28px;
    padding: 18px 0;
    text-align: center;
}
.btnWrap a{
    color: #888;
    font-size: 14px;
    letter-spacing: -1px;
    font-weight: 400;
    padding: 0 18px;
}
.review-content{
    width:810px;
    display: table-cell;
    vertical-align: top;
}
.table-line{

}
.i-list-rate{
    border-bottom: 1px solid #d5d5d5;
    /* display: inline-block; */
    /* vertical-align: middle; */
    /* padding: 10px 12px; */
}
.rate-num{
    font-weight: 300;
    color: #909090;
}

.reviews-tabTitle{
    font-weight: 500;

    width: 398px;
    margin-left: -255px;
    height: 55px;
    line-height: 1.5;
  
    letter-spacing: -1px;

    font-weight: 400;
    font-size: 17px;
    color: #666;
    cursor: pointer;
}
.reviews{
    margin-top:80px;
}
.i-list-title{
font-size: 14px;
    line-height: 1.5;
    color: #444;
    letter-spacing: -1px;
}
.i-list-user{
    text-align: center;
}
.ft-secondary{
    font-weight: 400;
    font-size: 14px;

    line-height: 1.5;
    color: #444;
}
.rate-icon i, .i-rate-hotel i{
    color:var(--yellow-solid);
}

.article-content{
    float: right;
    width: 945px;
    line-height: 1.92;
    font-weight: 400;
    font-size: 14px;
    line-height: 1.5;
    color: #444;
    letter-spacing: -1px;
}

.article-title{
    line-height: 1.5;
    font-size: 18px;
    color: #000;
    letter-spacing: -2px;
    font-weight: 400;

    float: left;
    width: 125px;
    padding: 17px 0 20px 27px;

   
}
.article-title em{
    font-style: normal;
    display: inline-block;
    padding: 0 0 3px;
    border-bottom: 1px solid #000;
}
.article-inner{
    /* border-bottom: 1px solid #d3d3d3; */

    /* padding: 25px 0 10px; */
    width: 100%;
    /* margin: 0 auto; */
    padding: 25px 0 100px;

}
.facility-list-hotel{
    margin: 18px 0 25px;
}
.facility-list-hotel li{
    float: left;
    min-width: 165px;
    margin: 2px 40px 0 0;
}
.article-content{
    position: relative;
    width: 945px;
    float: right;
    padding: 22px 0 20px 27px;
}

.dates {
    background:#f8f8f8;

    width: 100%;
    padding: 3rem 0 3rem;
    display: flex;
    color:#444;
    margin-top:6rem;
    -webkit-box-shadow: 0 4px 6px -6px #222;
    -moz-box-shadow: 0 4px 6px -6px #222;
    box-shadow: 0 4px 6px -6px #222;
}

.dates div, .dates span{
    font-size: 14px;
    letter-spacing: -1px;
    color: #909090;
}
#i-date1, #room, #adult, #child, #pet{
    height:20px;
    padding: 12px 0 12px 10px;
    outline: none;
    border-radius: 3px;
    border: 1px solid #e7e7e7;
    vertical-align: middle;
    background: #fff;
}
#room, #adult, #child, #pet{
    width: 30px;
}

.dates input::placeholder {
    /* color: #444; */
    font-size: 1.5rem;
    letter-spacing: 0;
    font-weight:400;
    line-height: 1.3;
    color: var(--skyblue-solid);
}
.datepicker{width:230px;}

.hotels table{
    margin-bottom:12px;
}
#keyword{
    background: none;
    border: none;
    outline: none;
    border-bottom: 1px solid #aaa;
    font-size: 2.5rem;
    
    width: 300px;
    
    padding: 0 0 7px 5px;
    margin-right: 3rem;
}
.i-bt-search{
    display: inline-block;
    width: 62px;
    height: 30px;
    margin: 0 0 0 8px;
    /* background: #fff; */
    font-size: 17px;
    line-height: 30px;

    text-align: center;
    border-radius: 3px;
}
.i-bt-search .ft{
    color:var(--skyblue-solid);
}        
          </style>
</head>

<body>
          <header class="header">
                    <div class="container">
                              <nav class="nav">
                                        <a href="MainPage" class="logo">
                                                  <!-- <img src="./images/logo.png" alt=""> --><i
                                                            class="fas fa-paw"></i> PETWEGO
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

                    <div class="dates">
                              <div class="container">
                                        <input type="text" name="keyword" id="keyword" autocomplete="off">


                                        <!-- <label><i class="fas fa-calendar-alt"></i></label> -->
                                        <input type="text" autocomplete="off" id="i-date1" class="form-control"
                                                  placeholder="2020-05-16">
                                        <input type="text" autocomplete="off" id="i-date1" class="form-control"
                                                  placeholder="2020-05-23">
                                        <input type="hidden" id="RoomPassen" name="RoomPassen">객실
                                        <span id="srp_room">
                                                  <select id="room">
                                                            <option value="1">1</option>
                                                            <option value="1">2</option>
                                                            <option value="1">3</option>
                                                            <option value="1">4</option>
                                                            <option value="1">5</option>
                                                            <option value="1">6</option>
                                                            <option value="1">7</option>
                                                            <option value="1">8</option>
                                                            <option value="1">9+</option>
                                                  </select>

                                        </span>개, 성인
                                        <span id="srp_adult">
                                                  <select id="adult">
                                                            <option value="1">1</option>
                                                            <option value="1">2</option>
                                                            <option value="1">3</option>
                                                            <option value="1">4</option>
                                                            <option value="1">5</option>
                                                            <option value="1">6</option>
                                                  </select>
                                        </span>명, 아동
                                        <span id="srp_child">
                                                  <select id="child">
                                                            <option value="1">1</option>
                                                            <option value="1">2</option>
                                                            <option value="1">3</option>
                                                            <option value="1">4</option>
                                                            <option value="1">5</option>
                                                            <option value="1">6</option>
                                                  </select>
                                        </span>명, 애완동물
                                        <span id="srp_pet">
                                                  <span id="srp_child">
                                                            <select id="pet">
                                                                      <option value="1">1</option>
                                                                      <option value="1">2</option>
                                                                      <option value="1">3</option>
                                                                      <option value="1">4</option>
                                                                      <option value="1">5</option>
                                                                      <option value="1">6</option>
                                                            </select>
                                                  </span>마리
                                                  <a href="#" class="i-bt-search"><span class="ft">검색</span></a>
                              </div>


                    </div>
                    <section class="hotels">
                              <div class="container">
                              			<c:set var="f" value="${getFacility}"></c:set>
                                        <h5 class="hotel-head">
                                                  <strong class="i-city">${fn:substring(f.facility_addr,0,2)}</strong>
                                                  <span class="hotel-name">${f.facility_name}</span>
                                        </h5>
                                        <p class="i-address">
                                                  <a href="#"
                                                            id="btnMapOpen" class="ft-secondary"
                                                            role-target="layer_detailCaution"><i
                                                                      class="fas fa-map-marker-alt"></i>
                                                            <span>지도보기</span>${f.facility_addr}</a>
                                        </p>
                                        <table>
                                                  <colgroup>
                                                            <col style="width: 168px;">
                                                            <col>
                                                            <col style="width: 370px;">
                                                            <!--width: 325px; 원래 246px-->
                                                            <col style="width: 370px;">
                                                  </colgroup>
                                                  <thead>
                                                            <tr>
                                                                      <th scope="col" class="th-scope-figure">
                                                                                <span class="invisible"></span>
                                                                      </th>
                                                                      <th scope="col" class="th-scope-room">
                                                                                <span>객실정보</span>
                                                                      </th>
                                                                      <th scope="col" class="th-scope-condtion">
                                                                                <span>조건</span>
                                                                      </th>
                                                                      <th scope="col" class="th-scope-reserve">
                                                                                <span>1박 총요금 (부가세/봉사료 불포함)</span>
                                                                      </th>
                                                            </tr>
                                                  </thead>
                                                  <c:forEach var="r" items="${listRoom}">
                                                  <tbody id="tbRateList">
                                                            <tr>
                                                                      <td class="td-scope-figure">
                                                                                <img src="${r.rm_pic}" width="168"
                                                                                          height="94">
                                                                      </td>
                                                                      <td class="td-scope-room">
                                                                                <div>
                                                                                          <strong
                                                                                                    class="i-txt-roomName">${r.rm_name}</strong>
                                                                                          <div>
                                                                                                    <span
                                                                                                              class="row1"></span>
                                                                                                    <span class="row2">
                                                                                                              ${r.rm_info}
                                                                                                    </span>
                                                                                          </div>
                                                                                </div>
                                                                      </td>
                                                                      <td class="th-scope-condition">
                                                                                <span class="i-icon">${r.rm_max}</span>
                                                                               
                                                                      </td>
                                                                     
                                                                      <td class="td-scope-reserve">
                                                                                <div>
                                                                                          <span class="i-price-last"><span
                                                                                                              class="ft-secondary">${r.rm_cost}</span></span>
                                                                                </div>

                                                                                <div>
                                                                                          <a href="reserve"
                                                                                                    class="i-bt-reserve"><span
                                                                                                              class="ft">예약</span></a>
                                                                                </div>
                                                                      </td>
                                                            </tr>

                                                  </tbody>
                                                  </c:forEach>
                                        </table>
										
                                        <!--소개-->
                                        
                                        <c:set var="g" value="${getFacility}"></c:set>
                                        <div class="article-inner">
                                                 
                                                  <h3 class="article-title"><em>호텔소개</em></h3>

                                                  <div class="article-content">
                                                            <div>${g.f_intro}
                                                            </div>
                                                  </div>
                                        </div>
                                        <div class="article-inner">
                                                  <h3 class="article-title"><em>편의시설</em></h3>
                                                  
                                                  <div class="article-content">
                                                            <h4 class="facility-title-hotel">호텔 편의 시설</h4>
                                                            <ul class="facility-list-hotel">
                                                            <c:forTokens items="${g.f_feature}" delims="," var="item">
                                                            	<li>${item}</li>
                                                            </c:forTokens>

                                                            </ul>
                                                  </div>
                                        </div>
                                        <div class="article-inner">
                                        		<h3 class="article-title"><em>체크인 정보</em></h3>
                                        		<div class="article-content">
                                                  			<c:set var="h" value="${getFacility}"></c:set>
                                                            <div>${h.f_checkin}<br>
                                                                 ${h.f_checkout}
                                                            </div>                                        					
                                        		</div>
                                        </div>

                                        <!-- 리뷰-->
                                        <div class="article-reviews">
                                                  <!--inner-->
                                                  <div class="reviews">
                                                            <div class="review-title">
                                                                      <h3 class="i-title"><em>리뷰</em></h3>
                                                                      <c:set var="g" value="${getFacility}"></c:set>
                                                                      <p class="i-hotelName">${g.facility_name}</p>
                                                                      <div class="i-rate-hotel">
                                                                                <i class="fas fa-star"></i>
                                                                                <i class="fas fa-star"></i>
                                                                                <i class="fas fa-star"></i>
                                                                                <i class="fas fa-star"></i>
                                                                                <i class="fas fa-star-half"></i>
                                                                                <span class="rate-num">
                                                                                          <strong>4.5</strong>/5
                                                                                </span>
                                                                      </div>
                                                            </div>
                                                            <div class="review-content">
                                                                      <div class="table-line">
                                                                                <table>
                                                                                          <colgroup>
                                                                                                    <col
                                                                                                              style="width:170px;">
                                                                                                    <col>
                                                                                                    <col
                                                                                                              style="width:190px;">
                                                                                                    <col
                                                                                                              style="width:46px">
                                                                                          </colgroup>
                                                                                          <tbody>
                                                                                                    <tr
                                                                                                              class="tr-thumb">
                                                                                                              <th scope="row"
                                                                                                                        class="i-list-rate">
                                                                                                                        <span
                                                                                                                                  class="rate-icon">
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star-half"></i>
                                                                                                                        </span>

                                                                                                                        <span
                                                                                                                                  class="rate-num">
                                                                                                                                  <strong>2</strong>/5
                                                                                                                        </span>
                                                                                                              </th>
                                                                                                              <td
                                                                                                                        class="i-list-title">
                                                                                                                        <!-- <button>무늬만
                                                                                                                                  5성급
                                                                                                                                  호텔?</button> -->
                                                                                                                        주변경관은
                                                                                                                        좀
                                                                                                                        아쉬웠지만
                                                                                                                        가족과함께
                                                                                                                        오긴
                                                                                                                        좋습니다.
                                                                                                                        관리해주시는
                                                                                                                        사장님?
                                                                                                                        이
                                                                                                                        넘
                                                                                                                        친절하십니다.
                                                                                                                        도구도
                                                                                                                        빌려주시고
                                                                                                                        텐트초보라
                                                                                                                        헤매는
                                                                                                                        저를...
                                                                                                              </td>
                                                                                                              <td
                                                                                                                        class="i-list-user">
                                                                                                                        <span
                                                                                                                                  class="ft-secondary">2020.05.08<br>corri2020님</span>
                                                                                                              </td>
                                                                                                    </tr>
                                                                                                    <tr
                                                                                                              class="tr-thumb">
                                                                                                              <th scope="row"
                                                                                                                        class="i-list-rate">
                                                                                                                        <span
                                                                                                                                  class="rate-icon">
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star-half"></i>
                                                                                                                        </span>

                                                                                                                        <span
                                                                                                                                  class="rate-num">
                                                                                                                                  <strong>2</strong>/5
                                                                                                                        </span>
                                                                                                              </th>
                                                                                                              <td
                                                                                                                        class="i-list-title">
                                                                                                                        <!-- <button>무늬만
                                                                                                                                  5성급
                                                                                                                                  호텔?</button> -->
                                                                                                                        주변경관은
                                                                                                                        좀
                                                                                                                        아쉬웠지만
                                                                                                                        가족과함께
                                                                                                                        오긴
                                                                                                                        좋습니다.
                                                                                                                        관리해주시는
                                                                                                                        사장님?
                                                                                                                        이
                                                                                                                        넘
                                                                                                                        친절하십니다.
                                                                                                                        도구도
                                                                                                                        빌려주시고
                                                                                                                        텐트초보라
                                                                                                                        헤매는
                                                                                                                        저를...
                                                                                                              </td>
                                                                                                              <td
                                                                                                                        class="i-list-user">
                                                                                                                        <span
                                                                                                                                  class="ft-secondary">2020.05.08<br>corri2020님</span>
                                                                                                              </td>
                                                                                                    </tr>
                                                                                                    <tr
                                                                                                              class="tr-thumb">
                                                                                                              <th scope="row"
                                                                                                                        class="i-list-rate">
                                                                                                                        <span
                                                                                                                                  class="rate-icon">
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star-half"></i>
                                                                                                                        </span>

                                                                                                                        <span
                                                                                                                                  class="rate-num">
                                                                                                                                  <strong>2</strong>/5
                                                                                                                        </span>
                                                                                                              </th>
                                                                                                              <td
                                                                                                                        class="i-list-title">
                                                                                                                        <!-- <button>무늬만
                                                                                                                                  5성급
                                                                                                                                  호텔?</button> -->
                                                                                                                        주변경관은
                                                                                                                        좀
                                                                                                                        아쉬웠지만
                                                                                                                        가족과함께
                                                                                                                        오긴
                                                                                                                        좋습니다.
                                                                                                                        관리해주시는
                                                                                                                        사장님?
                                                                                                                        이
                                                                                                                        넘
                                                                                                                        친절하십니다.
                                                                                                                        도구도
                                                                                                                        빌려주시고
                                                                                                                        텐트초보라
                                                                                                                        헤매는
                                                                                                                        저를...
                                                                                                              </td>
                                                                                                              <td
                                                                                                                        class="i-list-user">
                                                                                                                        <span
                                                                                                                                  class="ft-secondary">2020.05.08<br>corri2020님</span>
                                                                                                              </td>
                                                                                                    </tr>
                                                                                                    <tr
                                                                                                              class="tr-thumb">
                                                                                                              <th scope="row"
                                                                                                                        class="i-list-rate">
                                                                                                                        <span
                                                                                                                                  class="rate-icon">
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star-half"></i>
                                                                                                                        </span>

                                                                                                                        <span
                                                                                                                                  class="rate-num">
                                                                                                                                  <strong>2</strong>/5
                                                                                                                        </span>
                                                                                                              </th>
                                                                                                              <td
                                                                                                                        class="i-list-title">
                                                                                                                        <!-- <button>무늬만
                                                                                                                                  5성급
                                                                                                                                  호텔?</button> -->
                                                                                                                        주변경관은
                                                                                                                        좀
                                                                                                                        아쉬웠지만
                                                                                                                        가족과함께
                                                                                                                        오긴
                                                                                                                        좋습니다.
                                                                                                                        관리해주시는
                                                                                                                        사장님?
                                                                                                                        이
                                                                                                                        넘
                                                                                                                        친절하십니다.
                                                                                                                        도구도
                                                                                                                        빌려주시고
                                                                                                                        텐트초보라
                                                                                                                        헤매는
                                                                                                                        저를...
                                                                                                              </td>
                                                                                                              <td
                                                                                                                        class="i-list-user">
                                                                                                                        <span
                                                                                                                                  class="ft-secondary">2020.05.08<br>corri2020님</span>
                                                                                                              </td>
                                                                                                    </tr>
                                                                                                    <tr
                                                                                                              class="tr-thumb">
                                                                                                              <th scope="row"
                                                                                                                        class="i-list-rate">
                                                                                                                        <span
                                                                                                                                  class="rate-icon">
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star"></i>
                                                                                                                                  <i
                                                                                                                                            class="fas fa-star-half"></i>
                                                                                                                        </span>

                                                                                                                        <span
                                                                                                                                  class="rate-num">
                                                                                                                                  <strong>2</strong>/5
                                                                                                                        </span>
                                                                                                              </th>
                                                                                                              <td
                                                                                                                        class="i-list-title">
                                                                                                                        <!-- <button>무늬만
                                                                                                                                  5성급
                                                                                                                                  호텔?</button> -->
                                                                                                                        주변경관은
                                                                                                                        좀
                                                                                                                        아쉬웠지만
                                                                                                                        가족과함께
                                                                                                                        오긴
                                                                                                                        좋습니다.
                                                                                                                        관리해주시는
                                                                                                                        사장님?
                                                                                                                        이
                                                                                                                        넘
                                                                                                                        친절하십니다.
                                                                                                                        도구도
                                                                                                                        빌려주시고
                                                                                                                        텐트초보라
                                                                                                                        헤매는
                                                                                                                        저를...
                                                                                                              </td>
                                                                                                              <td
                                                                                                                        class="i-list-user">
                                                                                                                        <span
                                                                                                                                  class="ft-secondary">2020.05.08<br>corri2020님</span>
                                                                                                              </td>
                                                                                                    </tr>
                                                                                          </tbody>
                                                                                </table>
                                                                                <div class="btnWrap">
                                                                                          <a href="postReview"
                                                                                                    class="btn-write">리뷰쓰기</a>
                            <!--                                                               <a href="#"
                                                                                                    class="btn-viewAll">리뷰
                                                                                                    전체보기</a> -->
                                                                                </div>
                                                                      </div>
                                                            </div>
                                                  </div>
                                        </div>


                    </section>

          </main>

          <script src="main.js"></script>
</body>

</html>
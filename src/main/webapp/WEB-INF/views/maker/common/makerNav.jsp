<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title}</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
  href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
  rel="stylesheet"
/>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- collapse -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script>

function cancel(){
    //joocheck
    console.log("취소 진행");
    location.href=`${pageContext.request.contextPath}/makerFunding/cancel.do`;

}
</script>   
 
</head>

<body>

    <!-- 상단 바 -->
    <nav class="navbar sticky-top navbar-light bg-light border-bottom">
        <!-- 클릭할 시 펀딩 시작 화면으로 넘어간다. -->
        <a class="navbar-brand" href="#">
            <img src="" width="30" height="30" alt="">
        </a>
        <!-- 이름 여기에 불러올것 -->
        <div class="makerName"><img src="" width="30" height="30" alt="">00</div>
        <div>
            <button type="button" class="border-0">나가기</button>
        </div>
    </nav>

    <section class="d-flex">
    <!-- 좌측 바 -->
    <div style="width: 280px;">
    
        <div class="border">
            <div style="height:200px;">
                <h3>
                    <!-- 프로젝트 진행명 가져오기 -->
                    00의 
                    <br>
                    멋진 프로젝트
                </h3>
                <br>
                프로젝트 번호 
                <!-- 프로젝트 번호 불러오기 -->
            </div>
        </div>


   
        <div class="navbar-header">
            <li class="navbar-toggle list-group-item " data-toggle="collapse" data-target="#fundingReady"> 펀딩준비</li>
        </div>
        <div class="collapse navbar-collapse border" id="fundingReady">
            <ul class="nav navbar-nav">
                <li class="p-3"><a href="#">요금제 선택</a></li>
                <li class="p-3"><a href="#">기본 요건</a></li>
                <li class="p-3"><a href="#">기본 정보</a></li> 
                <li class="p-3"><a href="#">스토리 작성</a></li> 
            </ul>
        </div>

        <div class="navbar-header">
            <li class="navbar-toggle list-group-item text-muted" data-toggle="collapse" data-target="#myNavbar">새소식</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>

        <div class="navbar-header">
            <li class="navbar-toggle list-group-item text-muted" data-toggle="collapse" data-target="#myNavbar">오픈예정 현황</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>

        <div class="navbar-header">
            <li class="navbar-toggle list-group-item text-muted" data-toggle="collapse" data-target="#myNavbar">펀딩 현황</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>

        <div class="navbar-header">
            <li class="navbar-toggle list-group-item text-muted" data-toggle="collapse" data-target="#myNavbar">결제 현황</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>
        
        <div class="navbar-header">
            <li class="navbar-toggle list-group-item text-muted" data-toggle="collapse" data-target="#myNavbar">펀딩·발송 관리</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>



        <div class="navbar-header">
            <li class="navbar-toggle list-group-item font-weight-bold" data-toggle="collapse" data-target="#myNavbar">광고 센터</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>
    
        <div class="navbar-header">
            <li class="navbar-toggle list-group-item font-weight-bold" data-toggle="collapse" data-target="#myNavbar">수수료 관리</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>

        <div class="navbar-header">
            <li class="navbar-toggle list-group-item font-weight-bold" data-toggle="collapse" data-target="#myNavbar">자료 및 도움말</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>
     
    </div>

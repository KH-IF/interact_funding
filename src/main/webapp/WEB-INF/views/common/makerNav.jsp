<%@page import="com.kh.interactFunding.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title}</title>
    
    <!-- SweetAlert Ver1 , 2아님 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- SummerNote  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

<!-- collapse -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<%

	Member loginMember = (Member) session.getAttribute("loginMember");

%>
<script>

window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 2000);

</script>

<style>
.hoveref{
	color: black;
}

.hoveref:hover{
	background-color: #D3D3D3;
	color: black;
	text-decoration-line: none;
}

.aTag{
	color: black;
}
.aTag:hover{
	color: black;
	text-decoration-line: none;
}
div.navBoxUser{
	height:180px; 
	background-image: url("../resources/image/painting-divBackground.png");
}

</style>
 
</head>

<body>
	
    <!-- 상단 바 -->
    <nav class="navbar sticky-top navbar-light bg-light border-bottom">
        <!-- 클릭할 시 펀딩 시작 화면으로 넘어간다. -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/funding/ready1Funding">
            <img src="${pageContext.request.contextPath}/resources/image/makerstudiologo.png" width="150" height="40" alt="">
        </a>
        <!-- 이름 여기에 불러올것 -->
        <a class="aTag" href="${pageContext.request.contextPath}/funding/fundingStart1">
        	<div class="makerName">
        		<img src="${pageContext.request.contextPath}/resources/image/skycraper.png" style="width: 30px">
        		<span class="font-weight-bold">${loginMember.name}</span>
        	</div>
        </a>
        
        <div>
            <button type="button" class="border-0 aTag bg-light font-weight-bold" onclick ="location.href='${pageContext.request.contextPath}'">나가기</button>
        </div>
    </nav>

	

    <div class="d-flex">
	
    <!-- 좌측 바 -->
    <div style="width: 280px;">
    
        <div class="border p-4 navBoxUser">
	     	  
   			<p class="text-white font-weight-bold" style="font-size: 20px;">
	               ${loginMember.name}의 
	               <br>
	               ${funding.title != null? funding.title:'멋진 프로젝트'}
        	</p>
	            <br>
	        <p class="text-white">
	            프로젝트 번호 
	            ${funding.fundingNo}
      		</p>
	            <br>
	       
        </div>


   
        <div class="navbar-header">
            <li class=" list-group-item d-flex justify-content-between"> 
            	<a class="hoveref" href="${pageContext.request.contextPath}/funding/ready1Funding"><strong>펀딩준비</strong></a>
            	<button class="navbar-toggle border-0" data-toggle="collapse" data-target="#fundingReady">
            	
            	</button>
           	</li>
        </div>
        <div class="collapse border" id="fundingReady">
            <ul class="nav navbar-nav">
                <li class="hoveref p-3"><a class="hoveref" href="${pageContext.request.contextPath}/funding/ready2Charge">요금제 선택</a></li>
                <li class="hoveref p-3"><a class="hoveref" href="${pageContext.request.contextPath}/funding/ready3BasicInfo">기본 정보</a></li> 
                <li class="hoveref p-3"><a class="hoveref" href="${pageContext.request.contextPath}/funding/ready4Story">스토리 작성</a></li> 
                <li class="hoveref p-3"><a class="hoveref" href="${pageContext.request.contextPath}/funding/ready5Reward">리워드 설계</a></li>
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
            <li class="hoveref navbar-toggle list-group-item font-weight-bold" data-toggle="collapse" data-target="#myNavbar">광고 센터</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>
    
        <div class="navbar-header">
            <li class="hoveref navbar-toggle list-group-item font-weight-bold" data-toggle="collapse" data-target="#myNavbar">수수료 관리</li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>

        <div class="navbar-header">
            <li class="hoveref navbar-toggle list-group-item font-weight-bold">
	            <a class="aTag" href="https://www.notion.so/a933461f78f949dc9dd11f17e7d35e36">
	            자료 및 도움말
	            </a>
            </li>
        </div>
        <div class="collapse navbar-collapse border" id="myNavbar">
            <ul class="nav navbar-nav">
            </ul>
        </div>
     
    </div>
    
	<section>
	
	<!-- 알람 -->
	<c:if test="${not empty msg}">
	  <div class="alert alert-success" role="alert">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>${msg}</strong> 
	  </div>
	</c:if>
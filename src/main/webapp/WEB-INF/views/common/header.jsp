<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>

<!-- header CSS파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />
<!-- js:3.6.0 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<!-- bootstrap4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- SweetAlert Ver1 , 2아님 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>
</head>
<body>
	<header>
		<nav>
			<ol>
				<li><a href="${pageContext.request.contextPath}/">이프</a></li>
				<li><a href="${pageContext.request.contextPath}/funding/fundingList">펀딩하기</a></li>
				<li><a href="${pageContext.request.contextPath}/funding/earlyList">오픈예정</a></li>
				<li><a href="#">공지사항</a></li>
			</ol>
		</nav>
		<div id="index_searchBar_container" onclick="focus_searchInput()">
			<div id="searchBar_relative">
				<input type="text" name="searchKeyword" id="searchKeyword" placeholder="어떤 프로젝트를 찾고 계신가요?" onkeyup="searchStart(this)"/>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
			</div>
		</div>
		<%-- 로그인 되었을때 --%>
		<c:if test="${not empty loginMember}">
			<div id="login_container">
				<div id="login_relative">
					<%-- 읽지않은 메시지가 없는 경우 --%>
					<c:if test="true">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
						  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
					</c:if>
					<%-- 읽지않은 메시지가 있을 경우 --%>
					<c:if test="false">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
						  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
						</svg>
					</c:if>
					<span><a href="${pageContext.request.contextPath}/member/memberDetails">${loginMember.name}</a>님 환영합니다</span>
				</div>
			</div>
		</c:if>
		<%-- 로그인 안되었을때 --%>
		<c:if test="${empty loginMember}">
			<button type="button" class="btn btn-outline-primary" id="btn_login" onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
			<button type="button" class="btn btn-outline-primary" id="btn_enroll" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll'">회원가입</button>
		</c:if>
		<button type="button" class="btn btn-outline-success" id="project_open" onclick="openProject();">프로젝트 오픈 신청</button>
	</header>
	<script>
		function focus_searchInput(){
			$("#searchKeyword").focus();
		}
		function searchStart(input){
			//엔터키가 입력받을때만 실행
			if (window.event.keyCode == 13) {
				const searchKeyword=$(input).val();
				console.log(searchKeyword);
				//입력받은 글자가 공백이면 안내문 작성후 실행되지 않음
				if(searchKeyword.length ==0){
					swal("검색키워드","한글자 이상 입력해주세요","info");
					return;
				}
				else{
					var url = "${pageContext.request.contextPath}/funding/fundingList";
					url = url + "?searchKeyword="+$('#searchKeyword').val();
					location.href = url;
				}

				//입력받은 글자가 이상이없을때 검색기능 실행
				//검색키워드를 바탕으로 리스트페이지로 이동하는 주소를 입력하면됨
				
	        }
		}
		function openProject(){
			if(${empty loginMember.phone}){
				//핸드폰등록(메이커등록) 안되어있는 경우
				location.href='${pageContext.request.contextPath}/funding/fundingStart1';
			}else{
				//메이커 등록이 되어있는 경우
				location.href='${pageContext.request.contextPath}/funding/fundingStart2';
			}
		}
	</script>
	<section>
	
	
	
	
	
	
	
	
	
	
	
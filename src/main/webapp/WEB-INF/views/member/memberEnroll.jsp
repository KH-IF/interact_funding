<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberEnroll.css" />

	<div id="enrollContainer">
		<div id="leftContainer">
			<h1>회원가입</h1>
			<!-- 기원 p -> span 으로 변경하였습니다. -->
			<span class="leftContainer-span">이프 신규가입 하고
			다양한 혜택을 받아보세요!</span>
			<hr  /> 
			<!-- 아이콘 추가 하였습니다. -->
			<div style="position: relative;">
			<ion-icon name="mail-outline" style=" position: absolute; font-size: 30px; left: 114px; color: rgba(0,0,0,.54); top: 10px;"></ion-icon>
			<input type="button" class="btn btn-light outline" value="이메일로 가입" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll_if'"/>
			</div>
			<div class="descCenter" >
				<p style="padding-top: 40px; font-weight: 600;">이미 이프 계정이 있나요? <a href="${pageContext.request.contextPath}/member/login"><span class="descCenter-span">로그인</span></a></p>
			</div>
		</div>
		<div id="rightContainer">
			<img src="${pageContext.request.contextPath}/resources/images/memberEnroll_right_img.png"/>
		</div>
	</div>
	<style>
		.outline {
			border:1px solid lightgray;
		}
		.descCenter{
			width:400px;
			text-align:center;
			padding-bottom: 40px;
		}
		#enrollContainer{
			width:800px;
			height:800px;
			margin: 0 auto;
			display:flex;
		}
		#leftContainer{
			margin-top: 6vw;
		}
		/*기원 css 회원가입 부분 수정하였습니다.*/
		#leftContainer h1{
		padding-bottom: 4px;
		letter-spacing: -1.0px;
		font-size: 36px;
		font-weight: 700;
		
		}
		/*css 기원 추가 하였습니다.*/
		.leftContainer-span{
			font-size: 17px;
			-webkit-line-clamp:2;
			width: 210px;
		    display: -webkit-box;
		    letter-spacing: 0.3px;
		    height: 50px;
		    font-weight: 300;
		}
		/*css 기원 추가 하였습니다.*/
		.descCenter-span{
		    padding-left: 10px;
		    color: #00C4C4;
		    font-weight: 600;
		    letter-spacing: 0.3px;
		    font-size: 16px;
		}
		#leftContainer input[type=button]{
			width:100%;
			height:50px;
		}
		/*기원 css 회원가입 부분 수정하였습니다.*/
		#rightContainer{
		padding-top: 5vw;
   			 padding-left: 4vw;
		}
		/*기원 css 회원가입 부분 수정하였습니다.*/
		#rightContainer img{
			width:100%;
			height:400px;
			object-fit:cover;
		}
		
	</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

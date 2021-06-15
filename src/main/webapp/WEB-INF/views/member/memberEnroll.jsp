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
			<p>이프 신규가입 하고</p>
			<p>다양한 혜택을 받아보세요!</p>
			<br />
			<img src="${pageContext.request.contextPath}/resources/images/socialTemp.png"/>
			<hr />
			<input type="button" class="btn btn-light outline" value="이메일로 가입" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll_if'"/>
			<br />
			<br />
			<div class="descCenter">
				<span>이미 이프 계정이 있나요? <a href="${pageContext.request.contextPath}/member/login">로그인</a></span>
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
		}
		#enrollContainer{
			width:800px;
			height:400px;
			margin: 0 auto;
			display:flex;
		}
		#leftContainer{
			width:400px;
			height:400px;
		}
		#leftContainer p{
			margin-bottom:2px;
		}
		#leftContainer input[type=button]{
			width:100%;
			height:50px;
		}
		#rightContainer{
			width:400px;
			height:400px;
			margin:0;
			padding:0;
		}
		#rightContainer img{
			width:400px;
			height:400px;
		}
	</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

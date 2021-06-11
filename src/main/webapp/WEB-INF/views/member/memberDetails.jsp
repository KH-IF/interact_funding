<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberEnroll.css" />

	<div id="detailsContainer">
		<div id="detailsLeft">
			<div id="imgbox">
				<img src="${pageContext.request.contextPath}/resources/images/anonymous.png"/>
			</div>
			<div id="namebox">${loginMember.name}</div>
			<div id="detailsbox">개인회원·서포터<c:if test="${not empty loginMember.phone}">·메이커</c:if></div>
			<hr />
			<div id="platformbox"><strong>${loginMember.platform}</strong>로 로그인중</div>
			<input type="button" class="btn btn-outline-dark btn-lg" value="로그아웃" id="logoutbtn" onclick="logout();"/>
		</div>
		<div id="detailsRight">
			<h5><strong>나의 프로젝트</strong></h5>
			<div id="topbox">
				<div id="box1">
					<h4>포인트</h4>
					<h5><fmt:formatNumber value="${loginMember.point}" pattern="#,##0"/></h5>
				</div>
				<div id="box2"></div>
				<div id="box3"></div>
			</div>
		</div>
	</div>
	
	<script>
		function logout(){
			location.href='${pageContext.request.contextPath}/member/logout';
		}
	</script>
	
	<style>
		#detailsContainer{
			width:1100px;
			min-height:500px;
			display:flex;
			margin:10px auto;
			border:1px solid rgb(229,229,229);
			
		}
		#detailsLeft{
			width:250px;
			min-height:500px;
			position:relative;
			padding-top:50px;
			margin:0 auto;
		}
		#detailsRight{
			width:850px;
			min-height:500px;
			position:relative;
			border-left:1px solid rgb(229,229,229);
			padding:30px;
		}
		#imgbox{
			text-align: center;
		}
		#imgbox img{
			width:80px;
			height:80px;
			border:1px solid lightgray;
			border-radius: 50%;
		}
		#namebox{
			text-align:center;
			font-size:20px;
			font-weight:bold;
			margin-top:20px;
		}
		#detailsbox{
			text-align:center;
			font-size:13px;
			font-weight:bold;
			color:#868e96;
		}
		#platformbox{
			text-align:center;
			font-weight:bold;
		}
		#logoutbtn{
			font-weight:bold;
			margin-left:68px;
			margin-top:20px;
		}
		#topbox{
			width:100%;
			height:170px;
			border:2px solid rgb(229,229,229);
			border-radius:20px;
			display:flex;
			margin:0 auto;
			overflow: hidden;
			background:rgb(242,244,246);
		}
		#topbox div{
			width:262px;
			height:115px;
			border-left:2px solid rgb(229,229,229); 
			border-bottom:2px solid rgb(229,229,229);
			background:white;
		}
		#topbox div:first-child {
			border-left:none;
		}
}
	</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

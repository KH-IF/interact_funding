<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="비밀번호 찾기-이프" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

	<div id="loginContainer">
		<h1 style="font-size: 32px; color: rgba(0,0,0,.84); padding-top: 2.35vw;">비밀번호 찾기</h1>
		<span id="loginContainer-span">가입하셨던 이메일 계정을 입력하시면,
			비밀번호를 새로 만들 수 있는 링크를 이메일로
			발송해드립니다.</span>
		<form:form id="loginFrm" action="${pageContext.request.contextPath}/member/findid" method="post">
			<input type="email" name="email" onchange=color(this) placeholder="이메일을 입력해주세요"/>
			<br />
			<input type="text" name="name" onchange=color(this) placeholder="이름을 입력해주세요"/>
			<br />
			<input type="submit" class="btn btn-info" value="비밀번호 찾기" />
		</form:form>
		<hr />
		<div id="loginDesc">이프 계정을 갖고계시나요?<a href="${pageContext.request.contextPath}/member/login"><strong>로그인</strong></a></div>
	</div>
	<style>
		#loginFrm{
		margin-top: 2vw;
		}
		#loginContainer-span{
		display: flex;
	    margin-top: 1vw;
	    line-height: 19px;
	    color: rgba(0,0,0,.54);
	    letter-spacing: 0.3px;
	    font-size: 15px
		}
		#loginContainer{
			width:400px;
			height:550px;
			margin: 0 auto;
		}
		#loginContainer input[type=email], #loginContainer input[type=text]{
			width:100%;
			height:50px;
			margin-bottom:5px;
		}
		#loginContainer2{
			position: relative;
			width:400px;
			height:40px;
			margin-top:15px;
		}
		#loginContainer2 div{
			position:absolute;
			left:0;
			top:0;
		}
		#loginContainer2 div *{
			cursor:pointer;
		}
		#loginContainer2 a{
			position:absolute;
			right:0;
			top:0;
		}
		#loginContainer input[type=submit]{
			width:100%;
			height:50px;
		}
		#loginDesc{
			text-align: center;
			font-weight: 600;
		}
		#loginDesc strong{
			color:#17A2B8;
			margin-left: 10px;
		}
	</style>
	<script>
		function color(tag){
			const length = $(tag).val().length;
			if(length>0){
				$(tag).css('background-color','#E8F0FE');
			}else{
				$(tag).css('background-color','');
			}
		}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

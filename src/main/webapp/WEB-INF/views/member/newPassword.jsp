<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="비밀번호변경" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

	<div id="loginContainer">
		<h1>비밀번호 변경하기</h1>
		<form:form id="loginFrm" action="${pageContext.request.contextPath}/member/newPassword" method="post">
			<input id="pwd" type="password" name="password" onchange=color(this) placeholder="새로운 비밀번호를 입력하세요"/>
			<br />
			<input id="pwdCheck" type="password" onchange=color(this) placeholder="한번더 입력해주세요"/>
			<br />
			<input type="hidden" name="memberNo" value="${memberNo}" />
			<input type="submit" class="btn btn-info" value="비밀번호 변경" />
		</form:form>
		<hr />
		<div id="loginDesc">이프 계정을 갖고계시나요?!   <a href="${pageContext.request.contextPath}/member/login"><strong>로그인</strong></a></div>
	</div>
	<style>
		#loginContainer{
			width:400px;
			height:400px;
			border:1px solid black;
			margin: 0 auto;
		}
		#loginContainer input[type=password]{
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
		}
		#loginDesc strong{
			color:#17A2B8;
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
		$("#loginFrm").submit(function(){
			//비밀번호 유효성 검사
			//!@#$%^&*+=- 특수문자 1개이상 영문1개이상 숫자1개이상 8글자이상
			var password = $("#pwd").val();
			var password2 = $("#pwdCheck").val();
			if((/[!@#$%^&*+=-]/.test(password) && /[0-9]/.test(password) && /[a-zA-Z]/.test(password) && /.{8,}/.test(password))==false){
				swal("부적절한 비밀번호","영문, 숫자, 특수문자 (!@#$%^&*+=-)를 조합한 8자 이상","error");
				return false;
			}

			//비밀번호 확인 검사
			if(password != password2){
				swal("비밀번호 불일치", "비밀번호를 다시 확인해주세요","error");
				return false;
			}
			
			//위의 모든 유효성 검사 통과시 폼 제출됨
		});
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프 로그인" name="title" 	/>
</jsp:include>
<% 
	String saveEmail = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			String name = c.getName();
			String value = c.getValue();
			if ("saveEmail".equals(name))
				saveEmail = value;
		}
	}
%>
<p id="token-result"></p>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

	<div id="loginContainer">
		<h1>Login</h1>
		<form:form id="loginFrm" action="${pageContext.request.contextPath}/member/login_if" method="post">
			<input type="email" name="email" onchange=color(this) placeholder="이메일을 입력해주세요" value='<%=saveEmail != null ? saveEmail : ""%>'/>
			<br />
			<input type="password" name="password" onchange=color(this) placeholder="비밀번호를 입력해주세요"/>
			<br />
			<div id=loginContainer2>
				<div>
					<input type="checkbox" name="remember" id="remember" <%= saveEmail != null ? "checked" : "" %>/>
					<label for="remember" style="color:rgba(0,0,0,.54);">이메일 저장</label>
					<input type="checkbox" name="remember-me" id="remember-me" onchange="alertMsg(this);"/>
					<label for="remember-me" style="color:rgba(0,0,0,.54);">로그인유지</label>
				</div>
				<a href="${pageContext.request.contextPath}/member/findid">비밀번호 찾기<ion-icon name="chevron-forward-outline" class="chevron-forward-outline-findid"></ion-icon></a>
			</div>
			<input type="submit" class="btn btn-info" value="로그인" />
		</form:form>
		<div id="kakaoContainer" onclick="loginWithKakao();">
			<img src="${pageContext.request.contextPath}/resources/images/kakao_login.png"/>
			<input id="kakaoBtn" class="btn btn-warning" type="button"value="카카오 로그인"/>
		</div>
		<hr />
		<div id="loginDesc"><span style="padding-right: 5px; letter-spacing: -0.5px; font-weight: 600;">아직 이프 계정이 없나요?</span>   
		<a href="${pageContext.request.contextPath}/member/memberEnroll"><strong>회원가입</strong></a></div>
	</div>
	<style>
	/*기원 css 수정*/
		#loginContainer{
			width:400px;
			height:550px;
			padding-top:3vw;
			margin: 0 auto;
		}
		#loginContainer h1{
		    padding-bottom: 7px;
		    font-size: 36px;
		    letter-spacing: 0.3px;
		    font-weight: 700;
		}
		/*css 추가 했습니다.*/
		.chevron-forward-outline-findid{
		    color: rgba(0,0,0,.3);
		    font-size: 20px;
		    display: inline-block;
		    margin-bottom: -3px;
		    padding-bottom: -6px;
		}
		
		#loginContainer input[type=email], #loginContainer input[type=password]{
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
			color: rgba(0,0,0,.54);
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
		#kakaoContainer{
			position: relative;
			margin-top: 0.5vw;
		}
		#kakaoContainer img{
		    position: absolute;
		    left: 87px;
		    top: 1px;
		    width: 48px;
		    height: 48px;
		    cursor:pointer;
		}
		#kakaoBtn{
			background: rgb(254,229,0);
		    border-color: rgb(254,229,0);
		    width: 100%;
		    height: 50px;
		    font-weight: bold;
		}
	</style>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	//카카오 로그인 테스트 start
	Kakao.init('015826e38a56efc422e6f1ebfd6acb27');
	Kakao.isInitialized();
	console.log(Kakao.isInitialized());

	function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://interact-funding.kro.kr/member/auth/kakao'
	    });
	}
	//카카오 로그인 테스트 end

	function color(tag){
		const length = $(tag).val().length;
		if(length>0){
			$(tag).css('background-color','#E8F0FE');
		}else{
			$(tag).css('background-color','');
		}
	}

	$("#loginFrm").submit(function(){
		var value;
		var email = $("#loginFrm").find("input[type=email]").val();
		if($("#loginFrm").find("input[type=checkbox]:checked")[0]){
			value = true;
		}else{
			value = false;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/member/saveEmail",
			method:"get",
			data:{
				saveEmail : value,
				email : email,
			},
			success:function(data){
			},
			error:console.log
		});
	});

	function alertMsg(box){
		var chk = $(box).prop("checked");
		if(chk){
			swal("로그인유지","체크시 2주간 로그인이 유지됩니다","info");
		}
	}
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

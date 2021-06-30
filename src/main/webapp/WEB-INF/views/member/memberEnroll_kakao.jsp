<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

	<div id="enrollContainer">
		<h1>카카오 - 회원가입</h1>
		<form id="enrollFrm" action="${pageContext.request.contextPath}/member/memberEnroll_kakao" method="post">
			<input type="hidden" id="check"/>
			<input type="checkbox" name="agreement" id="agreement" value="T"/>
			<label for="agreement">전체동의</label>
			<p id="agreement_msg">이프 이용약관(필수), 개인정보 수집·이용 동의 (필수)</p>
			<div id="emailCertification">
				<input class="readonly" type="email" name="email" onchange=color(this) value="${member.email}" readonly/>
				<br />
			</div>
			<br />
			<input type="text" class="readonly" name="name" onchange=color(this) value="${member.name}" readonly/>
			<br />
			<input type="hidden" name="platform" value="KAKAO" />
			<input type="submit" class="btn btn-info" value="가입하기" />
		</form>
	</div>
	<style>
		#enrollContainer{
			width:400px;
			height:600px;
			border:1px solid black;
			margin: 0 auto;
		}
		#enrollContainer input[type=email], #enrollContainer input[type=text], #enrollContainer input[type=password]{
			width:100%;
			height:50px;
			margin-bottom:5px;
		}
		#enrollContainer input[type=submit]{
			width:100%;
			height:50px;
		}
		#emailCertification, #emailCertification2 {
			position: relative;
			width:100%;
			height:50px;
		}
		#emailCertification input[type=email], #emailCertification input[type=text]{
			position: absolute;
			left:0;
			top:0;			
		}
		#emailCertification input[type=button], #emailCertification2 input[type=button]{
			position: absolute;
			right:4px;
			top:6px;
		}
		label[for=agreement]{
			margin-bottom:0;
		}
		#agreement_msg{
			margin-left:18px;
			margin-bottom:15px;
			font-size: 13px;
		}
		#msg, #msg2{
			margin-left:18px;
			font-size: 13px;
			margin-bottom:5px;
		}
		.readonly{
			background:lightgray;
		}
		.outline{
			border:1px solid lightgray;
		}
		#emailCertification2{
			display:none;
		}
		#timer{
			width: 110px;
		    height: 50px;
		    position: absolute;
		    right: 100px;
		    top: 0;
		    text-align: center;
		    line-height: 50px;
		    color: red;
		}
	</style>
	
	<script>
		$("#enrollFrm").submit(function(e){
			//약관 동의 검사
			var chk = $("#agreement").prop("checked");
			if(chk==false){
				swal("약관동의","약관에 동의 해주세요","error");
				return false;
			}
		});

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

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
		<h1>회원가입</h1>
		<form id="enrollFrm" action="${pageContext.request.contextPath}/member/memberEnroll_if" method="post">
			<input type="hidden" id="check"/>
			<input type="checkbox" name="agreement" id="agreement" value="T"/>
			<label for="agreement">전체동의</label>
			<p id="agreement_msg">이프 이용약관(필수), 개인정보 수집·이용 동의 (필수)</p>
			<div id="emailCertification">
				<input type="email" name="email" onchange=color(this) placeholder="이메일을 입력해주세요"/>
				<input type="button" class="btn btn-info" value="인증하기" onclick="certification_send(this);"/>
				<br />
			</div>
			<p id="msg">위의 이메일 주소로 인증코드가 발송됩니다.</p>
			<div id="emailCertification2">
				<input type="text" name="code" onchange=color(this) placeholder="인증 코드 입력"/>
				<span id="timer"></span>
				<input type="button" class="btn btn-info" value="인증확인" onclick="certification_confirm(this);"/>
				<br />
			</div>
			<br />
			<input type="text" class="readonly" name="name" onchange=color(this) placeholder="이름을 입력해주세요" readonly/>
			<br />
			<input type="password" class="readonly" name="password" onchange=color(this) placeholder="비밀번호를 입력해주세요" readonly/>
			<input type="password" class="readonly" onchange=color(this) placeholder="비밀번호를 다시 한번 입력해주세요" readonly/>
			<p id="msg2">영문, 숫자, 특수문자 (!@#$%^&*+=-)를 조합한 8자 이상</p>
			<br />
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
		var certification_code = '';
		var timer;
		
		//인증 코드 발송 메서드
		function certification_send(btn){
			//이메일 형식 유효성검사
			var email = $("[name=email]").val();
			var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			
			if(!regex.test(email)){
				swal("이메일 형식이 유효하지 않습니다","다시 확인해 주세요","error");
				$("#emailCertification2").css("display","none");
				return;
			}
						
			//버튼->재전송버튼으로 변경
			btn.classList.remove("btn-info");
			btn.classList.add("btn-light");
			btn.classList.add("outline");
			btn.value = '재전송';

			//인증코드 입력 div 활성화
			$("#emailCertification2").css("display","block");
			
			//하단 메시지 변경
			$("#msg").val('인증번호가 발송되었습니다');
			
			//이메일 인증 코드 발송 ajax

			//일단은 success메서드는 if절로 대신함
			//ajax에서는 이미 가입한 회원인지 확인절차도 거쳐야함
			if(true){
				//인증코드 저장
				certification_code = '인증코드';
				
				//sweetAlert 표시
				swal("인증코드 발송 완료", "이메일을 확인해주세요", "success");
				//안내메시지 변경
				$("#msg").text("메일에 포함된 인증번호 6자리를 입력하세요");
				//카운트 다운 작동
				var time = 180;
				timer = setInterval(() => {
					var min = parseInt(time/60) != 0 ? (parseInt(time/60) + "분 ") : "";
					var sec = time%60 + "초";
					$("#timer").text(min+sec);
			        if (time == 0) {
			        	//clearInterval로 멈출수있음
			            clearInterval(timer);
			            $("#timer").text("입력시간 초과");
			        }
			        time=time-1;
			    }, 1000);
			}
		}

		//인증코드 확인 메서드
		function certification_confirm(btn0){
			//제한 시간내애 요청하는지 확인
			var check = $("#timer").text();
			if(check == '입력시간 초과'){
				swal("입력시간 초과","재전송 버튼을 눌러주세요","error");
				return;
			}

			//인증코드 확인
			var code = $("#emailCertification2 input[type=text]").val();
			if(code!=certification_code){
				swal("인증코드가 불일치","인증코드를 다시 확인해주세요","error");
				return;
			}

			//타이머정지 불필요한 동작
			clearInterval(timer);
			$("#timer").text("");

			//인증확인 버튼 사라지게함
			$(btn0).css("display","none");

			//인증하기 버튼 변경
			var btn = document.querySelector("#emailCertification input[type=button]");
			$(btn).removeAttr("onclick");
			btn.classList.remove("btn-info");
			btn.classList.add("btn-light");
			btn.classList.add("outline");
			btn.value = '인증완료';

			//이메일작성칸, 인증코드입력칸 readonly
			$("#emailCertification input[type=email]").prop("readonly",true);
			$("#emailCertification2 input[type=text]").prop("readonly",true);

			//이름, 비밀번호, 비밀번호 확인칸 활성화
			$("input[name=name]").prop("readonly",false)[0].classList.remove("readonly");
			$("input[type=password]").each(function(){
				$(this).prop("readonly",false)[0].classList.remove("readonly");
			});

			//인증상태 메시지 변경
			$("#msg").text("인증이 완료되었습니다");

			//이메일 검사여부 hidden에 기록
			$("#check").val(1);
		}

		$("#enrollFrm").submit(function(e){
			//약관 동의 검사
			var chk = $("#agreement").prop("checked");
			if(chk==false){
				swal("약관동의","약관에 동의 해주세요","error");
				return false;
			}
			
			//이메일인증여부 검사
			if($("#check").val()!=1){
				swal("이메일 인증","이메일 인증을 완료해주세요","error");
				return false;
			}

			//이름 유효성 검사
			var name = $("input[name=name]").val();
			if(/^[가-힣]{2,}$/.test(name)==false){
				swal("부적절한 이름","한글 2글자 이상",'error');
				return false;
			}

			//비밀번호 유효성 검사
			//!@#$%^&*+=- 특수문자 1개이상 영문1개이상 숫자1개이상 8글자이상
			var password = $("input[name=password]").val();
			var password2 = $("input[name=password]").next().val();
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

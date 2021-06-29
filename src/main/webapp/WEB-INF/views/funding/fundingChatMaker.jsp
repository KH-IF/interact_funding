<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>



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



	<div id="fundingChatMaker_wrapper_div">
			<h2>메이커에게 문의하기입니다.</h2>
			
			<br />
			<br />
		<div>
			<div id="fundingChatMaker_maker">안녕하세요 천호현님, 주식회사 아이스카이네트웍스입니다. 무엇을 도와드릴까요?</div>
		</div>
		
		
		<div>
			<div id="fundingChatMaker_customer">저좀도와주세요</div>
		</div>
		
		
		<div class="input-group mb-3">
	    <input type="text" id="message" class="form-control" placeholder="Message">
	    <div class="input-group-append" style="padding: 0px;">
	        <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
	    </div>
	    </div>
	    <div>
	        <ul class="list-group list-group-flush" id="data"></ul>
    	</div>
	
	</div>

<style>

	#fundingChatMaker_wrapper_div{
	height: 588px;
	
	
	}
	#fundingChatMaker_bottom_div{
	position: fixed;
    bottom: 0px;
    width: 500px;
    display: flex;
    background-color: gray;
	
	}

	#fundingChatMaker_comment{
    width: 378px;
    height: 41px;
	
	}
	
	#fundingChatMaker_maker{
	width: 50%;
	}
	
	#fundingChatMaker_customer{
	position: absolute;
    width: 50%;
    right: 0px;
    text-align: right;
	}
	#fundingChatMaker_message_submit{
	height: 41px;
	
	}
</style>

	<script>

		//페이지 접속 시 서버로 websocket 연결을 시도
		const ws = new WebSocket(`ws://\${location.host}${pageContext.request.contextPath}/websoooocket`);	
		const $data = $("#data");
		ws.onopen = e => {
			console.log("onopen : ", e);
			
		};
	
		ws.onmessage = e => {
			console.log("onmessage : ", e);
			const {data} = e; //객체 e의 data속성값을 data라는 변수에 담기
			$data.append("<li class='list-group-item'>" + data + "</li>"); //메세지 표시
		};
	
		ws.onerror = e => {
			console.log("onerror : ", e);
		};
	
		ws.onclose = e => {
			console.log("onclose : ", e);
		};
	
		const sendMessage = () => {
			const $message = $("#message");	
			
			if($message.val()){ // 메세지 입력했을 때에만 전송 가능
				ws.send($message.val());
				#message.val(""); // 전송 후엔 입력창 초기화
			}
		};
	
		$("#sendBtn").click(sendMessage);
		$("#message").keyup(e => e.keyCode == 13 && sendMessage()); //메세지 쓰다 엔터치면 전송
		
	</script>

</body>
</html>
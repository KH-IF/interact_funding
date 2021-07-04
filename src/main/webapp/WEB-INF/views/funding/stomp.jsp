<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<c:if test="${not empty loginMember}">
<!-- Modal -->
<div class="modal fade" id="chatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">${funding.title}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="chatBody">
      	<c:if test="${not empty chatList}">
      	
      	
      	<c:forEach items="${chatList}" var="chat">
      	<div class="chatContainer">
      		<c:if test="${loginMember.memberNo == chat.fromMemberNo}">
      		<div class='chat me alert alert-warning'>
      			${chat.content}
      			<br/>
      			<fmt:formatDate value="${chat.regDate}" pattern="yy/MM/dd HH:mm"/> 
      		</div>
      		</c:if>
      		
      		
      		<c:if test="${loginMember.memberNo != chat.fromMemberNo}">
      		<div class='chat alert alert-secondary'>
      			${chat.fromMemberName}
      			<br/>
      			${chat.content}
      			<br/>
      			<fmt:formatDate value="${chat.regDate}" pattern="yy/MM/dd HH:mm"/> 
      		</div>
      		</c:if>
      		<br />
      	</div>
      	</c:forEach>
      	</c:if>
      </div>
      <div class="modal-footer">
      	<input type="text" id="chatMessage" placeholder="메시지 내용을 입력하세요"/>
        <button type="button" class="btn btn-primary" onclick="sendMessage();">전송</button>
      </div>
    </div>
  </div>
</div>
<script>
var ws = new WebSocket("ws://interact-funding.kro.kr/stomp");
var stompClient = Stomp.over(ws);

//최초 연결
stompClient.connect({}, frame => {
	console.log("stomp connected : ", frame);

	//구독
	stompClient.subscribe("/chat/"+ "${funding.fundingNo}", frame => {
		displayMessage(frame);
	});
});

var displayMessage = ({body}) => {
	
	// 1. json -> js object
	let obj = JSON.parse(body);
	console.log(obj);
	
 	// 2. 내용만 구조분해할당
	// 3. #content prepend(자식요소로 맨앞에 추가하기)
	var divWrapper = $("<div class='chatContainer'>");
	
	console.log(obj.fromMemberNo);
	console.log(${loginMember.memberNo});
	
	if(obj.fromMemberNo == ${loginMember.memberNo}){
 		var div = $("<div class='chat me alert alert-warning'>");
	}
	else {
		var div = $("<div class='chat alert alert-secondary'>");
	}
 	div.html(obj.content+"</br>방금" );
 	
 	$(divWrapper).append(div);
 	$("#chatBody").append(divWrapper);
	

};


var sendMessage = () => {
	var url = "/funding/chat/"+"${funding.fundingNo}" //뒤에 로긴멤버대신 수신자 써야됨

	var msg = $("#chatMessage").val();
	
	if(!msg){
		swal("채팅","내용을 입력하세요","info");
		return;
	}
	
    const body = {
    	    fundingNo : '${funding.fundingNo}',
	        content : msg,
	        fromMemberNo : "${loginMember.memberNo}"
	}

	stompClient.send(url, {}, JSON.stringify(body));
	$("#chatMessage").val("").focus();
};

$("#chatMessage").keyup(e => e.keyCode == 13 && sendMessage());
</script>

</c:if>
<c:if test="${empty loginMember}">
<script>
	function sendMessage(){
		swal("채팅","로그인이 필요합니다","error");
	}
</script>
</c:if>

<style>

.modal-content{
}
.me {
	text-align: right;
	float:right;
}
.chat{
	display: inline-block;
    border-radius: 15px;
}
.chatContainer{
	width: 100%;
	clear:both;
}
</style>
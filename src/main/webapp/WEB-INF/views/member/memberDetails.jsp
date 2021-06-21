<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title" 	/>
</jsp:include>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberDetails.css" />
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
				<!-- 상단 박스 -->
				<div id="box1">
					<h4>포인트</h4>
					<h5><fmt:formatNumber value="${loginMember.point!=null ? loginMember.point : 0}" pattern="#,##0"/></h5>
				</div>
				<div id="box2">
					<h4>내가 참여한 펀딩</h4>
					<h5><fmt:formatNumber value="${particiCnt!=null ? particiCnt : 0}" pattern="#,##0"/></h5>
				</div>
				<div id="box3" onclick="location.href='${pageContext.request.contextPath}/funding/fundingStart1'">
					<h4>내가 생성한 펀딩</h4>
					<h5><fmt:formatNumber value="${createCnt!=null ? createCnt : 0}" pattern="#,##0"/></h5>
				</div>
				<h4 id="chgBox1" onclick="change1();">포인트 충전</h4>
				<div id="chgBox2" class="hide">
					<input type="number" id="input_payment" value="" step="1000" placeholder="최소금액 100원"/>
					<input type="button" class="btn btn-info" value="충전" onclick="pay();"/>
					<input type="button" class="btn btn-dark" value="취소" onclick="change2();"/>
				</div>
			</div>
			<br />
			<hr />
			<!-- 메시지, 쿠폰 영역 -->
			<div id="middleBox">
				<!-- <div id="mail" class="dropdown-toggle" data-toggle="modal" data-target="#modalMessage"> -->
				<div id="mail" class="dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
					  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
					</svg><span>메시지</span>
				</div>
				<div class="dropdown-menu" aria-labelledby="mail">
				  <div class="dropdown-item" data-toggle="modal" data-target="#modalReceive">받은 쪽지함</div>
				  <div class="dropdown-item" data-toggle="modal" data-target="#modalSend">보낸 쪽지함</div>
				</div>
				
				<div id="coupon" class="dropdown-toggle" data-toggle="modal" data-target="#modalCoupon">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
					  <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
					  <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
					  <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
					</svg><span>쿠폰</span>
				</div>
			</div>
			<hr />
			<br />
			<hr />
			<h5><strong>좋아요 누른 펀딩</strong></h5>
			<c:if test="${empty list}">
				<div class="likedFunding">
					<div class="likedTitle">좋아요를 누른 펀딩이 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${not empty list}">
			<c:forEach items="${list}" var="funding" varStatus="var">
			<div class="likedFunding alert alert-info" onclick="location.href='${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}'">
					<div class="likedTitle">${var.count}. ${funding.title} </div><%-- <div class="likedWriter">작성자:${funding.writerNo }</div> --%><div class="likedDDay">종료일자: ${funding.DDay}</div>
			</div>
			</c:forEach>
			</c:if>
			<hr />
		</div>
	</div>
	
	<!-- Coupon Modal -->
	<div class="modal fade" id="modalCoupon" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">쿠폰 입력</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <input id="couponText" type="text" class="form-control" placeholder="쿠폰을 입력해주세요" aria-label="Username" aria-describedby="basic-addon1">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="inputCoupon();">입력</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
	//로그아웃 함수
	function logout(){
		location.href='${pageContext.request.contextPath}/member/logout';
	}

	//change1, change2 포인트 충전 눌렀을대 서로 교체됨
	function change1(){
		$("#chgBox1").hide();
		$("#chgBox2").show();
	}
	function change2(){
		$("#chgBox2").hide();
		$("#chgBox1").show();
		$("#input_payment").val("");
	}
	
	//포인트 결제하기 눌렀을때 결제 연결하는 함수
	function pay(){
		const cash = $("#input_payment").val();
		if(cash==0){
			swal("최소금액", "최소 결제금액은 100원입니다", "info");
			return;
		}
		//아임포트 결제 라이브러리(김윤수가맹점번호)
		IMP.init("imp24074705");
		// IMP.request_pay(param, callback) 호출
		IMP.request_pay({
		   pg : 'inicis', // 결제방식
		   pay_method : 'card',    // 결제 수단
		   merchant_uid : 'merchant_' + new Date().getTime(),
		   name : '주문명: 포인트충전',    // order 테이블에 들어갈 주문명 혹은 주문 번호
		   amount : cash,    // 결제 금액
		   buyer_email : '${loginMember.email}',    // 구매자 email
		   buyer_name :  '${loginMember.name}',    // 구매자 이름
		   buyer_tel :  '${loginMember.phone}',    // 구매자 전화번호
		   m_redirect_url : '${pageContext.request.contextPath}/member/memberDetails'    // 결제 완료 후 보낼 컨트롤러의 메소드명
		}, function(rsp) {
		    if ( rsp.success ) { // 성공시
			    console.log(rsp);
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $.ajax({
					url: "${pageContext.request.contextPath}/member/addPoint",
					method:"post",
					data:{
						memberNo:${loginMember.memberNo},
						point:cash,
						memo:"포인트 충전",
					},
					success:(data)=>{
						var {msgg} = data;
						swal("결제완료",msgg, "success").then(function(){
							location.href="${pageContext.request.contextPath}/member/memberDetails";
						});
					},
					error: console.log
			    });
		        change2();
		    } else { // 실패시
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        swal("결제실패",msg,"error");
		    }
		});
	}

	//쿠폰입력작업하는 함수
	function inputCoupon(){
		var couponText = $("#couponText").val();
		$("#couponText").val("");

		//쿠폰입력을 작업 진행 백엔드 ajax
		$.ajax({
			url: "${pageContext.request.contextPath}/member/inputCoupon",
			method:"post",
			data:{
				memberNo:${loginMember.memberNo},
				couponText:couponText,
			},
			success:(data)=>{
				console.log(data);
				const {status, msg, now} = data;
				if(status==false){
					swal("사용불가", msg, "error");
					return;
				}
				swal("사용완료", msg, "success").then(function(){
					location.href="${pageContext.request.contextPath}/member/memberDetails";
				});
			},
			error: console.log
	    });
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
			position: relative;
		}
		#topbox div:not(:last-child){
			width:262px;
			height:115px;
			border-left:2px solid rgb(229,229,229); 
			border-bottom:2px solid rgb(229,229,229);
			background:white;
			text-align:center;
		}
		#topbox div:first-child {
			border-left:none;
		}
		#topbox div h4 {
			margin-top:32px;
		}
		#topbox > #chgBox1 {
			position: absolute;
			left:332px;
			bottom:4px;
			cursor:pointer;
		}
		#topbox > #chgBox2 {
			clear:both;
			position: absolute;
			left:300px;
			bottom:4px;
		}
		#middleBox{
			display: flex;
			overflow: hidden;
		}
		#middleBox #mail, #middleBox #coupon{
			position: relative;
			width:400px;
			height:25px;
			font-weight: bold;
			padding-left:30px;
			cursor:pointer;
		}
		#mail{
			border-right:2px solid rgb(229,229,229);
		}
		#coupon{
			margin-left:4px;
		}
		#middleBox #mail svg, #middleBox #coupon svg{
			position:absolute;
			left:0px;
			top:0px;
		}
		/* likedFunding likedFunding likedDDay */
		.likedFunding{
			width:780px;
			height:45px;
			position:relative;
			cursor:pointer;
		}
		.likedTitle{
			width:500px;
			height:30px;
			overflow:hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: bold;
		}
		.likedWriter{
			position:absolute;
			top:0px;
			right:200px;
		}
		.likedDDay{
			position:absolute;
			top:10px;
			right:10px;
		}
		#box3{
			cursor:pointer;
		}
		
}
	</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

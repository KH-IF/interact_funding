<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_reward" name="title"/>
</jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 공통css작업 기원 -->
	<div id="funding_payment_top_tap">
	<ion-icon name="chevron-back-outline" size="large" style="margin:1vw 1.25vw;"></ion-icon>
		<span id="go_back">스토리로돌아가기</span>
		<div id="fuding_payment_title_div">${funding.title}</div>
	</div>
	
	
	<div id="funding_purchase_step">
         <ol>
           <li style="margin-top: -2.1vw;"><em>리워드<br />선택</em></li>
           <hr style="border-style: dashed; margin-bottom: 1px;"/>
           <li class="active" style="margin-top: -2.3vw; display: block;" ><em>결제 예약</em></li>
         </ol>
     </div>
	
	
	<div id="fundingPayment_all_wrapper">
		<div id="fundingPayment_div1">
			<div id="fundingPayment_div1_rewardtitle">
				<br />
				<c:forEach items="${selectList}" var="selectReaward">
					<div id="selectReawardDiv">
						<div id="selectReawardTitle">
							${selectReaward.reward.title}
						</div>
						<div id="selectReawardContent">
							${selectReaward.reward.content}
						</div>
						<div id="selectReawardCount">
							<span id="selectReawardCount_1">수량 : ${selectReaward.amount} 개</span><span id="selectReawardCount_2">  총 : <fmt:formatNumber value="${selectReaward.reward.price * selectReaward.amount}" pattern="#,###" /> 원</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>	
		
		
		<div id="fundingPayment_div4">
			<div id="fundingPayment_div4_wrapper">
				<div id="fundingPayment_div4_plus">
					<span class="paymentLeft">추가후원금</span> <span class="paymentRight"><fmt:formatNumber value="${rewardTotalPriceSupport}" pattern="#,###" /></span>
				</div>	
				<div id="fundingPayment_div4_price">
					<span class="paymentLeft">펀딩금액</span> <span class="paymentRight"><fmt:formatNumber value="${rewardTotalPrice}" pattern="#,###" /></span>
				</div>	
				<div id="fundingPayment_div4_shippingfee">
					<span class="paymentLeft">배송비</span> <span class="paymentRight"><fmt:formatNumber value="2500" pattern="#,###" /></span>
				</div>	
				<div id="fundingPayment_div4_total_wrapper">
					<div id="fundingPayment_div4_total">
						<span class="paymentLeft">최종결제금액</span> <span class="paymentRight"><fmt:formatNumber value="${rewardTotalPrice + rewardTotalPriceSupport + 2500}" pattern="#,###" /> 원</span>
					</div>
				</div>	
			</div>
		</div>
		
		<form id="fundingPaymentForm" name="fundingPaymentForm" action="${pageContext.request.contextPath}/funding/fundingFinalPayment" method="POST">
			<input type="hidden" name="fundingNo" value="${funding.fundingNo}"/>
			<div id="fundingPayment_div5">
				<div id="fundingPayment_div5_wrapper"> 
					 <div id="fundingPayment_div_div1">
					 
					 	<h1>펀딩서포터</h1>
						 <div id="fundingPayment_div_div1_1">
						 	<div id="fundingPayment_div_div1_1_name">이름 : ${loginMember.name}</div>
						 	<div id="fundingPayment_div_div1_1_email">이메일 : ${loginMember.email}</div>
						 	<div id="fundingPayment_div_div1_1_phone">휴대폰번호 : ${loginMember.phone}</div>
						 </div>
						 
						 <div id="fundingPayment_div_div1_2">
							<h1 id="fundingPayment_div6_h1"> 포인트 현황</h1>
							 <div id="fundingPayment_div6">
								<div><span class="div6span1">현재 포인트 :</span> <span id="paymentNowPoint"><fmt:formatNumber value="${loginMember.point}" pattern="#,###" /></span></div>
								<div><span class="div6span1">차감예정 :</span> <span><fmt:formatNumber value="${rewardTotalPrice + rewardTotalPriceSupport + 2500}" pattern="#,###" /></span></div>
								<div><span class="div6span1">예상 잔여포인트 :</span> <span id="paymentRemainPoint"><%-- <fmt:formatNumber value="${loginMember.point-(rewardTotalPrice + rewardTotalPriceSupport + 2500)}" pattern="#,###" /> --%></span>원</div>
								
								<c:if test="${loginMember.point < (rewardTotalPrice + rewardTotalPriceSupport + 2500)}">
									<div id="checkRemainMoneyDiv"><span id="reaminMoney">잔액이적습니다. <span id="charge" onclick="window.open('${pageContext.request.contextPath}/member/memberDetails');">충전하러가기</span></span></div>
								</c:if>
							</div>	
						 </div>
					 </div>
			
				
					 <div id="fundingPayment_div_div2">
						<h1>리워드배송지</h1>
				        이름
				         <br />
				        <input type="text" name="name" id="fundingPayment_div_div2_name" placeholder="이름"/>
				        <br />
				        휴대폰번호
				         <br />
				        <input type="text" name="phone" id="fundingPayment_div_div2_phone" placeholder="휴대폰번호"/>
				        <br />
				        주소 
				        <br />
				        <button id="addressButton" type="button" class="btn btn-secondary" data-dismiss="modal" onclick="find_address()">우편번호 검색</button>
				        <br />
				        <div> <p id="fundingPayment_newaddress"></p></div>
				        <input id="address1" type="hidden" name="address1">
				        <input id="address2" type="text" name="address2" id="address2" placeholder="상세주소"/>
			         	<br />
					 	배송시 요청사항(선택)
					 	<br />
				        <input type="text" name="etc" id="fundingPayment_div_div2_request" placeholder="ex) 부재시 경비실에 보관해주세요"/>
					 </div>
				 </div>
			</div>	
		
		
		
			<div id="fundingPayment_div7">
				<div id="fundingPayment_div7_wrapper">
					<h1>약관동의</h1>
				
					<fieldset class="fundingPayment_div6_checkbox">
						<input type="checkbox" name="fundingPayment_div6_input1"
							id="ho_agreement_input1" onclick="chkAll()"/> <label for="ho_agreement_input1"><strong>전체
							동의하기</strong></label> <br>
						<hr>
						<input type="checkbox" class ="checkbox_ho" name="ho_agreement_input2" id="ho_agreement_input2" onclick="chkOne()" required />
				    	<label	for="ho_agreement_input2">제 3자에 대한 개인정보 제공 동의</label>
				    	<br>
						<input type="checkbox" class ="checkbox_ho" name="ho_agreement_input3" id="ho_agreement_input3" onclick="chkOne()" required />
				    	<label	for="ho_agreement_input3">책임 규정에 대한 동의</label>
				    	<br>
						<input type="checkbox" class ="checkbox_ho" name="ho_agreement_input4" id="ho_agreement_input4" onclick="chkOne()" required />
				    	<label	for="ho_agreement_input4">서비스이용 약관에 동의</label>
				    	<br>
					</fieldset>
				
					<div id="payment_submit_div">
						<input type="submit" id="fundingPayment_div6_checkbox_submit" class="btn btn-info" value="결제예약하기">
					</div>
				</div>
			</div>
		</form>
	</div>
	
	
	<style>
	
	#funding_payment_top_tap{
	display: flex;
	background-color: #A29584;
   	height:70px;
   	color: #ffffff;
	}
	/*공통작업 css 추가하였습니다.(기원)*/
	#go_back{
	    font-size: 19px;
    font-weight: 500;
    cursor: pointer;
    margin-top: 1vw;
    padding-left: 0.5vw;
	}
	
	#funding_purchase_step ol li.active em{
	width: 60px;
    height: 60px;
    color: #fff;
    border: none;
    background: #00c4c4;
	}
	/*기원 css 공통 작업 */
	#fuding_payment_title_div{
    margin: auto;
    font-size: 22px;
    font-weight: 500;
    
	}
	
	#go_back{
	 font-size: 17px;
     font-weight: 700;
     cursor: pointer;
	}
	
	
	#fundingPayment_all_wrapper{
     margin: auto;
     width: 800px;
     height: 2000px;
     font-weight: 700;
     border-top: 2px solid #666;	
	}
	
	#fundingPayment_all_wrapper > div{
	}
	
	
	#go_back{
	 font-size: 17px;
     font-weight: 700;
     cursor: pointer;
	}
	
	#fundingPayment_div1{
	}
	
	#fundingPayment_div2{
	 height: 110px;
	
	}
	
	#fundingPayment_div3{
	 height: 110px;
	
	
	}
	
	#fundingPayment_div4{
	 height: 220px;
	 background-color: #f9f9f9;
     padding-top: 17px;
     border-top: 1px solid #e4e4e4;
	}
	
	#fundingPayment_div4 > div > div{
	padding-top: 17px;
    margin-bottom: 5px;
	}
	
	#fundingPayment_div5{
	border-top: 1px solid #e4e4e4;
	}
	#fundingPayment_div5_wrapper{
	padding-top: 25px;
	display: flex;
	
	}
	
	#fundingPayment_div4_wrapper{
	}
	
	#fundingPayment_div4_plus, #fundingPayment_div4_price, #fundingPayment_div4_shippingfee, #fundingPayment_div4_total{
	padding-left: 30px;
	
	}
	#fundingPayment_div4_total_wrapper{
	border-top: 1px solid #e4e4e4;
	
	}
	
	/* 펀딩서포터 */
	#fundingPayment_div_div1{
	width: 400px;
	
	}
	
	/* 리워드배송지 */
	#fundingPayment_div_div2{
	width: 400px;
	padding-left: 51px;
	}
	
	/* 포인트현황 */
	#fundingPayment_div6{
	height: 180px;
	background-color: #F9F9F9;
	
	}
	
	/* 약관동의 */
	#fundingPayment_div7{
	height: 220px;
	margin-top: 31px;
	
	}
	
	#fundingPayment_all_wrapper_last{
   /*  padding-left: 51px; */
	
	}
	
	#fundingPayment_div6 > span{
	}
	
	/* step 나타는 부분*/
	#funding_purchase_step{
	padding: 30px 0 42px;
    text-align: center;
    height: 126px;
	}
	
	/*css 작업 기원*/
	#funding_purchase_step ol {
	width: 300px;
    margin: 0 auto;
    margin-top: 2vw;
	}
	/*margin 추가 하였습니다 기원*/
	#funding_purchase_step ol li{
	float: left;
    display: block;
    width: 88px;
    margin-left: 2vw;
	}
	
	#funding_purchase_step ol li em{
	display: table-cell;
    vertical-align: middle;
    width: 88px;
    height: 88px;
    font-size: 12px;
    line-height: 16px;
    background: #fff;
    border: 1px dashed #979797;
    border-radius: 50%;
	}
	
	
	#funding_purchase_step ol li.active em{
	width: 88px;
    height: 88px;
    color: #fff;
    border: none;
    background: #00c4c4;
     font-weight: 600;
	}
	
	#payment_submit_div{
	text-align: center;
	}
	
	#fundingPayment_div6_checkbox_submit{
	width: 162px;
    height: 60px;
    margin-top: 20px;
	}
	#fundingPayment_div1_rewardtitle{
	padding-left: 30px;
	}
	
	#fundingPayment_div1 > div{
	}
	
	#fundingPayment_div_div2 > input{
    width: 281px;
    height: 44px;
    padding-left: 14px;
    margin-top: 5px;
    margin-bottom: 11px;
	}
	
	#fundingPayment_div6_h1{
	margin-bottom: 15px;
	
	}
	#addressButton{
	height: 44px;
    width: 144px;
    margin-top: 11px;
	
	}
	
	#selectReawardTitle{
    font-size: 16px;
	color: #00c4c4;
	margin-bottom: 8px;
	}
	
	#selectReawardContent{
 	font-size: 16px;
 	color: #686868;
	}
	
	#selectReawardCount{
    text-align: right;
    padding-right: 40px;
    margin-bottom: 8px;
	
	}
	
	#selectReawardDiv{
    border-bottom: 1px solid #e4e4e4;
	
	}
	
	.paymentRight{
    text-align: right;
    right: 293px;
    position: absolute;
	
	}
	
	
	#fundingPayment_div_div1_1{
	height: 36%;
    margin-top: 9px;
    background: #F9F9F9;
	}
	#fundingPayment_div_div1_2{
	height: 36%;
	padding-bottom: 20px;
	}
	#fundingPayment_div_div1_1_name{
	padding-top: 16px;
	}
	#fundingPayment_div_div1_1_email{
	padding-top: 24px;
	}
	#fundingPayment_div_div1_1_phone{
	padding-top: 24px;
	}
	#reaminMoney{
	padding-top: 4px;
	font-size : 12px;
	color: red;
	padding-left: 34px;
	}
	#charge{
    font-weight: 900;
    font-size: 15px;
    text-decoration: underline;
    cursor: pointer;
	
	}
	#fundingPayment_div7_wrapper{
	padding-left: 30px;
	}
	
	.fundingPayment_div6_checkbox{
	margin-top: 31px;
	
	}
	
	#fundingPayment_div_div1_1 > div{
    padding-left: 30px;
	}
	
	.div6span1{
    padding-left: 30px;
	}
	
	#fundingPayment_div6 > div{
	padding-top: 17px;	
	}
	
	#fundingPayment_div4_total_wrapper{
	}
	
	#checkRemainMoneyDiv{
	display: none;
	
	}
	</style>
	
	<script>

	
	//실시간 금액 변경을 위함
	var point;
	window.onload = function (){
		setInterval(function(){
		      $.ajax({
	    	    method: "GET",
		        url : "${pageContext.request.contextPath}/member/selectMemberPoint?memberNo=${loginMember.memberNo}",
		        success(data){
		        	if(point == data){
						return;
			        	}
		        	point = data;
					var remainPoint = (data - ${rewardTotalPrice + rewardTotalPriceSupport + 2500});


		            
		            $("#paymentNowPoint").text(data);
		            $("#paymentRemainPoint").text(remainPoint);
		            console.log(data);
		            
		          	//잔액이적으면
		        	if(remainPoint < 0){
		        		$("#checkRemainMoneyDiv").css("display", "block");
		        		}
		    		//잔액이많으면
		    		else if(remainPoint >= 0){
		        		$("#checkRemainMoneyDiv").css("display", "none");
		        		}
		        },
				error: console.log
		      });
		 },   1000);
	}

	

	$("#go_back").click(function() {
		location.href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}";
		});

	//모두동의하기 구현
	function chkAll() {
        if ($("#ho_agreement_input1").is(':checked')) {
            $("#ho_agreement_input2, #ho_agreement_input3, #ho_agreement_input4").prop("checked", true);
        } else {
            $("#ho_agreement_input2, #ho_agreement_input3, #ho_agreement_input4").prop("checked", false);
        }
    }
	
	
	//하나라도 체크헤제 시 모두동의하기 헤제취소
	function chkOne() {
		
		var checkall = document.querySelector("#ho_agreement_input1");
		var checkboxes = document.querySelectorAll(".checkbox_ho");
		var checkedCheckBox = document.querySelectorAll(".checkbox_ho:checked");
		checkall.checked = (checkboxes.length == checkedCheckBox.length);
	};


	//창 가운데 띄우기위함
	function maker_chat_function(){
	var popupWidth = 200;
	var popupHeight = 300;
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	var popupY= (window.screen.height / 2) - (600 / 2);
	window.open('fundingFindAddress', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
	}


	/*카카오 우편번호검색  */
	function find_address(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('fundingPayment_newaddress').innerHTML = data.zonecode + addr + extraAddr;
                document.getElementById('address1').value = data.zonecode + addr + extraAddr;

                
                // 커서를 상세주소 필드로 이동한다.
        		document.getElementById("address2").focus();
            }
        }).open();
    };


    $("#fundingPaymentForm").submit(function(){

    	//잔액이 부족할때 유효성 제출시
	    var reamainMoney = $("#paymentRemainPoint").text();
 		if(reamainMoney < 0){
 			$("#checkRemainMoneyDiv").css("display", "block");
			swal("잔액 부족", "충전하러가기 문구를 클릭 후 충전을 완료해주세요 \n 금액은 자동으로 업데이트됩니다.", "error");
			return false;
			}

		//이름 유효성 제출시
		if($("#fundingPayment_div_div2_name").val() == false){
			swal("예약 실패", "이름을 입력해주세요", "error");
			$("#fundingPayment_div_div2_name").focus();
			return false;
			}

		//휴대폰 유효성 제출시
		if($("#fundingPayment_div_div2_phone").val() == false){
			swal("예약 실패", "휴대폰번호를 입력해주세요", "error");
			$("#fundingPayment_div_div2_phone").focus();
			return false;
			}
			
		//우편번호 검사시
		if($("#fundingPayment_newaddress").text() == false){
			swal("예약 실패", "우편번호를 입력해주세요", "error");
			return false;
			}
		
		//상세주소 검사시
		if($("#address2").val() == false){
			swal("예약 실패", "상세주소를 입력해주세요", "error");
			$("#address2").focus();
			return false;
			}
       });
    	
	//이름 유효성검사
    $("#fundingPayment_div_div2_name").change(function(){

    	var $fundingPayment_div_div2_name = $("#fundingPayment_div_div2_name");
    	
    	if(/^[가-힣]{2,}$/.test($fundingPayment_div_div2_name.val()) == false){
			swal("입력 실패", "이름을 올바르지 않습니다.", "error");
			$fundingPayment_div_div2_name.val("");
		}
	});

	
	//휴대폰번호 유효성검사
    $("#fundingPayment_div_div2_phone").change(function(){

    	var $fundingPayment_div_div2_phone = $("#fundingPayment_div_div2_phone");
    	
		if(/^010[0-9]{8}$/.test($fundingPayment_div_div2_phone.val()) == false){
			swal("입력 실패", "휴대폰 번호가 올바르지 않습니다.", "error");
			$fundingPayment_div_div2_phone.val("");
		}
	});
	
</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	

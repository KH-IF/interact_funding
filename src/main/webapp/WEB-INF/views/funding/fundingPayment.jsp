<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_reward" name="title"/>
</jsp:include>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<div id="funding_payment_top_tap">
		<span id="go_back">스토리로돌아가기</span>
		<div id="fuding_payment_title_div">${funding.title}</div>
	</div>
	
	
	<div id="funding_purchase_step">
         <ol>
           <li><em>리워드<br />선택</em></li>
           <li class="active"><em>결제 예약</em></li>
           <li><em>소문내기</em></li>
         </ol>
     </div>
	
	
	<div id="fundingPayment_all_wrapper">
		
		
		<div id="fundingPayment_div1">
			<div id="fundingPayment_div1_rewardtitle">
				title


			</div>
			<div id="fundingPayment_div1_option_title">
				옵션:0 수량0개 00원
			</div>
		</div>	
		
		<div id="fundingPayment_div2">
			<div id="fundingPayment_div2_plusdonation">
				추가후원금
			</div>	
			<div id="fundingPayment_div2_shippingfee">
				배송비
			</div>	
		</div>	
		
		<div id="fundingPayment_div3">
			<div id="fundingPayment_div3_coupon">
				쿠폰사용
			</div>	
			<div id="fundingPayment_div3_reserve">
				적립금사용
			</div>	
		</div>	
		
		<div id="fundingPayment_div4">
			<div id="fundingPayment_div4_price">
				펀딩금액
			</div>	
			<div id="fundingPayment_div4_minus">
				포인트차감금액
			</div>	
			<div id="fundingPayment_div4_coupon">
				쿠폰차감금액
			</div>	
			<div id="fundingPayment_div4_plus">
				추가후원금
			</div>	
			<div id="fundingPayment_div4_shippingfee">
				배송비
			</div>	
			<div id="fundingPayment_div4_total">
				최종결제금액
			</div>	
			
		
		</div>	
		
		<div id="fundingPayment_div5">
			 <div id="fundingPayment_div_div1">
			 	<h1>펀딩서포터</h1>
			 	이름 : ${loginMember.name}
			 	<br />
			 	이메일 :${loginMember.email}
			 	<br />
			 	휴대폰번호 : ${loginMember.phone}
			 
			 </div>
		
			 <div id="fundingPayment_div_div2">
				<h1>리워드배송지</h1>
				
			    <!--회원에 기존주소지가 있고 기존주소지를 눌렀을때 -->
			    <input type="checkbox" name="hobby" id="hobby-game" value="기존주소지" />
			    
			    <!--새로입력을 눌렀을때  -->
		        <input type="checkbox" name="hobby" id="hobby-game" value="새로입력" />
		        <br />
		        이름
		         <br />
		        <input type="text" name="fundingPayment_div_div2_name" id="fundingPayment_div_div2_name" placeholder="이름"/>
		        <br />
		        휴대폰번호
		         <br />
		        <input type="text" name="fundingPayment_div_div2_phone" id="fundingPayment_div_div2_phone" placeholder="휴대폰번호"/>
		        <br />
		         <br />
		        주소 <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="find_address()">우편번호 검색</button>
		        <br />
		        <div> <p id="fundingPayment_newaddress"></p></div>
		        <input type="text" name="fundingPayment_div_div2_address" id="fundingPayment_div_div2_address" placeholder="상세주소"/>
		        <br />
	         	<br />
			 
			 	배송시 요청사항(선택)
			 	<br />
		        <input type="text" name="fundingPayment_div_div2_request" id="fundingPayment_div_div2_request" placeholder="ex) 부재시 경비실에 보관해주세요"/>
			 </div>
		</div>	
		
		<div id="fundingPayment_div6">
		
			<h1> 포인트 현황</h1>
			현재 포인트 :00원
			<br />
			차감예정 : 00원
			<br />
			
			예상 잔여포인트 :00원
		
		
		</div>
		
		<div id="fundingPayment_div7">
			<h1>약관동의</h1>
			
			
			<fieldset class="fundingPayment_div6_checkbox">
				<input type="checkbox" name="fundingPayment_div6_input1"
					id="ho_agreement_input1" onclick="chkAll()"/> <label for="ho_agreement_input1">모두
					동의합니다.</label> <br>
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
	
	
	<style>
	
	#funding_payment_top_tap{
	display: flex;
	
	}
	#fuding_payment_title_div{
    margin: auto;
    font-size: 24px;
    font-weight: 900;
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
	}
	
	#fundingPayment_all_wrapper > div{
	 border: 2px solid black;		
	}
	
	
	#go_back{
	 font-size: 17px;
     font-weight: 700;
     cursor: pointer;
	}
	
	#fundingPayment_div1{
   	 height: 130px;
	
	
	}
	
	#fundingPayment_div2{
	 height: 110px;
	
	}
	
	#fundingPayment_div3{
	 height: 110px;
	
	
	}
	
	#fundingPayment_div4{
	 height: 220px;
	
	
	}
	
	#fundingPayment_div5{
	display: flex;
	
	}
	
	/* 펀딩서포터 */
	#fundingPayment_div_div1{
	width: 400px;
	
	}
	
	/* 리워드배송지 */
	#fundingPayment_div_div2{
	width: 400px;
	
	}
	
	
	/* 포인트현황 */
	#fundingPayment_div6{
	height: 220px;
	
	}
	
	/* 약관동의 */
	#fundingPayment_div7{
	height: 220px;
	
	}
	
	
	
	
	
	
	
	/* step 나타는 부분*/
	#funding_purchase_step{
	padding: 30px 0 42px;
    text-align: center;
    height: 126px;
	}
	
	
	#funding_purchase_step ol {
	width: 250px;
    margin: 0 auto;
	}
	
	#funding_purchase_step ol li{
	float: left;
    display: block;
    width: 60px;
	}
	
	#funding_purchase_step ol li em{
	display: table-cell;
    vertical-align: middle;
    width: 58px;
    height: 58px;
    font-size: 12px;
    line-height: 16px;
    background: #fff;
    border: 1px dashed #979797;
    border-radius: 50%;
	}
	
	
	#funding_purchase_step ol li.active em{
	width: 60px;
    height: 60px;
    color: #fff;
    border: none;
    background: #00c4c4;
	}
	
	#payment_submit_div{
	text-align: center;
	}
	
	#fundingPayment_div6_checkbox_submit{
	width: 162px;
    height: 60px;
    margin-top: 20px;
	}
	
	
	</style>
	
	
	<script>

	$("#go_back").click(function() {
		location.href="${pageContext.request.contextPath}/funding/fundingReward?fundingNo=${funding.fundingNo}";
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

	                // 커서를 상세주소 필드로 이동한다.
              /*   document.getElementById("sample6_detailAddress").focus(); */
            }
        }).open();
    };
	
</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	

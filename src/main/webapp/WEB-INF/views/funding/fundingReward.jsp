<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_reward" name="title"/>
</jsp:include>


<script> 
$(() => {
	$('#funding_reward_modal').modal("show");
}); 
</script> 



	<div id="funding_reward_top_tap">
	<ion-icon name="chevron-back-outline" size="large" style="margin:1vw 1.25vw;"></ion-icon>
	<span id="go_back">스토리로돌아가기</span>
			<div id="fuding_reward_title_div">${funding.title}</div>
			
	</div>
		
	<div id="funding_purchase_step">
          <ol>
          <!-- 기원 작업 공통  css입니다 -->
            <li class="active" style="margin-top: -2.1vw;"><em>리워드<br />선택</em></li>
         	<hr  style="border-style: dashed; margin-bottom: 1px;"/>
            <li  style="margin-top: -2.3vw; display: block;"><em>결제 예약</em></li>
          </ol>
     </div>
		
	<div id="funding_reward_wrapper">
		<div id="funding_reward_step">
			<span id="step_span1">리워드 선택결제 </span><span id="step_span2">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</span>
			<br />
		</div>
		
		<form:form id="fundingRewardForm" name="fundingRewardForm" action="${pageContext.request.contextPath}/funding/fundingPayment" method="POST">
			<input type="hidden" name="fundingNo" value="${funding.fundingNo}"/>
			<div id="funding_reward_option">
			
				 <c:forEach var="reward" items="${reward}">
				 	 <div class="reward_select_div_wrapper" data-price="${reward.price}" id="rewardNo${reward.rewardNo}">
				 		<div class="custom-control custom-checkbox">
				 			<input type="checkbox" id="rewardNoCheckBox${reward.rewardNo}" class="custom-control-input" value="${reward.rewardNo}" data-amount="1">
				 			<label class="custom-control-label" for="customCheck1"></label>
				 		</div>
				 		<div class="funding_reward_option_content_div">
				 			 <fmt:formatDate var="shippingDate" value="${reward.shippingDate}" type="DATE" pattern="yyyy년 MM월 초 (1~10일) 예정"/>
				 			 
						 	<h3 id="funding_reward_content_price"><fmt:formatNumber value="${reward.price}" pattern="#,###" />원 펀딩합니다</h3>
				           	<p id="funding_reward_content_title">${reward.title}(${reward.limitAmount}개 남음)</p>
				           	<p id="funding_reward_content_content">${reward.content} 혜택</p>
				           	<p id="funding_reward_content_shipping_date">배송비 <fmt:formatNumber value="${reward.shippingPrice}" pattern="#,###" /> | 리워드 발송 시작일 : ${shippingDate} 예정</p>
			           	</div>
		           	</div>
		           		<div class="rewardCount_div">
			           	   <fieldset class="rewardCount">
				                <legend class="rewardCountLegend">수량선택</legend>
				                <button class="decreaseButton">-</button>
				                <input name="choiceRewardCount" type="text" value="1" data-countprice="${reward.price}" data-limit="${reward.limitAmount}" class="countReward">
				                <button class="increaseButton">+</button>
			            	</fieldset>
		            	</div>
		            	
		            	<!-- 보내기위함 -->
	           	 </c:forEach>
			</div>
			
			<div id="funding_reward_support_div">
				<span class ="funding_reward_name_span">후원금 더하기(선택)</span> 
				<div>
					<span id="support_content_span">후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</span>
					<input type="number" id="reward_support_textarea" name="support" placeholder="0"/><span id="support_content_content_span">원을 추가로 후원합니다.</span>
				</div>
			</div>
			
			<div id="funding_reward_bottom_div">
				<input type="hidden" id="rewardTotalPriceInput" name="rewardTotalPrice" value="0"/><!-- 토탈 전달해줄 input -->
				<input type="hidden" id="rewardTotalPriceInputSupport" name="rewardTotalPriceSupport" value="0"/><!-- 토탈 전달해줄 input -->
				${funding.title}에  <label for="rewardTotalPriceInput" id="funding_reward_choice">0</label>
									<label for="rewardTotalPriceInputSupport" id="funding_reward_choice_support"></label> 원을 펀딩합니다.
				<br />
				<input id="nextButtonReward" type="submit" value="다음단계로" class="btn btn-info"></input>
			</div>
		</form:form>
	</div>
	<script>

		$("#fundingRewardForm").submit(function(e){
			$(this).find("input[type=checkbox]:checked").each(function(){
				console.log("리워드 넘버 = "+$(this).val()+" 수량 = "+$(this).data("amount"));
				
				var field = $('<input>');
				field.attr("type", "hidden");
		        field.attr("name", "rewardNo");
		        field.attr("value", $(this).val());
		        $(this).append(field);

		        var field = $('<input>');
				field.attr("type", "hidden");
		        field.attr("name", "amount");
		        field.attr("value", $(this).data("amount"));
		        $(this).append(field);
			});
		});
		
	</script>



	<!-- 리워드 모달부분  -->
<!--     <div id="funding_reward_modal" class="modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title"><Strong>잠깐!</Strong> 결제하기가 아닌 펀딩하기인 이유를 확인하고, 펀딩하세요.</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
			
			<div id="funding_reward_check_div" class="form-check form-check-inline">
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check1" id="reward_check1" value="1">
					<label class="form-check-label" for="reward_check1" id="reward_check1_label1">펀딩한 리워드는 새롭게 준비하고 있는 제품・서비스입니다.</label>&nbsp;
				</div>
			        <p>펀딩 후, 리워드를 제작・준비하는 크라우드펀딩 특성상, 품질 이슈가 발생할 수 있습니다.
					리워드 품질 이슈 발생 시 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check2" id="reward_check2" value="2">
					<label class="form-check-label" for="reward_check2" id="reward_check1_label2">바로 결제되지 않으며, 펀딩 종료 후에는 결제를 취소할 수 없습니다.</label>&nbsp;
				</div>
					<p>펀딩이 종료되고 목표 금액이 달성될 경우 2021.06.07에 결제가 진행됩니다.
					펀딩 종료 2021.06.04 이후에는 메이커의 프로젝트 수행을 위해 결제 취소가 불가합니다.</p>
			
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check3" id="reward_check3" value="3">
					<label class="form-check-label" for="reward_check3" id="reward_check1_label3">펀딩한 리워드는 즉시 배송되지 않습니다.</label>&nbsp;
				</div>
					<p> 메이커가 약속한 리워드 발송 시작일을 확인했나요? 메이커는 펀딩이 성공해야 리워드 제작・준비를 진행합니다.
					리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있으니, 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-info" id="button_modal_footer">계속해서 펀딩하기</button>
	      </div>
	    </div>
	  </div>
	</div> -->
	
	
	<style>
	/*공통작업 css 추가하였습니다.(기원)*/
	#funding_reward_top_tap{
   	display: flex;
   	background-color: #A29584;
   	height:70px;
   	color: #ffffff;
	}

	
	#fuding_reward_title_div{
    margin: auto;
    font-size: 22px;
    font-weight: 500;
	
	}
	/*공통작업 css 추가하였습니다.(기원)*/
	#go_back{
	    font-size: 19px;
    font-weight: 500;
    cursor: pointer;
    margin-top: 1vw;
    padding-left: 0.5vw;
	}
	
	
	
	.form-check-input{
    border: 1px solid rgba(0,0,0,.15);
    background-color: #fff;
    cursor: pointer;
    border-radius: 50%;
	}
	
	#funding_reward_check_div {
	/* 기존의 bootstrap 설정변경을 위함 */
	display:block; 
	
	}
	
	#funding_reward_wrapper{
	margin: auto;
    width: 800px;
    font-weight: bold;
    padding-top: 1vw;
	}


	/* step 나타는 부분*/
	#funding_purchase_step{
	padding: 30px 0 42px;
    text-align: center;
    height: 126px;
	}
	
	
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
	
	#funding_reward_option{
	height: 500px;
    display: unset;
	
	}
	
	
	#funding_reward_support_div{
	height: 119px;
	display: flex;
	margin-top: 87px;
	
	}
	
	#funding_reward_name_div{
	height: 119px;
	
	}
	
	#funding_reward_bottom_div{
	height: 119px;
	text-align: center;
	}
	
	.funding_reward_check_div_class{
	display: flex;
	border: 1px solid #f0f2f5;
	
	}
	
	
	#funding_reward_name_div{
	display: flex;
	}
	
	.funding_reward_name_span{
	
	width: 360px;
	}
	
	#funding_reward_modal{
	padding-top: 93px;
	
	}
	.modal-title{
	margin-bottom: 0;
    line-height: 1.5;
    font-size: 28px;
    font-weight: 400;
    margin-left: 16px;
	}
	.modal-body{
	font-family: Roboto,Noto Sans KR,-apple-system,Dotum,sans-serif;
    font-weight: 400;
	}
	
	
	.form-check-label{
	font-size: 17px;
	font-weight: 600;
	
	}
	#funding_reward_check_div > p{
    line-height: 1.70;
    letter-spacing: -.4px;
    font-weight: 400;
	}
	
	#button_modal_footer{
	width: 100%;
    height: 61px;
	}
	
	#funding_reward_check_div > p{
	margin-top:18px;
    width: 92%;
    margin-top: 18px;
    margin-left: 27px;
    font-weight: 600;
	
	}
	
	.form-check-inline .form-check-input{
	position: static;
    margin-top: 7px;
    margin-right: .3125rem;
    margin-left: 10px;
	
	}
	
	
	
	.reward_select_div_wrapper{
	display: flex;
	font-size: 16px;
	padding-top: 31px;
	padding-bottom: 31px;
    padding-left: 41px;
    cursor: pointer;
    background-color: #f9f9f9;
    margin-top: 12px;
	}
	
	.custom-control custom-checkbox{
    margin-top: 10px;
    margin-right: 31px;
	}
	
	.rewardCount_div{
    padding-left: 94px;
    padding-bottom: 26px;
    display: none;
	}
	.rewardCount{
	font-size:12px;
	}
	.rewardCountLegend{
	font-size:12px;
	
	}
	
	.funding_reward_option_content_div{
    padding-left: 31px;
	}
	
	.funding_reward_option_content_div > p{
	font-size:16px;
    display: table-header-group;
	}
	
	
	.custom-checkbox .custom-control-input:checked~.custom-control-label::after {
    background-color: #00c4c4;
	}	
	
	.countReward{
	width:41px;
    text-align: center;
	}
	
	#funding_reward_content_price{
	font-size: 18px;
    font-weight: 700;
    margin-bottom: 13px;
	
	}
	#funding_reward_content_title{
	font-size: 14px;
	}
	#funding_reward_content_content{
	font-size: 12px;
	color: #686868;
	
	}
	#funding_reward_content_shipping_date{
	font-size: 12px;
	}
	
	#reward_support_textarea{
	order: 1px solid rgba(0,0,0,.15);
    text-align: right;
    height: 40px;
    padding-right: 13px;
    margin-top: 10px;
	}
	#reward_support_textarea::-webkit-outer-spin-button,
	#reward_support_textarea::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
	}


	#step_span1{
	font-size :18px;
	}
	#step_span2{
	font-size :14px;
	color: #4a4a4a;
	
	}
	#support_content_span{
	color: #4a4a4a;
	font-size : 14px;
	}
	#support_content_content_span{
	color: #4a4a4a;
	font-size : 14px;
	margin-left: 10px;
	}
	
	#funding_reward_choice, #funding_reward_choice_support{
	text-decoration: underline;
    color: #00c4c4;
	}
	
	#nextButtonReward{
    height: 49px;
    width: 141px;
    margin-top: 10px;
	
	}
	/*기원 버튼 수정하였습니다.*/
	.decreaseButton{
	 border: 0;
	 outline:0;
	 font-size: 15px;
	 color: #65696B;
	 background-color:#00c4c433;
	}
	/*outline-color 추가 하였습니다 기원 */
	button:focus{
	 outline: 5px auto -webkit-focus-ring-color;
    outline-color: #00c4c433;
	}
	.increaseButton{
	 border: 0;
	 outline:0;
	 font-size: 15px;
	 color: #65696B;
	 background-color:#00c4c433;
	}


	
	</style>
	
	<script>

	/*이전페이지에서 리워드를 바로 클릭했을 시 상황을 위함*/
	window.onload = function(){
		/*get으로 넘어온 choice값*/
		var choice = ${choice};
		
		if(choice != null){
		$("#rewardNo" + choice).trigger("click");
		}
		
	}
	
	
	
	$("#go_back").click(function() {
		location.href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}";
		});

	/*체크되어야 모달hide*/
	$( '#button_modal_footer' ).click( function() {
		if($('#reward_check1').is(":checked") && $('#reward_check2').is(":checked") && $('#reward_check3').is(":checked")){
				$('#funding_reward_modal').modal("hide")
			}
	});

	$("#reward_check1_label1 ,#reward_check1_label2, #reward_check1_label3").css("color","#babdc0")
	
	/*모달 각각 체크되면 색상변경*/
 	$("#reward_check1,#reward_check2, #reward_check3").on('click', function() {
 	 	
 	 	 if ($(this).prop('checked')) {
		 	 	  	//$(this).parent().css("color","black")
		 	 	  	$(this).next().css("color","black")
 		} else{
	 		$(this).next().css("color","#babdc0")
		} 
	});


	//후원금 더하기 text area에 들어갈시
	$("#reward_support_textarea").change(function(){
		var textarea = $("#reward_support_textarea").val();

		//숫자인지 체크
		if($.isNumeric(textarea)){
			//숫자면	
			var price = Number(textarea);
				
			$("#funding_reward_choice_support").text("(+"+price+")");
			$("#rewardTotalPriceInputSupport").val(price);/*input:hidden에 넣어줌  */
			
		}else{
			$("#reward_support_textarea").val(0);
			$("#funding_reward_choice_support").text('');
			$("#rewardTotalPriceInputSupport").val(0);
			alert("숫자만 입력해주세요");
			$("#reward_support_textarea").focus();
			return;
			}
		});

	$('.reward_select_div_wrapper').hover(function(){
		$(this).css("border-top","1px solid #00c4c4");
		$(this).children().children("h3").css("color","#00c4c4");
	}, function(){
        $(this).css('border','1px solid #E7F9F9');
        $(this).children().children("h3").css("color","black");
    });


	//수량선택 + - 
	$(function(){
	
		/*마이너스버튼 클릭시*/
		$('.decreaseButton').click(function(e){
			e.preventDefault();
			
			var start = $(e.target).next().val();
			start--;
			var $chkBox = $(e.target).parent().parent().prev().find("input[type=checkbox]");
			
			
			/*총 가격 계산*/
			if(start>0){
			/*클릭시 가격*/
			var price = Number($(this).next().data("countprice"));
			/*현재 총가격*/
			var total = Number($("#funding_reward_choice").text());
			/*가격더해주기*/
			var minus = Number((total-price));
			/*최종결과*/
			$("#funding_reward_choice").text(minus);
			$("#rewardTotalPriceInput").val(minus);/*input:hidden에 넣어줌  */
			}
			
			if(start<=0){
				alert('더이상 줄일수 없습니다.');
				start =1;
				}
			
			$(e.target).next().val(start);
			$chkBox.data("amount",start);
			console.log($chkBox.data("amount"));
		});
		
		/*증가버튼 클릭시*/
		$('.increaseButton').click(function(e){
			e.preventDefault();
			var start = $(e.target).prev().val();
			var limit = Number($(e.target).prev().data("limit"));	
			start++;
			var $chkBox = $(e.target).parent().parent().prev().find("input[type=checkbox]");
			
			/*총 가격 계산*/
			if(start<=limit){
			/*클릭시 가격*/
			var price = Number($(this).prev().data("countprice"));
			/*현재 총가격*/
			var total = Number($("#funding_reward_choice").text());
			/*가격더해주기*/
			var plus = Number((total+price));
			/*최종결과*/
			$("#funding_reward_choice").text(plus);
			$("#rewardTotalPriceInput").val(plus);/*input:hidden에 넣어줌  */
			}
		
			if(start>limit){
				alert('더이상 늘릴수 없습니다.');
				start=limit;
			}
			$(e.target).prev().val(start);
			$chkBox.data("amount",start);
			console.log($chkBox.data("amount"));
		});

		
	    //reward div클릭할시(선택)
		$('.reward_select_div_wrapper').on("click", function(){
			if($(this).children().children("input").is(":checked") == false){
				$(this).children().children("input").attr("checked", true);
				$(this).css("background-color","#E7F9F9")
				$(this).css("border","1px solid #E7F9F9")
				$(this).next().css("background-color","#E7F9F9")
				$(this).next().css("border","1px solid #E7F9F9")
				$(this).next().css("display","block")
				
				/*총 가격 계산*/
				/*클릭시 가격*/
				var price = Number($(this).data("price"));
				/*현재 총가격*/
				var total = Number($("#funding_reward_choice").text());
				/*가격더해주기*/
				var plus = Number((total+price));
				/*최종결과*/
				$("#funding_reward_choice").text(plus);
				$("#rewardTotalPriceInput").val(plus);/*input:hidden에 넣어줌  */
			}
			else{
				$(this).children().children("input").attr("checked", false);
				$(this).css("background-color","#f9f9f9")
				$(this).next().css("background-color","#f9f9f9")
				$(this).next().css("display","none")
				
				/*총 가격 계산*/
				/*클릭시 가격*/
				var price = Number($(this).data("price"));
				/*현재 총가격*/
				var total = Number($("#funding_reward_choice").text());
				/*가격더해주기*/
				var minus = Number((total-price));
				/*최종결과*/
				$("#funding_reward_choice").text(minus);
				$("#rewardTotalPriceInput").val(minus);/*input:hidden에 넣어줌  */
				}
		});
	});
	

</script> 
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	

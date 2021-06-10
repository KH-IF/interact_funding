<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_reward" name="title"/>
</jsp:include>


<script> 
$(() => {
	$('#funding_reward_modal').modal("show");
}); 
</script> 


	<div id="funding_reward_top_tap">
	<span>스토리로돌아가기</span>
			<span>[1억앵콜] 양치 3번으로 치아를 깎지 않고 하얗게 쭉~ 유지하세요!(누른 펀딩 제목들어가야함)</span>
	</div>
		
	<div id="funding_purchase_step">
          <ol>
            <li class="active"><em>리워드<br />선택</em></li>
            <li ><em>결제 예약</em></li>
            <li><em>소문내기</em></li>
          </ol>
     </div>
		
	<div id="funding_reward_wrapper">
		<div id="funding_reward_step">
			<span>리워드 선택결제 </span><span>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</span>
			<br />
		</div>
		
		
		<div id="funding_reward_option">
			리워드 옵션 가격들어가야할 부분(가변적으로 크기변함)
		
		</div>
		
		<div id="funding_reward_support_div">
			<span class ="funding_reward_name_span">후원금 더하기(선택)</span> 
			<div>
				<span>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</span>
				<textarea rows="1" cols="40"></textarea>원을 추가로 후원합니다.
			</div>
		</div>
		
		
		<div id="funding_reward_name_div">
			<span class ="funding_reward_name_span">공개여부</span> 
			<div>
				<div>
					<span>서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히 펀딩하고 싶으시다면, 비공개로 선택해주세요.
							커뮤니티, 새소식 댓글 작성 시에는 비공개 여부와 상관없이 펀딩 참여자 표시가 노출됩니다.</span>
				</div>
				<div>
					<input type="checkbox" name="reward_nameon_checkbox" id="reward_nameon_checkbox" value="1">
					<label for="reward_nameon_checkbox">이름공개</label>
					
					<input type="checkbox" name="reward_nameoff_checkbox" id="reward_nameoff_checkbox" value="2">
					<label for="reward_nameoff_checkbox">이름비공개</label>
				</div>
			
			</div>
			
		</div>
		
		<div id="funding_reward_bottom_div">
			ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ(제목) 에  ㅁㅁㅁㅁㅁ(선택한리워드가격) 원을 펀딩합니다.
			<br />
			<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/funding/fundingPayment';">다음단계로</button>
		</div>
	</div>
	






	<!-- 리워드 모달부분  -->
    <div id="funding_reward_modal" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">잠깐! 결제하기가 아닌 펀딩하기인 이유를 확인하고, 펀딩하세요.</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
			
			<div id="funding_reward_check_div" class="form-check form-check-inline">
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check1" id="reward_check1" value="1">
					<label class="form-check-label" for="reward_check1" id="reward_check1_label">펀딩한 리워드는 새롭게 준비하고 있는 제품・서비스입니다.</label>&nbsp;
				</div>
			        <p>펀딩 후, 리워드를 제작・준비하는 크라우드펀딩 특성상, 품질 이슈가 발생할 수 있습니다.
					리워드 품질 이슈 발생 시 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check2" id="reward_check2" value="2">
					<label class="form-check-label" for="reward_check2">바로 결제되지 않으며, 펀딩 종료 후에는 결제를 취소할 수 없습니다.</label>&nbsp;
				</div>
					<p>펀딩이 종료되고 목표 금액이 달성될 경우 2021.06.07에 결제가 진행됩니다.
					펀딩 종료 2021.06.04 이후에는 메이커의 프로젝트 수행을 위해 결제 취소가 불가합니다.</p>
			
				<div class="funding_reward_check_div_class">
					<input type="checkbox" class="form-check-input" name="reward_check3" id="reward_check3" value="3">
					<label class="form-check-label" for="reward_check3">펀딩한 리워드는 즉시 배송되지 않습니다.</label>&nbsp;
				</div>
					<p> 메이커가 약속한 리워드 발송 시작일을 확인했나요? 메이커는 펀딩이 성공해야 리워드 제작・준비를 진행합니다.
					리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있으니, 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="button_modal_footer">계속해서 펀딩하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<style>
	
	
	
	
	
	
	div, span{
	
	border: 2px solid black;
	
	
	}
	
	
	#funding_reward_check_div {
	
	/* 기존의 bootstrap 설정변경을 위함 */
	display:block; 
	
	}
	
	#funding_reward_wrapper{
	margin: auto;
    width: 800px;
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
	
	#funding_reward_option{
	height: 500px;
	
	}
	
	
	#funding_reward_support_div{
	height: 119px;
	
	}
	
	#funding_reward_name_div{
	height: 119px;
	
	}
	
	#funding_reward_bottom_div{
	height: 119px;
	
	}
	
	.funding_reward_check_div_class{
	display: flex;
	
	}
	
	#funding_reward_support_div{
	display: flex;
	
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
	</style>
	
	<script>

	/*체크되어야 모달hide*/
	$( '#button_modal_footer' ).click( function() {
		if($('#reward_check1').is(":checked") && $('#reward_check2').is(":checked") && $('#reward_check3').is(":checked")){
				$('#funding_reward_modal').modal("hide")
			}
	});


	
	/*모달 각각 체크되면 색상변경*/
 	$("#reward_check1,#reward_check2, #reward_check3").on('click', function() {
 	 	
 	 	 if ($(this).prop('checked')) {
		 	 	  	$(this).parent().css("background-color","red")
 		} else{
	 		$(this).parent().css("background-color","white")
		} 
	});

	</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	

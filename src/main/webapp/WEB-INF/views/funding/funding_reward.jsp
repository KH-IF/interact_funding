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
			[1억앵콜] 양치 3번으로 치아를 깎지 않고 하얗게 쭉~ 유지하세요!(누른 펀딩 제목들어가야함)
	</div>
		
		
		
	<div id="funding_reward_wrapper">
		<div id="funding_reward_step">
		리워드 선택결제 예약소문내기
		</div>
		
		<p>리워드 선택 펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
		
		<div id="funding_reward_option">
		리워드 옵션 가격들어가야할 부분
		
		</div>
		
		<div>
			<span>후원금 더하기</span> <span>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</span>
			<br />
			<textarea rows="1" cols="40"></textarea>원을 추가로 후원합니다.
		</div>
		
		
		<div>
			<span>공개여부</span> <span>서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히 펀딩하고 싶으시다면, 비공개로 선택해주세요.
						커뮤니티, 새소식 댓글 작성 시에는 비공개 여부와 상관없이 펀딩 참여자 표시가 노출됩니다.</span>
			<br />
			<div>
				<input type="checkbox" name="reward_nameon_checkbox" id="reward_nameon_checkbox" value="1">
				<label for="reward_nameon_checkbox">이름공개</label>
				
				<input type="checkbox" name="reward_nameoff_checkbox" id="reward_nameoff_checkbox" value="2">
				<label for="reward_nameoff_checkbox">이름비공개</label>
			</div>
			
			<div>
				ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ(제목) 에  ㅁㅁㅁㅁㅁ(선택한리워드가격) 원을 펀딩합니다.
				<br />
				<button type="button" class="btn btn-secondary" data-dismiss="modal">다음단계로</button>
			</div>
		
		</div>
	</div>
	










	<!-- 리워드 모달부분  -->
    <div id="funding_reward_modal" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">잠깐! 결제하기가 아닌 펀딩하기인 이유를 확인하고, 펀딩하세요.</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
			
			<div id="funding_reward_check_div" class="form-check form-check-inline">
			<input type="checkbox" class="form-check-input" name="reward_check1" id="reward_check1" value="1"><label class="form-check-label" for="reward_check1">펀딩한 리워드는 새롭게 준비하고 있는 제품・서비스입니다.</label>&nbsp;
	        <p>펀딩 후, 리워드를 제작・준비하는 크라우드펀딩 특성상, 품질 이슈가 발생할 수 있습니다.
			리워드 품질 이슈 발생 시 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			
			<input type="checkbox" class="form-check-input" name="reward_check2" id="reward_check2" value="2"><label class="form-check-label" for="reward_check2">바로 결제되지 않으며, 펀딩 종료 후에는 결제를 취소할 수 없습니다.</label>&nbsp;
			<p>펀딩이 종료되고 목표 금액이 달성될 경우 2021.06.07에 결제가 진행됩니다.
			펀딩 종료 2021.06.04 이후에는 메이커의 프로젝트 수행을 위해 결제 취소가 불가합니다.</p>
			
			<input type="checkbox" class="form-check-input" name="reward_check3" id="reward_check3" value="3"><label class="form-check-label" for="reward_check3">펀딩한 리워드는 즉시 배송되지 않습니다.</label>&nbsp;
			<p> 메이커가 약속한 리워드 발송 시작일을 확인했나요? 메이커는 펀딩이 성공해야 리워드 제작・준비를 진행합니다.
			리워드 펀딩 특성상 발송이 지연되거나 불가할 수 있으니, 반환·정책 - 상세 정책을 꼭 확인해주세요.</p>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">계속해서 펀딩하기</button>
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
	width: 1000px;
	}

	
	</style>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>	
	

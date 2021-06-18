<%@page import="com.kh.interactFunding.funding.model.vo.FundingExt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/makerNav.jsp" flush="false">
    <jsp:param value="IF Maker Studio" name="title"/>
</jsp:include>
<style>
/* 모달 배경화면 투명도  */
.modal-backdrop
{
    opacity:0.5 !important;
}

/* 내부 scroll */
/* Important part */
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 80vh;
    overflow-y: auto;
}
</style>

<%

	FundingExt funding = (FundingExt)session.getAttribute("funding");

%>

<!-- Modal 처리 -->
    <div id="makerGuide" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <p class="font-weight-bold pt-1"> 펀딩 서비스 요금제 변경 안내</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <hr>
            <div class="modal-body" data-spy="scroll"  style="height: 500px;">
                안녕하세요. 와디즈입니다.<br><br>
                와디즈는 메이커님들의 수수료 부담을 최소화하고, 
                보다 성공적인 펀딩을 위한 다양한 부가 서비스를 자유롭게 선택하실 수 있도록
                 펀딩 서비스를 개편했습니다.<br><br>
                 이에 요금제도 개편 예정 (2021년 5월 3일 9시 경 제출 건 부터 적용) 이오니, 
                 자세한 사항은 아래 내용을 참고해 주시길 바랍니다.<br><br>
                 1. 현재 9.4%인 기본 수수료(중개 수수료 7%, PG 수수료 2.4%)를 9%로 소폭 낮추었습니다.<br>
                 메이커님들의 수수료 부담이 조금이라도 덜어지길 바랍니다.<br><br>
                 2. 단일로 제공되던 요금제 유형을 네 가지로 세분화하여 메이커님들의 선택의 폭을 대폭 확대했습니다.<br>
                 모든 요금제는 PG사 결제 대행 수수료를 포함하고 있으며, 제공되는 서비스에 따라 수수료율이 부과되는 방식입니다.<br><br>
                 <h3>1) Light 요금제</h3>
                 <p>Light는 중개 서비스에 PG 수수료를 포함한 요금제입니다. (기존 9.4% → 9.0%)<br>
                    Light 요금제는 
                    <span class="FundingInfoModal_strong__Qr7rx">펀딩 오픈</span>
                    과 메이커가 프로젝트를 진행하고 성공시키는데 도움이 되는 
                    <span class="FundingInfoModal_strong__Qr7rx">
                        와디즈 스쿨 수강, 데이터 플러스, 새소식 알림 서비스, 펀딩 인증마크, 제휴 서비스
                    </span>를 제공합니다.</p><br>
                    <h3>2) Basic 요금제</h3>
                    <p>Basic 요금제는 Light 요금제가 제공하는 모든 서비스를 포함하며 
                        <span class="FundingInfoModal_strong__Qr7rx">추가적으로&nbsp;
                            <a class="FundingInfoModal_underline__lZfZS" href="https://help.wadiz.kr/ko/articles/1540148">
                                오픈예정 서비스</a>를 제공</span>합니다. 
                                (기존 12.4% → 12.0%)</p><br>
                                <h3>3) Pro 요금제</h3>
                                <p>Pro 요금제는 Basic 요금제가 제공하는 모든 서비스를 포함하며 
                                    <span class="FundingInfoModal_strong__Qr7rx">추가적으로&nbsp;
                                        <a class="FundingInfoModal_underline__lZfZS" href="https://www.wadiz.kr/link/spacewadiz_info">
                                            공간와디즈 쇼룸</a>을 제공</span>합니다. (14%, 신설 요금제)</p><br>
                                            <h3>4) Expert 요금제</h3>
                                            <p>Expert 요금제는 Pro 요금제가 제공하는 모든 서비스를 포함하며 추가적으로 광고 대행 서비스, PD 컨설팅, 에디터 피드백을 제공합니다. (별도 협의, 신설 요금제)</p><br>
                                            3. 적용 일자<br>2021년 5월 3일 09시 이후, 메이커 스튜디오 [제출하기]를 클릭한 건부터 적용<br><br>
                                            * 상기 수수료에는 VAT가 포함되어 있지 않습니다.<br><br>
                                            각 서비스에 대한 자세한 안내사항은&nbsp;<a class="FundingInfoModal_link__GsFYL" href="https://www.wadiz.kr/link/funding_plan_newsBoard_202104">공지사항</a>
                                            을 참고해주시기 바랍니다.<br>
                                            펀딩 수수료 관련 문의사항은 info@wadiz.kr 로 문의주시면 답변드리겠습니다.
                                            <br><br>고맙습니다.<br>와디즈 드림<br><br>
            </div>
            <div class="modal-footer d-flex justify-content-between">
                <div>
                    <input name="modal-today-close" type="checkbox" id="noSeeWeek">
                    <label class="text-muted" for="noSeeWeek">일주일 보지 않기</label>
                </div>
                <button id="close" type="button" class="border-0 text-info" data-dismiss="modal">닫기</button>
            </div>
        </div>
        </div>
    </div>

        <div class="container p-5">
            <h1 class="font-weight-bold"> 펀딩 준비</h1>
            <p class="lead">본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 필수항목을 작성하세요.</p>
            <!-- 가이드 링크 -->
            <a href="">
                <div class="p-3 mb-2 bg-info text-white rounded">리워드 펀딩을 준비하는 메이커님을 위한 <h3>필수 가이드</h3></div>
            </a>

            <div class="border border-secondary">
                프로젝트 준비 상태
                <p class="text-right">
                    지금 나의 단계는?
                </p> 
                <p>

                    펀딩 준비 작성 중
                    필수 항목을 모두 작성 후 저장하기 버튼을 클릭해주세요. 작성 중 > 작성 완료 상태로 변경되어야 최종 제출이 가능합니다.
                </p>
            </div>
            <br>
            
            <div class="border rounded p-3 ">
                <br>
                <p class="h3 d-inline"> 요금제 선택 </p> &nbsp;&nbsp; 
                <!-- 작성 완료하면 작성 완료로 변경 -->
                <span id="chargeWrite" class="d-inline">작성 전</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('2Charge')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>

            <div class="border rounded p-3">
                <br>
                <p class="h3 d-inline">기본 정보</p> &nbsp;&nbsp; 
                <span id="InfoWrite" class="d-inline">작성 전</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('3BasicInfo')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>

            <div class="border rounded p-3">
                <br>
                <p class="h3 d-inline">스토리 작성</p> &nbsp;&nbsp; 
                <span id="storyWrite" class="d-inline">작성 전</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('4Story')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>
            
            <div class="border rounded p-3">
                <br>
                <p class="h3 d-inline">리워드 설계</p> &nbsp;&nbsp; 
                <span id="rewardWrite" class="d-inline">작성 전</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('5Reward')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>

			 <div class="border rounded p-3">
                <br>
                <p class="h3 d-inline">관리</p> &nbsp;&nbsp; 
                <span  class="d-inline">작성 전</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('6Reward')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>

			<button id="checkSMSPhone" class="btn btn-primary btn-lg" role="button" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/funding/checkSMS';">제출하기</button>
			<br />
			<!-- 최종 제출했을 시 펀딩 삭제가 불가능하다. -->
			<c:if test="${funding.status != 'Y'}">
			<form id="fundingDeleteFrm" method="POST" action="${pageContext.request.contextPath}/funding/deleteFunding">
				<input type="hidden" name="fundingNo">
				<button type="button" id="deleteFunding" class="btn btn-primary btn-lg" style="width: 200px;" onclick="deletefunding()">펀딩 삭제하기</button>
			</form>
			</c:if>
			
        </div>
        </section>
<script>
	//펀딩 삭제하기 버튼 
	function deletefunding(){

		const fundingNo = ${funding.fundingNo};
	
		if(confirm("프로젝트"+fundingNo+"번 펀딩을 삭제하시겠습니까?")){
			const $frm = $('#fundingDeleteFrm');
			$frm.find("[name = fundingNo]").val(fundingNo);
			$frm.submit();
			
		
		}

	}


	//일주일 동안 보지 않기 setCookie 메소드를 통해 쿠키 이름과 expires(유효시간)을 쿠키에 저장시킨다. 
	function setCookie(name, value, expiredays){
		var today = new Date();
	
		console.log(today.getDate())
	
		today.setDate(today.getDate() + expiredays); // 현재시간에 일주일를 더함 
	
		document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
	
	}
		
	function getCookie(name) {
	
		var cookie = document.cookie;
		
		if (document.cookie != "") {
			var cookie_array = cookie.split("; ");
			console.log(cookie_array)
			for ( var index in cookie_array) {
				var cookie_name = cookie_array[index].split("=");
				if (cookie_name[0] == "mycookie") {
					return cookie_name[1];
				}
			}
		}
		return;
	}

	$('#close').click(function() {
		console.log("click");
		if($("input[name='modal-today-close']").is(":checked")){
			$("#makerGuide").modal("hide");
			setCookie("mycookie", 'popupEnd', 7);
		}
	})

	
	
	
	
    //팝업 페이지
    $(document).ready(function(){
    	var checkCookie = getCookie("mycookie");
		
    	if(checkCookie == 'popupEnd') {
    		$("#makerGuide").modal("hide");
    	} else {
    		$('#makerGuide').modal("show");	
    	}
    }); 

    //클릭시 페이지 이동
    function makerMovePage(pagename){
        location.href=`${pageContext.request.contextPath}/funding/ready\${pagename}`;
    };
</script>


</body>
</html>
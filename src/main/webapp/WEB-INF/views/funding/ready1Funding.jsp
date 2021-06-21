<%@page import="com.kh.interactFunding.funding.model.vo.FundingExt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

div.leftB{
	border: 1px solid;
	border-left: 20px solid blue;
}

</style>



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
    
            <div class="leftB rounded p-3 ">
                <br>
                <p class="h3 d-inline"> 요금제 선택 </p> &nbsp;&nbsp; 
                <!-- 작성 완료하면 작성 완료로 변경 -->
                <c:if test="${writeMap.ratePlanCode == 'OK'}" >
                	<span class="d-inline">작성완료</span> 
                </c:if>
                <c:if test="${writeMap.ratePlanCode != 'OK'}" >
                	<span class="d-inline">작성 중</span> 
                </c:if>
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
                <c:if test="${writeMap.basicInfo == 'OK'}" >
                	<span class="d-inline">작성완료</span> 
                </c:if>
                <c:if test="${writeMap.basicInfo != 'OK'}" >
                	<span class="d-inline">작성 중</span> 
                </c:if>
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
               	<c:if test="${writeMap.story == 'OK'}" >
                	<span class="d-inline">작성완료</span> 
                </c:if>
                <c:if test="${writeMap.story != 'OK'}" >
                	<span class="d-inline">작성 중</span> 
                </c:if> 
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
                <c:if test="${writeMap.reward == 'OK'}" >
                	<span class="d-inline">작성완료</span> 
                </c:if>
                <c:if test="${writeMap.reward != 'OK'}" >
                	<span class="d-inline">작성 중</span> 
                </c:if>
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('5Reward')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>

			 <!-- 차후 추가여부 결정 -->
			 <div class="border rounded p-3">
                <br>
                <p class="h3 d-inline">관리</p> &nbsp;&nbsp; 
                <span  class="d-inline">작성 중</span> 
                <button type="button" class=" btn btn-outline-secondary btn-lg float-right" onclick="makerMovePage('6Reward')">
                    작성하기
                </button>
                <br>
                <br>
            </div>
            <br>
			
			<!-- 최종 제출했을 시 펀딩 삭제가 불가능하다. -->
			<!-- 최종 제출이 안되었을 때 전화번호 인증안했을 때 -->
			<c:if test="${funding.status != true && loginMember.phone == null}">
				<div class="d-flex flex-row  pb-5">
					<button id="checkSMSPhone" class="btn btn-primary btn-lg " role="button" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/funding/checkSMS';" >제출하기</button>
					<br />
				</div>
				<form id="fundingDeleteFrm" method="POST" action="${pageContext.request.contextPath}/funding/deleteFunding">
					<input type="hidden" name="fundingNo">
					<button type="button" id="deleteFunding" class="btn btn-outline-danger btn-lg " style="width: 200px;" onclick="deletefunding()">펀딩 삭제하기</button>
				</form>
			</c:if>
			
			<!-- 최종 제출이 안되었을 때 전화번호는 인증한 상태  -->
			<c:if test="${funding.status != true && loginMember.phone != null}">
				<div class="d-flex flex-row  pb-4">
					<button name="disabledFT" id="checkSMSPhone" class="btn btn-primary btn-lg mr-4 " role="button" style="width: 200px;" onclick="finalSubmit()" >제출하기</button>
					<button name="disabledFT" id="REcheckSMSPhone" class="btn btn-primary btn-lg" role="button" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/funding/checkSMS';" >번호인증 다시하기</button>
					<p class="text-muted">(사용자 전화번호가 변경되고 제출됩니다.)</p>
					<br />
				</div>
					<form id="fundingDeleteFrm" method="POST" action="${pageContext.request.contextPath}/funding/deleteFunding">
						<input type="hidden" name="fundingNo">
						<button type="button" id="deleteFunding" class="btn btn-outline-danger btn-lg " style="width: 200px;" onclick="deletefunding()">펀딩 삭제하기</button>
					</form>
			</c:if>
				
			<!-- 최종 제출이 되었을 때 -->
			<c:if test="${funding.status == true}">
				<div class="d-flex flex-row align-items-center">
					<c:if test="${writeMap.ratePlanCode == 'OK' && writeMap.basicInfo == 'OK'&& writeMap.story == 'OK' && writeMap.reward == 'OK'}">
						<button name="disabledFT" id="finalYSubmit" class="btn btn-primary btn-lg mr-4" role="button" style="width: 200px;" onclick="finalYSubmit()" >수정하기</button>			
						<button name="disabledFT" id="REcheckSMSPhone" class="btn btn-primary btn-lg" role="button" style="width: 200px;" onclick="location.href='${pageContext.request.contextPath}/funding/checkSMS';" >번호인증 다시하기</button>	
						<p class="text-muted">(사용자 전화번호가 변경되고 제출됩니다.)</p>
					</c:if>
				<!-- 최종 제출이 되었는데 수정해서 미완성일때  -->
					<c:if test="${writeMap.ratePlanCode != 'OK' || writeMap.basicInfo != 'OK' || writeMap.story != 'OK' || writeMap.reward != 'OK'}">
						<button id="finalNSubmit" class="btn btn-primary btn-lg " role="button" style="width: 200px;" onclick="finalNSubmit()">수정하기</button>
					</c:if>
				</div>
			</c:if>
			
        </div>
        
        <input type="hidden" id="ratePlanCode" value="${writeMap.ratePlanCode}" />
        <input type="hidden" id="basicInfo" value="${writeMap.basicInfo}"/>
        <input type="hidden" id="story"  value="${writeMap.story}"/>
        <input type="hidden" id="reward" value="${writeMap.reward}"/>
        
        </section>
<script>

	$(document).ready(function(){
		const ratePlanCode = $("#ratePlanCode").val();
		const basicInfo = $("#basicInfo").val();
		const story = $("#story").val();
		const reward = $("#reward").val();

		if(ratePlanCode == "OK" && basicInfo == "OK" && story == "OK"  && reward == "OK"){
			$("[name=disabledFT]").attr("disabled",false);
		}else{
			$("[name=disabledFT]").attr("disabled",true);
		}
		
	});

	function finalSubmit(){
		swal({
			  title: "최종제출하면 펀딩 삭제가 불가합니다. 최종제출하겠습니까?",
			  text: "펀딩수정은 가능합니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then(function(){
				$.ajax({
					url:`${pageContext.request.contextPath}/funding/finalSubmit`,
					method: "PUT",
					success(data){
						console.log(data);
						const {msg} = data;
						window.location.href = `${pageContext.request.contextPath}/funding/fundingStart1/\${msg}`;
					},
					error: console.log
					});
		});
	}
	

	function finalYSubmit(){

		$.ajax({
			url:`${pageContext.request.contextPath}/funding/finalYSubmit`,
			method: "GET",
			success(data){
				console.log(data);
				const {msg} = data;
				window.location.href = `${pageContext.request.contextPath}/funding/fundingStart1/\${msg}`;
			},
			error: console.log
			});
	}
	
	function finalNSubmit(){
		swal({
  		  title: "펀딩이 미완성된 상태입니다.",
  		  text: "작성완료에서 작성중인 펀딩으로 바뀝니다.",
  		  icon: "warning",
  		  buttons: true,
  		  dangerMode: true,
  		})
  		.then(function(){
  			$.ajax({
  				url:`${pageContext.request.contextPath}/funding/finalNSubmit`,
  				method: "PUT",
  				success(data){
  					console.log(data);
  					const {msg} = data;
  					window.location.href = `${pageContext.request.contextPath}/funding/fundingStart1/\${msg}`;
  				},
  				error: console.log
  				});
          
  	});
		
		
	}


	//펀딩 삭제하기 버튼 
	function deletefunding(){

		const fundingNo = ${funding.fundingNo};

    	swal({
    		  title: "프로젝트"+fundingNo+"번 펀딩을 삭제하시겠습니까?",
    		  text: "",
    		  icon: "warning",
    		  buttons: true,
    		  dangerMode: true,
    		})
    		.then(function(){
    			const $frm = $('#fundingDeleteFrm');
    			$frm.find("[name = fundingNo]").val(fundingNo);
    			$frm.submit();
            
    	});

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
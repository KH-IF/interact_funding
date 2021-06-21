<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/makerNav.jsp" flush="false">
	<jsp:param value="Story | IF Maker Studio" name="title" />
</jsp:include>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<form name="storyFrm"
	action="${pageContext.request.contextPath}/funding/saveStory"
	method="post">
	<input type="hidden" name="fundingNo" value="${funding.fundingNo}" />
	<div class="container p-5">

		<h1 class="font-weight-bold">스토리 작성</h1>
		<p>메이커님의 프로젝트를 소개해보세요. 스토리에는 메이커님의 진심과 목소리가 잘 녹여질 수 있도록 명확하고,
			솔직하게, 친근한 어투로 작성하세요.</p>

		<!--후에 funding_no로 바꿔줄것 -->
		<%-- <input type="hidden" name="funding_no" value="${funding.funding_no}" /> --%>
		<input type="hidden" name="funding_no" value="17" /> <br>
		<h6>오픈예정 유무 선택</h6>
		<div class="custom-control custom-radio">
			<input type="radio" name="openNowYN" id="direct"
				class="custom-control-input" onchange="setDisplay()" checked> <label
				class="custom-control-label" for="direct">바로등록</label>
		</div>
		<div class="custom-control custom-radio">
			<input type="radio" name="openNowYN" id="scheduled"
				class="custom-control-input" onchange="setDisplay()"> <label
				class="custom-control-label" for="scheduled">오픈예정 등록</label>
		</div>

		<br />

		<div id="showStart_day">
			<h6>프로젝트 시작일</h6>
			<p class="text-muted">프로젝트가 시작될 날짜를 입력해주세요.</p>
			<div class="form-group row">
				<input class="form-control ml-3" type="date"
					value="<%=sf.format(nowTime)%>" name="startDate">
			</div>
		</div>

		<br>

		<div id="showProjectstory">
			<h6>프로젝트 스토리</h6>
			<input type="hidden" name="content" value="" />
			<p class="text-muted">진정성 있고 매력적인 스토리로 서포터분들의 마음을 움직여 볼까요? 스토리 필수
				항목을 누락할 경우 오픈이 지연될 수 있으며, 제3자의 지식 재산권을 침해할 경우 프로젝트가 중단/취소될 수 있으니 유의해
				주세요.</p>
			<div id="projectstory">프로젝트 스토리</div>
		</div>

		<br>
		<div id="showScheduledOpen">
			<h6>오픈예정 스토리</h6>
			<input type="hidden" name="earlyContent" value="" />
			<p class="text-muted">진정성 있고 매력적인 스토리로 서포터분들의 마음을 움직여 볼까요? 스토리 필수
				항목을 누락할 경우 오픈이 지연될 수 있으며, 제3자의 지식 재산권을 침해할 경우 프로젝트가 중단/취소될 수 있으니 유의해
				주세요.</p>
			<div id="scheduledOpen">오픈예정 스토리</div>
		</div>

		<br>
		<button type="submit" onclick="storyFrmSubmit()" class="btn btn-primary btn-lg"
			style="width: 200px;">저장하기</button>
		<!-- <button type="button" onclick="check()" class="btn btn-primary btn-lg" style="width: 200px;">체크</button> -->
	</div>
</form>



</section>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>

    var innerText ='<p>※ 항목별로 미리 기재되어 있는 내용은 메이커님이 필수 항목을 쉽게 작성하실 수 있도록 돕는 가이드 문구이므로, 참고 후 삭제 부탁드립니다.</p><h2>리워드 핵심 포인트 및 소개</h2><p>도입부에 리워드의 매력 포인트와 차별점을 3줄로 정리하여 서포터분들에게 소개해 주세요.</p><p><br></p><p>(예시)</p><ul><li>리워드의 장점은 무엇인가요?</li><li>이프에서만 제공되는 혜택은 무엇인가요?</li><li>어떤 서포터분들을 위한 리워드인가요?</li></ul><p><br></p><p>이어서 리워드의 상세 정보를 안내해 주세요.</p><p>리워드의 이름은 무엇이고, 어떤 용도로 사용하는 제품/서비스인가요? 서포터분들은 리워드를 직접 보고 펀딩할 수 없으므로 사진, 영상과 같은 다양한 시각 자료를 삽입해 주세요.</p><p>리워드 품목에 따라 서포터분들이 꼭 알아야 하는 상세 스펙(특징, 사양, 사이즈, 사용법, 주의 사항 등)을 빠짐없이 알려 주세요.</p><h2>메이커 소개</h2><p>서포터분들과 직접 소통하듯, 친근한 인사말과 함께 메이커님을 소개해 주세요. 오랜 기간 리워드를 기다리는 서포터분들에게 신뢰를 줄 수 있도록 메이커님/팀원들의 모습이 잘 드러나는 사진을 함께 삽입해 주세요.</p><h2>이프 펀딩 이유</h2><p>이프 펀딩 진행 이유와 펀딩금 사용 계획을 작성해 주세요. 이는 서포터분들의 지지와 관심, 펀딩으로 이어지도록 하는 중요한 내용입니다.</p><ul><li>이프에서 크라우드펀딩을 진행하는 이유는 무엇인가요?</li><li>펀딩금은 어떻게 사용하실 계획인가요?</li></ul><p>※ 펀딩금을 기부나 후원과 같이 의미 있는 곳에 사용하실 계획이라면, 서포터분들에게 펀딩금 사용 현황/내역을 공유할 수 있는 방법을 함께 안내해 주세요. (예: 프로젝트 종료 후 새소식을 통해 공지)</p><h2>리워드 리스트</h2><p>리워드의 명칭과 구성, 금액, 혜택을 한눈에 확인할 수 있도록 리스트를 삽입해 주세요. 아래와 같이 테이블 기능을 활용하여 표 형식으로 정리해도 좋습니다.</p><p>※ 반드시 <strong><u>펀딩 준비 &gt; 리워드 설계</u></strong> 화면의 리워드명, 구성, 혜택, 순서와 일치할 수 있도록 확인해 주세요.</p><p><br>(예시)</p><table style="width: 100%;"><thead><tr><th style="text-align: center;">리워드명</th><th style="text-align: center;">구성</th><th style="text-align: center;">금액</th><th style="text-align: center;">혜택</th></tr></thead><tbody><tr><td style="width: 25.0000%;">[울트라얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개, 코스터 1개</td><td style="width: 25%; text-align: center;">21,000원</td><td style="width: 25.0000%;">30% 가격 혜택 + 무료 배송</td></tr><tr><td style="width: 25.0000%;">[커플얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 2개, 코스터 2개</td><td style="width: 25%; text-align: center;">45,000원</td><td style="width: 25.0000%;">25% 가격 혜택 + 무료 배송</td></tr><tr><td style="width: 25.0000%;">[슈퍼얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개, 코스터 1개</td><td style="width: 25%; text-align: center;">24,000원</td><td style="width: 25.0000%;">20% 가격 혜택</td></tr><tr><td style="width: 25.0000%;">[얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개</td><td style="width: 25%; text-align: center;">25,500원</td><td style="width: 25.0000%;">15% 가격 혜택</td></tr></tbody></table><h2>리워드 발송 정보</h2><p>발송 정보는 서포터분들이 궁금해하는 항목이므로 아래 내용을 상세히 작성해 주세요.</p><ul><li>발송 방법: 택배, 우편, 이메일 발송 등</li><li>발송 일정: ○월 ○일 발송 시작</li><li>도서/산간 지역 발송 안내<br>- 도서/산간 지역 배송 가능 여부:<br>- 추가 배송비:<br>- 지불 방법: 다음 세 가지 방법 중 한 가지를 선택해 주세요.<br>1) 펀딩 시 후원금 더하기에 추가 배송비를 입력해 주세요.<br>2) 펀딩 시 도서/산간 추가 배송비 리워드를 함께 펀딩해 주세요. (단, 펀딩 준비 &gt; 리워드 설계 화면에서 추가 배송비 리워드 별도 생성 필수)<br>3) 최종 결제일 이후 서포터분들에게 개별 안내해 드리는 계좌로 추가 배송비를 직접 입금해 주세요.</li><li>배송 시 포장 상태:</li><li>문의 채널과 문의 가능한 시간: 카카오 채널, 메이커에게 문의하기, 메일, 전화번호 등</li><li>수령 후 보관 시 유의 사항:</li></ul><p><br></p> </p><p><br></p>';
    var earlyinnerText ='<p>※ 항목별로 미리 기재되어 있는 내용은 메이커님이 필수 항목을 쉽게 작성하실 수 있도록 돕는 가이드 문구이므로, 참고 후 삭제 부탁드립니다.</p><h2>리워드 핵심 포인트 및 소개</h2><p>도입부에 리워드의 매력 포인트와 차별점을 3줄로 정리하여 서포터분들에게 소개해 주세요.</p><p><br></p><p>(예시)</p><ul><li>리워드의 장점은 무엇인가요?</li><li>이프에서만 제공되는 혜택은 무엇인가요?</li><li>어떤 서포터분들을 위한 리워드인가요?</li></ul><p><br></p><p>이어서 리워드의 상세 정보를 안내해 주세요.</p><p>리워드의 이름은 무엇이고, 어떤 용도로 사용하는 제품/서비스인가요? 서포터분들은 리워드를 직접 보고 펀딩할 수 없으므로 사진, 영상과 같은 다양한 시각 자료를 삽입해 주세요.</p><p>리워드 품목에 따라 서포터분들이 꼭 알아야 하는 상세 스펙(특징, 사양, 사이즈, 사용법, 주의 사항 등)을 빠짐없이 알려 주세요.</p><h2>메이커 소개</h2><p>서포터분들과 직접 소통하듯, 친근한 인사말과 함께 메이커님을 소개해 주세요. 오랜 기간 리워드를 기다리는 서포터분들에게 신뢰를 줄 수 있도록 메이커님/팀원들의 모습이 잘 드러나는 사진을 함께 삽입해 주세요.</p><h2>이프 펀딩 이유</h2><p>이프 펀딩 진행 이유와 펀딩금 사용 계획을 작성해 주세요. 이는 서포터분들의 지지와 관심, 펀딩으로 이어지도록 하는 중요한 내용입니다.</p><ul><li>이프에서 크라우드펀딩을 진행하는 이유는 무엇인가요?</li><li>펀딩금은 어떻게 사용하실 계획인가요?</li></ul><p>※ 펀딩금을 기부나 후원과 같이 의미 있는 곳에 사용하실 계획이라면, 서포터분들에게 펀딩금 사용 현황/내역을 공유할 수 있는 방법을 함께 안내해 주세요. (예: 프로젝트 종료 후 새소식을 통해 공지)</p><h2>리워드 리스트</h2><p>리워드의 명칭과 구성, 금액, 혜택을 한눈에 확인할 수 있도록 리스트를 삽입해 주세요. 아래와 같이 테이블 기능을 활용하여 표 형식으로 정리해도 좋습니다.</p><p>※ 반드시 <strong><u>펀딩 준비 &gt; 리워드 설계</u></strong> 화면의 리워드명, 구성, 혜택, 순서와 일치할 수 있도록 확인해 주세요.</p><p><br>(예시)</p><table style="width: 100%;"><thead><tr><th style="text-align: center;">리워드명</th><th style="text-align: center;">구성</th><th style="text-align: center;">금액</th><th style="text-align: center;">혜택</th></tr></thead><tbody><tr><td style="width: 25.0000%;">[울트라얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개, 코스터 1개</td><td style="width: 25%; text-align: center;">21,000원</td><td style="width: 25.0000%;">30% 가격 혜택 + 무료 배송</td></tr><tr><td style="width: 25.0000%;">[커플얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 2개, 코스터 2개</td><td style="width: 25%; text-align: center;">45,000원</td><td style="width: 25.0000%;">25% 가격 혜택 + 무료 배송</td></tr><tr><td style="width: 25.0000%;">[슈퍼얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개, 코스터 1개</td><td style="width: 25%; text-align: center;">24,000원</td><td style="width: 25.0000%;">20% 가격 혜택</td></tr><tr><td style="width: 25.0000%;">[얼리버드] 이프텀블러</td><td style="width: 25.0000%;">텀블러 1개</td><td style="width: 25%; text-align: center;">25,500원</td><td style="width: 25.0000%;">15% 가격 혜택</td></tr></tbody></table><h2>리워드 발송 정보</h2><p>발송 정보는 서포터분들이 궁금해하는 항목이므로 아래 내용을 상세히 작성해 주세요.</p><ul><li>발송 방법: 택배, 우편, 이메일 발송 등</li><li>발송 일정: ○월 ○일 발송 시작</li><li>도서/산간 지역 발송 안내<br>- 도서/산간 지역 배송 가능 여부:<br>- 추가 배송비:<br>- 지불 방법: 다음 세 가지 방법 중 한 가지를 선택해 주세요.<br>1) 펀딩 시 후원금 더하기에 추가 배송비를 입력해 주세요.<br>2) 펀딩 시 도서/산간 추가 배송비 리워드를 함께 펀딩해 주세요. (단, 펀딩 준비 &gt; 리워드 설계 화면에서 추가 배송비 리워드 별도 생성 필수)<br>3) 최종 결제일 이후 서포터분들에게 개별 안내해 드리는 계좌로 추가 배송비를 직접 입금해 주세요.</li><li>배송 시 포장 상태:</li><li>문의 채널과 문의 가능한 시간: 카카오 채널, 메이커에게 문의하기, 메일, 전화번호 등</li><li>수령 후 보관 시 유의 사항:</li></ul><p><br></p> </p><p><br></p>';
	var startDate;

	function formatDate(date) {
		 var d = new Date(date),
		 month = '' + (d.getMonth() + 1),
		 day = '' + d.getDate(),
		 year = d.getFullYear();
		 if (month.length < 2) month = '0' + month; 
		 if (day.length < 2) day = '0' + day; 
		 return [year, month, day].join('-'); }



    
    $(document).ready(function () {
        
    	  $("#showStart_day").hide();
          $('#showScheduledOpen').hide();
		
    	 $.ajax({
   			url:"${pageContext.request.contextPath}/funding/ready4StoryLoad",
   			contentType: "application/json; charset=utf-8",
   			async:false,
   			method: "GET",
             success: function(data) {
                  const {funding} = data;
                  console.log(funding);
                  console.log(funding.content);
                  console.log(funding.earlyContent);

                  if(funding.content != null){
	                  innerText = funding.content;
                  }
                  if(funding.earlyContent != null){
                  	  earlyinnerText = funding.earlyContent;
                  }
                  earlyContent = funding.earlyContent;
                  if(earlyContent != null){
				  	$('#showScheduledOpen').show();
			    	$('#showStart_day').show();
				  	$("[id=scheduled]").prop("checked",true);
				  	$("[name=startDate]").val(formatDate(funding.startDate));
                  }else{
                	  $("#showStart_day").hide();
                      $('#showScheduledOpen').hide();
                  }
                  
             }
           });
		

         
        $("#projectstory").summernote(
              {height: 500}
         );
        $("#projectstory").summernote(
             "code",
             innerText
        );
        $("#scheduledOpen").summernote(
              {height: 500}
         );
        $("#scheduledOpen").summernote(
             "code",
             earlyinnerText
        );

      
    });

  /*    function check(){
        console.log($("#projectstory").summernote('code'));
        console.log($("#scheduledOpen").summernote('code'));

        $("[name=content]").val($("#projectstory").summernote('code'));
		$("[name=early_content]").val($("#scheduledOpen").summernote('code'));

		console.log($("[name=content]").val());
		console.log($("[name=early_content]").val());

    };  */
     
    function setDisplay(){
	      if($('input:radio[id=direct]').is(':checked')){
	          $('#showScheduledOpen').hide();
	          $('#showStart_day').hide();
	      }else{
	    	  $('#showProjectstory').show();
	    	  $('#showScheduledOpen').show();
	    	  $('#showStart_day').show();
	      }
      };

    function storyFrmSubmit(){
    	console.log("실행");
		const content =$("#projectstory").summernote('code');
		const earlyContent = $("#scheduledOpen").summernote('code');
		$("[name=content]").val(content);
		$("[name=earlyContent]").val(earlyContent);
		$("storyFrm").submit();

    }
   
     
</script>
</body>
</html>
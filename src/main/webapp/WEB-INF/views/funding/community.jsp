<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/news.css" />

<div id="funding_tap">
	<ol>
		<li><a
			href="${pageContext.request.contextPath }/funding/funding_detail">스토리</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/funding/news.do">새소식</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/community.do">커뮤니티</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/supporter.do">서포터</a>
		</li>
	</ol>
</div>

<div id="funding_main">
	<div id="funding_main_image_and_content">
		<div class="yh-c-view">
			<p>
				서포터님! <br />처음 <strong>메이커의 열정과 가치에 공감</strong>해주셨듯, 마지막까지 <strong>메이커를
					응원</strong>해주세요.
			</p>
		</div>
		<div class="yh-FAQ">
			<p style="margin: 0;">
				<small>이프에서 펀딩하는 방법이 궁금하다면?</small>
			</p>
			<p style="margin: 0; font-size: 23px;">FAQ</p>
		</div>
		<div class="yh-c-containertable">
			<div class="yh-c-table">
				<div>
					<input type="button" class="FAQ-btn" id="FAQ-btn1"
						value="펀딩 했어요. 결제는 언제, 어떻게 진행되나요?" />
				</div>
				<div class="FAQ-answer" id="FAQ_answer1">
					<p>
						<small>펀딩기간 중에는 결제 예약 상태이며, 프로젝트 종료 후 다음 1영업일 5시에 결제가
							진행됩니다. 이때, 결제 실패된 건에 한하여 종료일+4영업일동안 매일 5시에 결제가 진행됩니다. (펀딩
							종료일+4영업일 오후 5시 4차 최종 결제 진행)</small>
					</p>
				</div>
				<div>
					<input type="button" class="FAQ-btn" id="FAQ-btn2"
						value="결제 실패 알림을 받았어요. 어떻게 해야하나요?" />
				</div>
				<div class="FAQ-answer" id="FAQ_answer2">
					<p>
						<small>카드 잔고 부족이나 한도 초과, 거래 정지된 카드인 경우 결제가 진행되지 않습니다. 최종
							결제일 16시 30분 전까지 다른 카드로 결제 정보를 변경해주세요. 최종 결제일까지 매 영업일 5시마다 결제가
							진행됩니다. <br />・ 결제정보 변경은 로그인 - [나의 리워드] - [펀딩 내역] - [참여 프로젝트]에서
							결제 정보를 변경할 수 있습니다. <br />・ 반드시 참여한 프로젝트 펀딩 상세 내역 페이지에서 결제 정보를
							변경해주세요. 나의 리워드 - 간편결제 정보 변경하면 해당 카드로 결제가 진행되지 않습니다!
						</small>
					</p>
				</div>
				<div>
					<input type="button" class="FAQ-btn" id="FAQ-btn3"
						value="카드 결제가 진행된 후, 다른 카드로 변경할 수 있나요?" />
				</div>
				<div class="FAQ-answer" id="FAQ_answer3">
					<p>
						<small>결제 예약으로 진행되는 크라우드 펀딩 특성상 이미 종료된 프로젝트는 취소 후 재펀딩이
							불가능하니, 결제 전 등록한 카드정보가 맞는지 확인해주세요.</small>
					</p>
				</div>
				<div>
					<input type="button" class="FAQ-btn" id="FAQ-btn4"
						value="배송지나 옵션을 변경하고 싶어요." />
				</div>
				<div class="FAQ-answer" id="FAQ_answer4">
					<p>
						<small>프로젝트 진행 중에는 [나의 리워드] - [펀딩내역]에서 직접 변경이 가능합니다. <br />
							펀딩이 종료된 이후에는 직접 변경이 불가능하니, 아래 [메이커에게 문의하기]를 통해 문의해주세요.
						</small>
					</p>
				</div>

				<div id="FAQ_more">
					<div>
						<input type="button" class="FAQ-btn" id="FAQ-btn5"
							value="리워드 배송은 언제되나요? 해외 배송도 가능한가요?" />
					</div>
					<div class="FAQ-answer" id="FAQ_answer5">
						<p>
							<small>크라우드 펀딩은 프로젝트 종료 후 기재된 배송 예정일에 배송되며, 배송 예정일은 프로젝트
								상세페이지에서 확인할 수 있습니다. 펀딩 참여 후에는 [나의 리워드] - [펀딩내역]에서 확인할 수 있습니다. <br />
								결제 예약 시 국내 주소만 입력이 가능하니, 해외배송은 메이커에게 문의 후 진행해주세요.
							</small>
						</p>
					</div>
					<div>
						<input type="button" class="FAQ-btn" id="FAQ-btn6"
							value="교환/환불/AS는 어디로 문의해야하나요?" />
					</div>
					<div class="FAQ-answer" id="FAQ_answer6">
						<p>
							<small>해당 프로젝트의 교환/환불/AS 기준은 프로젝트 상단 [펀딩안내]탭을 확인해주세요. </small>
						</p>
					</div>
					<div>
						<input type="button" class="FAQ-btn" id="FAQ-btn7"
							value="펀딩 취소는 어떻게 하나요? 부분 취소도 가능한가요?" />
					</div>
					<div class="FAQ-answer" id="FAQ_answer7">
						<p>
							<small>프로젝트 종료 후에는 메이커가 서포터를 위해 리워드 제작을 시작한 상태입니다. 따라서
								프로젝트 종료 이후에는 펀딩 취소가 불가하니, 종료 이전에 취소해주세요. <br /> 프로젝트가 종료되기 이전에는
								[나의 리워드]에서 펀딩 취소가 가능합니다. <br /> 부분 취소는 여러 개의 리워드를 결제 예약한 경우
								불가능합니다. 전체 취소 후 재펀딩해주세요.
							</small>
						</p>
					</div>
				</div>
				<div>
					<input class="FAQB" id="FAQB" type="button" value="더보기" />
				</div>
			</div>

			<!-- 문의 -->
			<div class="inquire">
				<p>
					<small>리워드, 배송 등 펀딩에 대해 궁금한 사항이 있다면?</small> <br />메이커에게 문의하기
				</p>
			</div>
			<div class="maker">
				<div class="maker-logo">
					<a href=""><img class="logoimg" src=""></a>
				</div>
				<div>
					<p>
						굿럭<br /> <small>평균 응답 시간 5시간 이내</small>
					</p>
				</div>
				<div>
					<input class="inquire-btn" type="button" value="문의하기" />
				</div>
			</div>

			<!-- 리뷰 -->
			<div class="review-top">
				<div>
					<p>
						<strong style="font-size: 20px;">응원 · 의견 · 체험리뷰</strong> <br /> <small>펀딩
							종료전에 남긴 글입니다.</small>
					</p>
				</div>

				<div>
					<input type="button" value="글 남기기" id="c-write-btn" />
				</div>
				<div class="c-write-container">
					<div class="c-write-view" id="c-write-view">
						<div class="c-write-view-a">
							<a href="">x</a>
						</div>
						<div>
							<h4>
								<strong>글 남기기</strong>
							</h4>
						</div>
						<div>
							<p>
								응원∙의견∙체험리뷰를 남겨주세요.<br />메이커의 답변이 필요한 문의 글은 ‘메이커에게 문의하기’를 이용해야
								답변을 받을 수 있습니다.
							</p>
						</div>
						<div class="yh-checkbox1" id="yh_checkbox1">
							<div>
								<label for="chk-1"><input type="checkbox" name="chk" value="1" class="chk"
									id="chk-1" onclick='checkOnlyOne(this)' />&nbsp;응원&nbsp; <small>메이커를
										응원하고싶어요.</small></label>
							</div>
						</div>
						<div class="yh-checkbox1" id="yh_checkbox1">
							<div>
								<label for="chk-2"><input type="checkbox" name="chk" value="2" class="chk"
									id="chk-2" onclick='checkOnlyOne(this)' />&nbsp;의견&nbsp; <small>프로젝트에
										대한 의견을 남기고 싶어요.</small></label>
							</div>
						</div>
						<div class="yh-checkbox1" id="yh_checkbox1">
							<div>
								<label for="chk-3"><input type="checkbox" name="chk" value="3" class="chk"
									id="chk-3" onclick='checkOnlyOne(this)' />&nbsp;체험 리뷰&nbsp; <small>오프라인
										체험 리뷰를 남기고 싶어요.</small></label>
							</div>
						</div>
						<div class="c-write-comment" id="c-write-comment">
							<textarea class="c-write-comment-textb"
								id="c-write-comment-textb"> </textarea>
						</div>
						<div class="comment-red">
							<small><strong>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의
									댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로
									법적 책임을 부담하게 될 수 있다는 점을 유의하여 주시기 바랍니다.</strong></small>
						</div>
						<div>
							<h4>게시물 이용안내</h4>
							<ol>
								<li><small>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고
										없이 삭제 등 조치가 취해질 수 있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록
										유의하시기 바랍니다.</small></li>
								<li><small>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한
										답변을 받을 수 있습니다.</small></li>
								<li><small>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지
										마세요.</small></li>
								<li><small>체험 리뷰는 반드시 펀딩을 위해 진행된 오프라인 전시(체험)에 참여한 후
										작성하세요.</small></li>
							</ol>
						</div>
						<div class="yh-c-write-view-btn">
							<input type="button" value="등록" />
						</div>
					</div>
					<div class="dim"></div>
				</div>

				<div>
					<label for="c-chk1"><input type="checkbox" name="c-chk1"
						id="c-chk1" />&nbsp;체험리뷰</label>
				</div>
			</div>

			<!-- 댓글 -->
			<div class="yh-comment">
				<div>
					<strong>id</strong> <span>펀딩 참여자</span> <span>응원 · 17시간전</span>
				</div>
				<div>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Fugiat laudantium aperiam totam aut magni voluptas perspiciatis
						sed ad quam ut molestiae ea eum doloremque blanditiis architecto
						rem laborum autem quae.</p>
				</div>
				<div>
					<input type="button" value="답글" id="c-comment-btn" />
				</div>
				<div class="yh-c-comment" id="yh_c_comment">
					<textarea class="nv-c-comment" id="nv-c-comment"></textarea>
					<input type="button" value="등록" id="nv-c-comment-btn" />
				</div>
				<div class="yh-maker-comment">
					<div>
						<strong>id</strong> <span>메이커</span> <span>17시간전</span>
					</div>
					<div>
						<p>감사링!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="funing_main_right_div">
		<div id="funing_main_right_div_1">
			<h2>10일 남음</h2>
			<h4>20% 달성</h4>
			<h4>100000000</h4>
			<h4>50</h4>
			<input id="funding_button" type="button" value="펀딩하기"
				onclick="location.href='${pageContext.request.contextPath}/funding/funding_reward';" />
			<input type="button" value="좋아요" /> <input type="button"
				value="1:1 채팅" /> <input type="button" value="공유하기" />
		</div>

		<div id="funing_main_right_div_2"></div>

		<div id="funing_main_right_div_3"></div>

		<div id="funing_main_right_div_4"></div>

	</div>
</div>

<script>
$("#FAQ-btn1").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??
	console.log(111);
	console.log(FAQ_answer1.style.display);
	console.log($(FAQ_answer1).css('display'));
    if($(FAQ_answer1).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer1").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer1").style.display='none'

    }
});

$("#FAQ-btn2").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer2).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer2").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer2").style.display='none'

    }
});

$("#FAQ-btn3").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer3).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer3").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer3").style.display='none'

    }
});

$("#FAQ-btn4").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer4).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer4").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer4").style.display='none'

    }
});

$("#FAQ-btn5").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer5).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer5").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer5").style.display='none'

    }
});

$("#FAQ-btn6").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer6).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer6").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer6").style.display='none'

    }
});

$("#FAQ-btn7").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_answer7).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_answer7").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_answer7").style.display='none'

    }
});

$("#FAQB").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(FAQ_more).css('display') == 'none'){

       //열어주어라

       document.getElementById("FAQ_more").style.display='block';
   	   $(this).val('접기');

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("FAQ_more").style.display='none';
       $(this).val('더보기');
    }
});

$("#c-comment-btn").click(function(){
	//만일 Pop라는 녀석이 닫혀있다면??

    if($(yh_c_comment).css('display') == 'none'){

       //열어주어라

       document.getElementById("yh_c_comment").style.display='block'

    //그렇지 않은 모든 경우라면??

    }else{

       //닫아주어라

       document.getElementById("yh_c_comment").style.display='none'

    }
});

$("#c-write-btn").click(function(){
	location.href="#c-write-view";
});

/* $(".chk").click(function(){
	const checkboxes = document.getElementsByName("chk");
	for(var i=0; i<checkboxes.length; i++){
		if(checkboxes[i] != chk){
            checkboxes[i].checked = false;
        }
	}
}); */
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("chk");
	  const color = element.parentElement.parentElement.parentElement;

	  checkboxes.forEach((cb) => {
	    cb.checked = false;
			    
	  })
	  
	  element.checked = true;
	  console.log(element.parentElement.parentElement.parentElement);

	}

var div2 = document.getElementsByClassName("chk");

function handleClick(event) {
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다

    console.log(event.target.classList);

    if (event.target === "clicked") {
      event.target.parentElement.parentElement.parentElement.classList.remove("clicked");
    } else {
      for (var i = 0; i < div2.length; i++) {
        div2[i].parentElement.parentElement.parentElement.classList.remove("clicked");
      }

      event.target.parentElement.parentElement.parentElement.classList.add("clicked");
    }
  }

  function init() {
    for (var i = 0; i < div2.length; i++) {
      div2[i].addEventListener("click", handleClick);
    }
  }

  init();

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

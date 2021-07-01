<%@page import="com.kh.interactFunding.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/news.css" />
<script>
	//좋아요 버튼 클릭여부
	window.onload = function(){
		console.log("온로드함수")
	$.ajax({
		url:"${pageContext.request.contextPath}/funding/likeStatusCheck",
		data: {
			memberNo : ${loginMember.memberNo},
		},
		success(data){
			console.log(data)
			/* 좋아요를 누른상황 */
			if(data == 1){
				$("#icon_heart").html('<i class="fas fa-heart"></i>');
			
			}else{
			/* 좋아요 안누른상황 */
				$("#icon_heart").html('<i class="far fa-heart"></i>');
			}
		},
		error: console.log
		,
		})
	};
	//창 가운데 띄우기위함
	function maker_chat_function(){
	var popupWidth = 200;
	var popupHeight = 300;
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	var popupY= (window.screen.height / 2) - (600 / 2);
	window.open('fundingChatMaker', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
		}
</script>
	</section>
	
		<div id="funding_top_title_wrapper_wrapper">
			<div id="funding_top_title_wrapper">
				<div id="funding_top_title">
					<img src="${pageContext.request.contextPath }/resources/upload/${funding.attachment.renamedFilename}" id="funding_top_title_image">
				</div>
				<div id="funding_top_title_div">
				    <c:if test="${funding.categoryCode == 'C1'}"><span class="category_code_span">테크·가전</span></c:if>
				    <c:if test="${funding.categoryCode == 'C2'}"><span class="category_code_span">푸드</span></c:if>
				    <c:if test="${funding.categoryCode == 'C3'}"><span class="category_code_span">여행</span></c:if>
				    <c:if test="${funding.categoryCode == 'C4'}"><span class="category_code_span">스포츠</span></c:if>
				    <c:if test="${funding.categoryCode == 'C5'}"><span class="category_code_span">게임·취미</span></c:if>
				    <c:if test="${funding.categoryCode == 'C6'}"><span class="category_code_span">모임</span></c:if>
				    <c:if test="${funding.categoryCode == 'C7'}"><span class="category_code_span">반려동물</span></c:if>
				    <c:if test="${funding.categoryCode == 'C8'}"><span class="category_code_span">기부·후원</span></c:if>
				  <br />
				  ${funding.title}
				</div>
			</div>
		</div>
		
		<div id="funding_tap_wrapper">
			<div id="funding_tap">
	            <ol>
	                <li>
	                    <a href="${pageContext.request.contextPath }/funding/fundingDetail?fundingNo=${funding.fundingNo}">스토리</a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/funding/news.do?fundingNo=${funding.fundingNo}">새소식</a>
	                </li>
	                <li>
	                    <a style="border-bottom: 5px solid #00a2a2;" href="${pageContext.request.contextPath }/funding/community.do?fundingNo=${funding.fundingNo}">커뮤니티</a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/funding/supporter.do?fundingNo=${funding.fundingNo}">서포터</a>
	                </li>
	            </ol>
	        </div>
	     </div>
	<!-- 공통작업 css 작업 열기 -->
	<section>

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
				<div>
					<p>
						<strong>${wirterName}</strong><br /> 
					</p>
				</div>
				<div>
					<input data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="${funding.writerNo}" class="inquire-btn" type="button" value="문의하기" onclick="msgSetting(this)" />
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
				<form id="commentFrm" name="cc_write_container"
					action="${pageContext.request.contextPath}/funding/communityEnroll.do"
					method="post">
					<input id="fundingNo" type="hidden" name="fundingNo"
						value="${funding.fundingNo}" />
					<input id="writerNo" type="hidden" name="writerNo"
						value="${loginMember.memberNo}" />
					<div class="c-write-container" id="c_write_container">
						<div class="c-write-view" id="c_write_view">
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
							<!-- 	<div class="yh-checkbox1" id="yh_checkbox1">
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
						</div> -->
							<div class="c-write-comment" id="c-write-comment">
								<textarea class="c-write-comment-textb" name="content"
									id="c_write_comment_textb"> </textarea>
							</div>
							<div class="comment-red">
								<small><strong>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방
										목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕
										등으로 법적 책임을 부담하게 될 수 있다는 점을 유의하여 주시기 바랍니다.</strong></small>
							</div>
							<div>
								<h4>게시물 이용안내</h4>
								<ol>
									<li><small>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고
											없이 삭제 등 조치가 취해질 수 있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지
											않도록 유의하시기 바랍니다.</small></li>
									<li><small>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한
											답변을 받을 수 있습니다.</small></li>
									<li><small>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지
											마세요.</small></li>
									<li><small>체험 리뷰는 반드시 펀딩을 위해 진행된 오프라인 전시(체험)에 참여한
											후 작성하세요.</small></li>
								</ol>
							</div>
							<div class="yh-c-write-view-btn">
								<input type="submit" value="등록" />
							</div>
						</div>
						<div class="dim"></div>
					</div>

					<!-- <div>
						<label for="c-chk1"><input type="checkbox" name="c-chk1"
							id="c-chk1" />&nbsp;체험리뷰</label>
					</div> -->
				</form>
			</div>

			<!-- 댓글 -->
				<c:forEach items="${list}" var="comment">
					<div class="yh-comment" id="yh_comment">

							<div>
								<strong>${comment.name}</strong> &nbsp; <span><small><fmt:formatDate
											value="${comment.regDate}" pattern="yy-MM-dd HH:mm:ss" /></small></span>
							</div>
							<div>
								<p>${comment.content}</p>
							</div>
							<%-- <div id="c-comment-btn">
								<input type="button" value="답글" />
							</div>
							<div class="yh-c-comment" id="yh_c_comment">
								<textarea class="nv-c-comment" id="nv-c-comment" name="content"></textarea>
								<input type="submit" value="등록" id="nv-c-comment-btn"
									data-memberno="${comment.writerNo}" />
							</div> --%>
						<c:if test="${loginMember.memberNo == comment.writerNo}">	
						<form class="commentDeleteFrm"
							action="${pageContext.request.contextPath}/funding/commentDelete.do"
							method="POST">
							<input type="submit" value="삭제" class="commentDeleteBtn" data-rno="${comment.commentNo}"/>
							<input type="hidden" name="commentNo" value="${comment.commentNo}" />
						</form>
						</c:if>
					</div>

				</c:forEach>
		</div>
            </div>

			<!-- 남은날계산용 -->
			<fmt:parseNumber value="${funding.startDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
			<fmt:parseNumber value="${funding.DDay.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>

            <div id="funing_main_right_div">
                <div id="funing_main_right_div_1">
                    <div id="funding_detail_dday_div">${endDate - strDate}일 남았습니다</div>
                    <div id="funding_detail_dday_bar_wrapper">
	                    <div id="funding_detail_dday_bar" class="progress">
		                      <div id="funding_detail_dday_bar_div" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
							  aria-valuenow="${funding.nowAmount}" aria-valuemin="0" aria-valuemax="${funding.goalAmount}" style="width:${funding.nowAmount / funding.goalAmount * 100}%">
		 					 </div>
						</div>
					</div>
                    <div id="funding_detail_goal_percent_div"> <fmt:formatNumber value="${funding.nowAmount / funding.goalAmount}" type="percent"/>달성</div><!-- 8500% 달성 -->
                   
                    <div id="funding_detail_now_amount_div">현재 <fmt:formatNumber value="${funding.nowAmount}" pattern="#,###" />원 펀딩중</div><!-- 444444 원 펀딩 -->
                    <div id="funding_detail_supporter_div"> 현재 ${fundingParticipationCount}명의 서포터</div> <!-- 3333명의 서포터funding_participation -->
                    <input id="funding_button" type="button" value="펀딩하기" onclick="location.href='${pageContext.request.contextPath}/funding/fundingReward?fundingNo=	${funding.fundingNo}';" class="btn btn-info"/>
                    <button type="button" id="funding_detail_like_button" class="btn btn-outline-secondary" onclick="like_controll()">
                    <!--하트  -->
                    <span id="icon_heart" style="color:red;"><i class="far fa-heart"></i></span>
                    <!--좋아요숫자  -->
                    <span id="funding_detail_like_count">${funding.likeCount}</span></button>
                    <button type="button" value="1:1 채팅" id="funding_detail_chat_button" class="btn btn-outline-secondary" onclick="maker_chat_function()"><span>1:1 채팅</span></button>
                    <!-- <input type="button" value="1:1 채팅" id="funding_detail_chat_button"/> -->
                </div>
                
                <span id="funding_detail_like_count"></span>

			 	<span id="maker_span">메이커 정보</span>
				<!--메이커정보 (해당 펀딩의 작성자정보) -->
                <div id="funing_main_right_div_2">
            		 
                	<div id="funding_detail_maker_logo_name_div">
                		<div id="funding_detail_maker_name">${wirterName}</div>
                	</div>
                		<div id="funding_detail_maker_phone">메이커 연락처 <br/>${funding.phone}</div>
                    <input type="button" value="메이커에게 문의하기" id="funding_detail_maker_chat_button" class="btn btn-info"
                     data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="${funding.writerNo}" onclick="msgSetting(this)"/>
                </div>



                <span id="reward_span">리워드 선택</span>
         
                <c:forEach var="reward" items="${reward}">
	                <!-- 발송시작일 계산을 위함 -->
	                <div id="funing_main_right_div_3" class="funding_main_reward_choice_div" data-choice="${reward.rewardNo}">
		                <fmt:formatDate var="shippingDate" value="${reward.shippingDate}" type="DATE" pattern="yyyy년 MM월 초 (1~10일) 예정"/>
	                	<div id="fundingReward_price"><fmt:formatNumber value="${reward.price}" pattern="#,###"  />원 펀딩</div>
	                	<div id="fundingReward_title">${reward.title}!!</div>
	                	<div id="fundingReward_content">${reward.content} 혜택</div>
	                	
	                	<div id="fundingReward_shipping_title">배송비 </div>
	                	<div id="fundingReward_shippint_price"><fmt:formatNumber value="${reward.shippingPrice}" pattern="#,###" /></div>
	                	<div id="fundingReward_shipping_date_title">리워드 발송 시작일</div>
	                	<div id="fundingReward_shipping_date_number">${shippingDate}</div>
	                	<div id="fundingReward_limit">남은수량 ${reward.limitAmount}개</div>
				   </div>
                </c:forEach>
				<span id="ranking_span">인기게시글</span>
                <div id="funing_main_right_div_4">
                	<c:forEach var="funding" varStatus="vs" items="${likelist}" >
      						<span class="funing_main_right_div_4-span">${vs.count}</span>
                         <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"style="color: #000000;">
							<div class="likeDiv">${funding.title} </div></a>
                     </c:forEach>
                </div>
            </div>
        </div>
    
	<script>
    //좋아요 누를시
	function like_controll(){
		$("#funding_detail_like_button").attr("onclick","");
		$.ajax({
			url: "${pageContext.request.contextPath}/funding/loginMemberClickLike",
			data: {
				memberNo : ${loginMember.memberNo},
				fundingNo : ${funding.fundingNo},
			},
			method: "POST",
			success(data){
				console.log(data);
				$('#funding_detail_like_count').text(data.likeCount);
				if(data.heart == "on"){
					$("#icon_heart").html('<i class="fas fa-heart"></i>');
				}else{
					$("#icon_heart").html('<i class="far fa-heart"></i>');
					}
			},
			error: console.log
			,
			complete(){
				$("#funding_detail_like_button").attr("onclick","like_controll();");
			} 
		})
	};
	
	$(".funding_main_reward_choice_div").click(function(e){
		/* 수정필요 */
		if(${not empty loginMember}){
			var $target;
			var choice;
	        if($(e.target).hasClass("funding_main_reward_choice_div")){
            	$target = $(e.target);
	        }
	        else{
		        $target = $(e.target).parent();
	        }
	        choice = $target.data("choice");
			console.log(choice);
			location.href="${pageContext.request.contextPath}/funding/fundingReward?fundingNo=${funding.fundingNo}&choice="+choice;
		}else{
			alert("로그인 회원만 가능합니다.");
			return;
		}
	});
	$('.funding_main_reward_choice_div').hover(function(){
		$(this).css("border","2px solid #00c4c4");
		$(this).children().first().css("color","#00c4c4");
	}, function(){
        $(this).css("border","2px solid #cccccc");
        $(this).children().first().css("color","black");
    });
    
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
		var memberNo = "${loginMember.memberNo}";
		console.log(memberNo);
		 if(memberNo == ""){
		       location.href="${pageContext.request.contextPath}/member/login";
		    }
		 if(memberNo != "" || $(c_write_view).css('display') == 'none'){
		       //열어주어라
		       document.getElementById("c_write_view").style.display='block'
		    }
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
	  
	  $("#commentFrm").submit(e =>{
		  e.preventDefault();
		  const $frm = $(e.target);
		  const fundingNo = $('#fundingNo').val();
		  console.log(fundingNo);
		  const writerNo = $('#writerNo').val();
		  console.log(writerNo);
		  const content = $frm.find("[name=content]").val();
		  console.log(content);
		  const comment = {
				  fundingNo,
				  writerNo,
				  content
				};
		  
		  $.ajax({
		      url : "${pageContext.request.contextPath}/funding/communityEnroll.do",
		      data: JSON.stringify(comment),
		      contentType: "application/json; charset=utf-8",
		      method: "POST",
		      success(data) {
					console.log(data);
		    	  	e.target.reset(); // 폼초기화
					document.getElementById("c_write_view").style.display='none'
					swal({
			              title: "댓글등록완료",
			              text: "",
			              icon: "success"
			            })
					.then(function(){
						location.href=window.location.href;
						/* $("[name=yh-cocomment]").append('<div>'+
								'<strong>'+comment.name+'</strong><span><small>'+comment.regDate+'</small></span>'+
								'</div>'+
								'<div>'+
									'<p>'+comment.content+'</p>'+
								'</div>'+
								'<div id="c-comment-btn">'+
									'<input type="button" value="답글"  />'+
								'</div>'+
								'<div class="yh-c-comment" id="yh_c_comment">'+
									'<textarea class="nv-c-comment" id="nv-c-comment" name="content"></textarea>'+
									'<input type="submit" value="등록" id="nv-c-comment-btn" />'+
								'</div>'); */
					});
				},
				error(xhr, statusText, err){
					console.log(xhr, statusText, err);
					swal("댓글등록실패", "", "warning")
				}
				 
		  	});
		});
		
	  function cocoment(){
			var $content = $("[name=content]");
			console.log(content);
			if(/^(.|\n)+$/.test($content.val()) == false){
				alert("내용을 입력하세요");
				return false;
			}
			return true;
		}

	  $(".commentDeleteFrm").submit(e => {
			e.preventDefault();
			const $frm = $(e.target);
			const frmData = new FormData(e.target);
			const content = {};
			frmData.forEach((value, key) => {
				content[key] = value;
			});
			swal({
	  		  title: "댓글을 삭제하시겠습니까?",
	  		  text: "",
	  		  icon: "warning",
	  		  buttons: true,
	  		  dangerMode: true,
	  		})
	  		.then(function(){
	  	  		var fundingNo= "${funding.fundingNo}";
	  	  		console.log(content);
	  			$.ajax({
	  				url: "${pageContext.request.contextPath}/funding/commentDelete.do",
	  				method: "POST",
	  				data: JSON.stringify(content),
	  				contentType: "application/json; charset=utf-8",
	  				success(data){
	  					console.log(data);
	  					swal({
	  			              title: "댓글삭제완료",
	  			              text: "",
	  			              icon: "success"
	  			            })
	  					.then(function(){
	  						location.href="${pageContext.request.contextPath}/funding/community.do?fundingNo="+fundingNo
	  					});
	  				},
	  				error(xhr, statusText, err){
	  					console.log(xhr, statusText, err);
	  					swal("댓글 삭제실패", "", "warning")
	  				}
	  			});
	          
	  		});
			
		});
		
	</script>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
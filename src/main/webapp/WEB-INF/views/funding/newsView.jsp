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
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript"
	src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-60be12d9983015a6"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
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
	                    <a style="border-bottom: 5px solid #00a2a2;" href="${pageContext.request.contextPath }/funding/news.do?fundingNo=${funding.fundingNo}">새소식</a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath }/funding/community.do?fundingNo=${funding.fundingNo}">커뮤니티</a>
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
		<div id="nv-div">
			<%-- <c:forEach items="${newsList}" var="news"> --%>
			<div class="yh-nv-view">
				<input type="button" value="< 목록으로 이동" id="nv-view-btn" />
			<div style="text-align: right;">
				<c:if test="${loginMember.memberNo == funding.writerNo}">
					<input type="button" value="수정" id="newsUpdateBtn" /> 
				<form id="newsDeleteFrm" method="POST" action="${pageContext.request.contextPath}/funding/newsDelete.do">
					<input type="submit" value="삭제" id="newsDeleteBtn" name="newsDeleteBtn" />
					<input type="hidden" name="no" value="${funboard.no}" />
				</form>
				</c:if>
			</div>
			<br />
				<h4><strong>${funboard.title}</strong></h4>
				<p>
					<fmt:formatDate value="${funboard.regDate}"
						pattern="yyyy-MM-dd hh:mm" />
				</p>
			</div>
			<div class="yh-nv-text">
				<p>${funboard.content}</p>
				<div id="nv-share-btn-div">
					<input type="button" value="공유" id="nv-share-btn" />
					<div class="popup" id="pop1">
						<div class="popup-a" id="popup-a"></div>
						<!-- Go to www.addthis.com/dashboard to customize your tools -->
						<div class="addthis_inline_share_toolbox_a8gi"></div>
					</div>
				</div>
			</div>
			<form id="newsUpdateFrm"
				action="${pageContext.request.contextPath}/funding/newsUpdate.do"
				method="post">
				<input id="fundingNo" type="hidden" name="fundingNo" value="${funding.fundingNo}" /> 
				<input id="no" type="hidden" name="no" value="${funboard.no}" /> 
				<input id="writerNo" type="hidden" name="writerNo" value="${loginMember.memberNo}" />
				<div class="newsWriteContainerDiv" id="newsWriteContainerDiv">
					<div class="newsWriteView" id="newsUpdateView">
						<div class="newsWriteViewA">
							<a href="">x</a>
						</div>
						<div>
							<h4>
								<strong>수정하기</strong>
							</h4>
						</div>
						<input type="text" name="title" id="newsTitle"
							value="${funboard.title}" />
						<!-- 썸머노트 -->
						<div class="col-12 col-md-12">
							<br />
							<textarea name="content" class="summernote" placeholder=""
								id="summernote">${funboard.content}</textarea>
						</div>
						<div class="yh-c-write-view-btn">
							<input type="submit" value="수정하기" />
						</div>
					</div>
					<div class="dim"></div>
				</div>
			</form>

			<!-- 댓글 -->
			<!-- <div class="yh-comment">
					<div class="nv-comment-red">
						<small><strong>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의
								댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 해당 프로젝트와 무관한 댓글 혹은 악의적 댓글
								작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있으니, 유의하여 주시기 바랍니다. 개인정보(실명,
								휴대폰번호, 주소 등)가 노출되지 않도록 유의하세요. 메이커에게 개인정보를 전달해야하는 경우, [메이커에게
								문의하기]를 이용해주세요.</strong></small>
					</div>
					<textarea class="nv-comment"></textarea>
					<input type="button" value="등록" id="nv-comment-btn" />
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
				</div> -->
			<%-- </c:forEach> --%>
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
    
	$("#nv-view-btn").click(() => {
		location.href = "${pageContext.request.contextPath}/funding/news.do?fundingNo=${funding.fundingNo}"
	});

	$("#nv-share-btn").click(function(){
		//만일 Pop라는 녀석이 닫혀있다면??
		console.log(111);
		console.log(pop1.style.display);
		console.log($(pop1).css('display'));
	    if($(pop1).css('display') == 'none'){
			
	       //열어주어라

	       document.getElementById("pop1").style.display='block'

	    //그렇지 않은 모든 경우라면??

	    }else{

	       //닫아주어라

	       document.getElementById("pop1").style.display='none'

	    }
	}); 

	$("#c-comment-btn").click(function(){
			//만일 Pop라는 녀석이 닫혀있다면??
			console.log(111);
			console.log(yh_c_comment.style.display);
			console.log($(yh_c_comment).css('display'));
	        if($(yh_c_comment).css('display') == 'none'){

	           //열어주어라

	           document.getElementById("yh_c_comment").style.display='block'

	        //그렇지 않은 모든 경우라면??

	        }else{

	           //닫아주어라

	           document.getElementById("yh_c_comment").style.display='none'

	        }
	});
	
	$(document).ready(
			function() {
				jQuery('#summernote').summernote(
						{
							height : 400, // 에디터 높이
							minHeight : null, // 최소 높이
							maxHeight : null, // 최대 높이
							focus : false, // 에디터 로딩후 포커스를 맞출지 여부
							lang : "ko-KR", // 한글 설정
						});
			});

	$("#newsUpdateBtn").click(function(){
		console.log(111);
		 if($(newsUpdateView).css('display') == 'none'){
	       //열어주어라
	       document.getElementById("newsUpdateView").style.display='block'
	    //그렇지 않은 모든 경우라면??
	    }else{
	       //닫아주어라
	       document.getElementById("newsUpdateView").style.display='none'
	    }
	});

	$("#newsUpdateFrm").submit(e => {
		e.preventDefault();
		const $frm = $(e.target);

		//formData를 활용해서 객체만들기
		const frmData = new FormData(e.target);
		const fundingNo = "${funding.fundingNo}";
		const no = "${funboard.no}";
		const content = {};
		frmData.forEach((value, key) => {
			content[key] = value;
		});
		console.log(content);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/funding/newsUpdate.do",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(content),
			success(data){
				console.log(data);
				e.target.reset(); // 폼초기화
				document.getElementById("newsUpdateView").style.display='none'
				swal({
		              title: "수정완료",
		              text: "",
		              icon: "success"
		            })
				.then(function(){
					location.href=window.location.href;
				});
			},
			error(xhr, statusText, err){
				console.log(xhr, statusText, err);
				swal("새소식등록실패", "", "warning")
			}
		});
		
	});
	
	$("#newsDeleteFrm").submit(e => {
		e.preventDefault();
		
		swal({
  		  title: "새소식을 삭제하시겠습니까?",
  		  text: "",
  		  icon: "warning",
  		  buttons: true,
  		  dangerMode: true,
  		})
  		.then(function(){
  	  		var no = "${funboard.no}";
  	  		var fundingNo= "${funding.fundingNo}";
  			$.ajax({
  				url: "${pageContext.request.contextPath}/funding/newsDelete.do",
  				method: "POST",
  				data: JSON.stringify(no),
  				contentType: "application/json; charset=utf-8",
  				success(data){
  					console.log(data);
  					swal({
  			              title: "삭제완료",
  			              text: "",
  			              icon: "success"
  			            })
  					.then(function(){
  						location.href="${pageContext.request.contextPath}/funding/news.do?fundingNo="+fundingNo
  					});
  				},
  				error(xhr, statusText, err){
  					console.log(xhr, statusText, err);
  					swal("새소식 삭제실패", "", "warning")
  				}
  			});
          
  		});
		
	});
		
	</script>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
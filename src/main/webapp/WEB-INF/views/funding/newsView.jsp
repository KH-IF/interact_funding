<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" />
</jsp:include>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript"
	src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-60be12d9983015a6"></script>





<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/news.css" />

<div id="funding_tap">
	<ol>
		<li><a
			href="${pageContext.request.contextPath }/funding/fundingDetail.do?fundingNo=${funding.fundingNo}">스토리</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/funding/news.do?fundingNo=${funding.fundingNo}">새소식</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/community.do?fundingNo=${funding.fundingNo}">커뮤니티</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/supporter.do?fundingNo=${funding.fundingNo}o">서포터</a>
		</li>
	</ol>
</div>

<div id="funding_main">
	<div id="funding_main_image_and_content">
		<div id="nv-div">
			<%-- <c:forEach items="${newsList}" var="news"> --%>
				<div class="yh-nv-view">
					<input type="button" value="< 목록으로 이동" id="nv-view-btn" />
					<p>이벤트 | 오픈예정</p>
					<h2>${funboard.title}</h2>
					<p><fmt:formatDate value="${funboard.regDate}" pattern="yyyy-MM-dd hh:mm"/></p>
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

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

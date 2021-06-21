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
			href="${pageContext.request.contextPath }/funding/fundingDetail.do?fundingNo=${funding.fundingNo}">스토리</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/funding/news.do?fundingNo=${funding.fundingNo}">새소식</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/community.do?fundingNo=${funding.fundingNo}">커뮤니티</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/funding/supporter.do?fundingNo=${funding.fundingNo}">서포터</a>
		</li>
	</ol>
</div>

<div id="funding_main">
	<div id="funding_main_image_and_content">
		<div class="yh-view">
			<h2>새소식</h2>
		</div>
		<c:if test="${loginMember.memberNo == newsList[0].writerNo}">
			<input type="button" value="글쓰기" />
		</c:if>
		
		<div class="yh-containertable">
			<table class="yh-table">
				<c:forEach items="${newsList}" var="newsList">
					<tr>
						<td><a
							href="${pageContext.request.contextPath }/funding/newsView.do?fundingNo=${newsList.fundingNo}&no=${newsList.no}">
									<p><small>이벤트</small></p>
									<p>${newsList.title}</p>
									<p><small><fmt:formatDate value="${newsList.regDate}" pattern="yy-MM-dd"/></small></p>
									
						</a></td>
					</tr>
				</c:forEach>
			</table>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

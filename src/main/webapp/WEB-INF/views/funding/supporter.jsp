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
		<div class="yh-s-view">
			<h2>
				현재 이 프로젝트에 <br /> 298명의 참여가 이루어졌습니다.
			</h2>
		</div>
		<div class="yh-containertable">
			<table class="yh-s-table">
				<tr>
					<td>
						<p>id님이 펀딩으로 참여 하셨습니다.</p>
						<p>7시간전</p>
					</td>
				</tr>
				<tr>
					<td>
						<p>id님이 펀딩으로 참여 하셨습니다.</p>
						<p>7시간전</p>
					</td>
				</tr>
				<tr>
					<td>
						<p>id님이 펀딩으로 참여 하셨습니다.</p>
						<p>7시간전</p>
					</td>
				</tr>
				<tr>
					<td>
						<p>id님이 펀딩으로 참여 하셨습니다.</p>
						<p>7시간전</p>
					</td>
				</tr>
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

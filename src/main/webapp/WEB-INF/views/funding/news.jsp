<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/news.css" />
<body>
	<div>
		<section>
			<ol>
				<li><a href="${pageContext.request.contextPath }//">스토리</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/news.do">새소식</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/community.do">커뮤니티</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/supporter.do">서포터</a>
				</li>
			</ol>
			<div class="yh-container">
				<div class="yh-containerView">
					<div class="yh-view">
						<h2>새소식</h2>
					</div>
					<div class="yh-containertable">
						<table class="yh-table">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath }/funding/newsView.do">
										<div>
											<p>이벤트</p>
											<p>제목</p>
											<p>날짜 | 댓글</p>
										</div>
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="">
										<div>
											<p>이벤트</p>
											<p>제목</p>
											<p>날짜 | 댓글</p>
										</div>
									</a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="">
										<div>
											<p>이벤트</p>
											<p>제목</p>
											<p>날짜 | 댓글</p>
										</div>
									</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 펀딩 -->
				<div class="yh-funding">
					<div>
						<h2>10일 남음</h2>
						<h4>20% 달성</h4>
						<h4>100000000</h4>
						<h4>50</h4>
					</div>
					<div>
						<input type="button" value="펀딩하기" />
					</div>
					<div>
						<input type="button" value="좋아요" /> <input type="button"
							value="1:1 채팅" /> <input type="button" value="공유하기" />
					</div>
					<div class="yh-fundingStyle">
						<h4>10000원 펀딩</h4>
						<p>if 얼리버드 세트</p>
						<br /> <br /> <br /> <br /> <br />
						<p>제한수량 5개</p>
						<p>총 1개</p>
					</div>
					<div class="yh-fundingStyle">
						<h4>인기프로젝트</h4>
						<p>1.</p>
						<p>2.</p>
						<p>3.</p>
						<p>4.</p>
						<p>5.</p>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

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
				<li><a href="${pageContext.request.contextPath }/">스토리</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/news.do">새소식</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/community.do">커뮤니티</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/funding/supporter.do">서포터</a>
				</li>
			</ol>
			<div>
				<div class="yh-container">
					<div class="yh-containerView">
						<div class="yh-c-view">
							<p>서포터님!</p>
							<p>처음 메이커의 열정과 가치에 공감해주셨듯, 마지막까지 메이커를 응원해주세요.</p>
						</div>
						<div class="yh-FAQ">
							<p>이프에서 펀딩하는 방법이 궁금하다면?</p>
							<p>FAQ</p>
						</div>
						<div class="yh-c-containertable">
							<table class="yh-c-table">
								<tr>
									<td>
										<a href="">
											<div>
												<p>펀딩 했어요. 결제는 언제, 어떻게 진행되나요?</p>
											</div>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="">
											<div>
												<p>결제 실패 알림을 받았어요. 어떻게 해야하나요?</p>
											</div>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="">
											<div>
												<p>카드 결제가 진행된 후, 다른 카드로 변경할 수 있나요?</p>
											</div>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="">
											<div>
												<p>배송지나 옵션을 변경하고 싶어요.</p>
											</div>
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<input class="FAQB" type="button" value="더보기" />
										</div>
									</td>
								</tr>
							</table>
							
							<!-- 문의 -->
							<div class="inquire">
								<p>리워드, 배송 등 펀딩에 대해 궁금한 사항이 있다면?</p>
								<p>메이커에게 문의하기</p>
							</div>
							<div class="maker">
								<div class="maker-logo">
									<a href=""><img class="logoimg" src=""></a>
								</div>
								<div>
									<p>굿럭</p>
									<p>평균 응답 시간 5시간 이내</p>
								</div>
								<div>
									<input class="inquire-btn" type="button" value="문의하기" />
								</div>
							</div>
							
							<!-- 리뷰 -->
							<div class="review-top">
								<div>
									<p>응원 · 의견 · 체험리뷰</p>
									<p>펀딩 종료전에 남긴 글입니다.</p>
								</div>
								<div>
									<input type="button" value="글 남기기" />
								</div>
								<div>
									<input type="checkbox" name="" id="" />
									<label for="">체험리뷰</label>
								</div>
							</div>
							
							<!-- 댓글 -->
							<div class="yh-comment">
								<div>
									<strong>id</strong>
									<span>펀딩 참여자</span>
									<span>응원 · 17시간전</span>
								</div>
								<div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat laudantium aperiam totam aut magni voluptas perspiciatis sed ad quam ut molestiae ea eum doloremque blanditiis architecto rem laborum autem quae.</p>
								</div>
								<div>
									<input type="button" value="답글" />
								</div>
								<div class="yh-maker-comment">
									<div>
										<strong>id</strong>
										<span>메이커</span>
										<span>17시간전</span>
									</div>
									<div>
										<p>감사링!</p>
									</div>
								</div>
							</div>
							<div class="yh-comment">
								<div>
									<strong>id</strong>
									<span>펀딩 참여자</span>
									<span>응원 · 17시간전</span>
								</div>
								<div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat laudantium aperiam totam aut magni voluptas perspiciatis sed ad quam ut molestiae ea eum doloremque blanditiis architecto rem laborum autem quae.</p>
								</div>
								<div>
									<input type="button" value="답글" />
								</div>
								<div class="yh-maker-comment">
									<div>
										<strong>id</strong>
										<span>메이커</span>
										<span>17시간전</span>
									</div>
									<div>
										<p>감사링!</p>
									</div>
								</div>
							</div>
							<div class="yh-comment">
								<div>
									<strong>id</strong>
									<span>펀딩 참여자</span>
									<span>응원 · 17시간전</span>
								</div>
								<div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat laudantium aperiam totam aut magni voluptas perspiciatis sed ad quam ut molestiae ea eum doloremque blanditiis architecto rem laborum autem quae.</p>
								</div>
								<div>
									<input type="button" value="답글" />
								</div>
								<div class="yh-maker-comment">
									<div>
										<strong>id</strong>
										<span>메이커</span>
										<span>17시간전</span>
									</div>
									<div>
										<p>감사링!</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 펀딩 -->
					<div class="yh-c-funding">
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
						<div class="yh-c-fundingStyle">
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
			</div>
		</section>
	</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

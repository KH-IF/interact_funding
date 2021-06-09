<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index.css" />
<head>
<title>와디즈(Wadiz)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Ionicons Js 예제  -->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
</head>
<!--
 2021/ 06 / 07 일  메인 페이지 초안본 
 -->

<body>
	<div class="kiwon_cardbanner">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active">
				</li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">

					<img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_01.png"
						alt="Los Angeles" style="width: 100%">
					<div class="carousel-caption">
						<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
						<p class="carousel-caption-p">
							지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
						</p>
						<span class="carousel-caption-funding">투자</span>
					</div>
				</div>

				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_02.png"
						alt="Chicago" style="width: 100%;">
					<div class="carousel-caption">
						<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
						<p class="carousel-caption-p">
							지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
						</p>
						<span class="carousel-caption-funding">투자</span>
					</div>
				</div>

				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_03.png"
						alt="New York" style="width: 100%;">
					<div class="carousel-caption">
						<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
						<p class="carousel-caption-p">
							지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
						</p>
						<span class="carousel-caption-funding">투자</span>
					</div>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="kiwonfunding">
		<!-- loginMember 로그인시 기억해두기 -->
		<h1>이 프로젝트 어때요?</h1>
		<!-- 펀딩하기 -->
		<form action="">
		<div class="kiwonfunding-div">
			<!-- 펀딩하기 첫번째 img-->
			<div class="kiwonfunding-div-img1">
				<a href="${pageContext.request.contextPath }/" class="funding_class">
					<!--240 x 134 px--> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_04.png"
					alt="">
				</a>
				<p class="funding_class-p">
					[모슈] 장시간보온보냉!넘어져도 새지<br> 않는 실리콘 스트로우 텀블러
				</p>
				<p class="kiwonfunding-percnt">260%</p>
			</div>
			<div class="kiwonfunding-div-img2">
				<!-- 펀딩하기 두번째 img-->
				<a href="${pageContext.request.contextPath }/" class="funding_class">
					<!--240 x 134 px--> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_05.png">
				</a>
				<p class="funding_class-p">
					[고기 안구워도 돼요] 캠핑 바베큐를 <br> 즐기는 새로운 방법 '몽바'
				</p>
				<p class="kiwonfunding-percnt">280%</p>
			</div>
			<div class="kiwonfunding-div-img3">
				<a href="${pageContext.request.contextPath }/" class="funding_class">
					<!--240 x 134 px--> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images//sample_images_06.png">
				</a>
				<p class="funding_class-p">
					[밀키트 산업 투자] 마켓컬리 <br> 일절| 신용보증기금 매칭투자 2호
				</p>
				<p class="kiwonfunding-percnt">270%</p>
			</div>
			<!-- 기획전  240 x 134 px -->
			<div class="kiwonfunding-div-img4">
				<!--  오른쪽 아래 -->
				<a href="${pageContext.request.contextPath }/"
					class="funding_class4"> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_07.png">
				</a>
				<p class="funding_class-p1">
					[밀키트 산업 투자] 마켓컬리 <br> 일절| 신용보증기금 매칭투자 2호
				</p>
				<p class="kiwonfunding-percnt1">270%</p>
			</div>

			<!-- 이미지 사이즈 240 x 134px -->
			<div class="kiwonfunding-div-img5">
				<a href="${pageContext.request.contextPath }/" class="funding_class">
					<img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_08.png"
					width="240px" height="134px">
				</a>
				<!-- 진행중 고정-->
				<span class="funding_class_Planning">진행중</span> <span
					class="funding_class_Title">[향수펀딩]놓치면 아쉬운 종료 <br /> 임박 향수
					펀딩 ' 향수'
				</span>
				<p class="kiwonfunding-percnt2">532%</p>
			</div>
			<!-- 이미지 사이즈 240 x 134px -->
			<div class="kiwonfunding-div-img6">
				<a href="${pageContext.request.contextPath }/" class="funding_class">
					<img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_10.png"
					width="240px" height="134px">
				</a>
				<p style="line-height: 23px; margin-top: 0.7vw;">
					[코인펀딩] 놓치면 아쉬움종료 임박<br /> 코인펀딩 '코인펀딩'
				</p>
				<p class="kiwonfunding-percnt2">70%</p>
			</div>
		</div>
		<div class="funding_class_btn">
			<button class="funding_class_btn_Plan" type="button">
				<!-- 링크투명화 -->
				<a href="${pageContext.request.contextPath }/"
					style="text-decoration: none;"> <!-- 링크 투명화  --> <span
					style="color: #000000;"> <img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/refresh-outline.svg"
						width="20px" height="20px" alt="">추천더보기 <span
						class="funding_class_btn_Number">1</span> <!--3번  api 새로고침 예제  -->
				</span>
				</a>
			</button>
		</div>
	</div>
</form>
	<!--실시간 랭킹 TOP 5 순위보이기-->
	<div class="kiwon_Ranking">
		<h1>실시간 랭킹</h1>
		<!--펀딩하기 btn-->
		<div class="kiwon_Ranking-funding">
			<!-- 펀딩하기 DB -->
			<a href="${pageContext.request.contextPath }/ "
				style="color: #000000;">
				<button class="kiwon_Rankingbtn-funding" type="button">펀딩하기</button>
			</a>
		</div>
		<!--투자하기 btn-->
		<div class="kiwon_Ranking-invest">
			<!-- 투자하기 DB -->
			<!-- 링크 투명화 -->
			<a href="${pageContext.request.contextPath }/ "
				style="color: #000000;">
				<button class="kiwon_Rankingbtn-invest" type="button">투자하기</button>
			</a> <span class="kiwon_Ranking_badge">진행중</span>
		</div>

		<div class="TabList" style="position: relative;">
			<div class="TabList_item">
				<div>
					<!-- 실시간 랭킹 pageBar 이용예정(첫번째 게시글) Start  -->
					<a class="TabList_projectCard"
						href="${pageContext.request.contextPath}/">
						<article>
							<!--CardType article-->
							<div class="commons_CardType">
								<!-- 실시간 순위 체크 공간 DB공간체크 -->
								<div class="orderText" style="font-weight: 700;">
									<span class="orderText-span">1.</span> [앵콜펀딩] 9031%달성,<br />소주달게하는
									NEW호락이 돌아왔다
									<p class="kiwonRanking_percnt">25,373%</p>
									<div class="kiwonRanking_image">
										<!-- 94x63 픽셀 지정 --->

										<img
											src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
											style="width: 75px; height: 63px" />

									</div>
								</div>
							</div>
						</article>
					</a> <a class="TabList_projectCard"
						href="${pageContext.request.contextPath}/">
						<article>
							<!--CardType article-->
							<div class="commons_CardType">
								<!-- 실시간 순위 체크 공간 DB공간체크 -->
								<div class="orderText" style="font-weight: 700;">
									<span class="orderText-span">2.</span> [앵콜펀딩] 9031%달성,<br />소주달게하는
									NEW호락이 돌아왔다
									<p class="kiwonRanking_percnt">25,373%</p>
									<div class="kiwonRanking_image">
										<!-- 94x63 픽셀 지정 --->

										<img
											src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
											style="width: 75px; height: 63px" />

									</div>
								</div>
							</div>
						</article>
					</a> <a class="TabList_projectCard"
						href="${pageContext.request.contextPath}/">
						<article>
							<!--CardType article-->
							<div class="commons_CardType">
								<!-- 실시간 순위 체크 공간 DB공간체크 -->
								<div class="orderText" style="font-weight: 700;">
									<span class="orderText-span">3.</span> [앵콜펀딩] 9031%달성,<br />소주달게하는
									NEW호락이 돌아왔다
									<p class="kiwonRanking_percnt">25,373%</p>
									<div class="kiwonRanking_image">
										<!-- 94x63 픽셀 지정 --->

										<img
											src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
											style="width: 75px; height: 63px" />
									</div>
								</div>
							</div>
						</article>
					</a> <a class="TabList_projectCard"
						href="${pageContext.request.contextPath}/">
						<article>
							<!--CardType article-->
							<div class="commons_CardType">
								<!-- 실시간 순위 체크 공간 DB공간체크 -->
								<div class="orderText" style="font-weight: 700;">
									<span class="orderText-span">4.</span> [앵콜펀딩] 9031%달성,<br />소주달게하는
									NEW호락이 돌아왔다
									<p class="kiwonRanking_percnt">25,373%</p>
									<div class="kiwonRanking_image">
										<!-- 94x63 픽셀 지정 --->

										<img
											src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
											style="width: 75px; height: 63px" />
									</div>
								</div>
							</div>
						</article>
					</a> <a class="TabList_projectCard"
						href="${pageContext.request.contextPath}/">
						<article>
							<!--CardType article-->
							<div class="commons_CardType">
								<!-- 실시간 순위 체크 공간 DB공간체크 -->
								<div class="orderText" style="font-weight: 700;">
									<span class="orderText-span">5.</span> [앵콜펀딩] 9031%달성,<br />소주달게하는
									NEW호락이 돌아왔다
									<p class="kiwonRanking_percnt">25,373%</p>
									<div class="kiwonRanking_image">
										<!-- 94x63 픽셀 지정 --->

										<img
											src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
											style="width: 75px; height: 63px" />

									</div>
								</div>
							</div>
						</article>
					</a>
					<!--  실시간랭킹 PageBar (첫번째 게시글)  end   -->
				</div>
			</div>
		</div>
	</div>
	<!-- 얼리버드 Container  Start-->
	<div class="Earlybird_Container">
		<!--  -->
		<h1 class="Earlybird_Container-h1">얼리버드</h1>
		<p class="Earlybird_Container-p">먼저 참여하시는분들께 드리는 얼리버드 혜택</p>
	</div>
	<!--  스크립트 페이징 처리 얼리버드 1~4 페이지 예정 -->
	<!--  pointer 마우스 손모양 처리,padding-bottom: 60px; footer 전 부분 60px 추가 -->
	<div class="Ealrybird_Paging"
		style="cursor: pointer; padding-bottom: 60px;">
		<div class="Ealrytbird_previous">
			<!-- 이전 페이지 -->
			<ion-icon name="chevron-back-outline" class="Ealrytbird_btn"></ion-icon>
			<!-- display:contents  display:inline 속성과 동일 -->
			<ul style="list-style: none; text-align: center;">
				<!--  1번페이지 -->
				<li
					style="padding-left: 7px; margin-right: 7px; display: inline-block;">
					<!--얼리버드 페이지 DB api 예정 --> <a
					href="${pageContext.request.contextPath }/">
						<button class="Ealrybird_page_btn" style="cursor: pointer;">1
						</button>
				</a>
				</li>
				<li
					style="padding-left: 7px; margin-right: 7px; display: inline-block;">
					<!--얼리버드 페이지 DB api 예정 --> <a
					href="${pageContext.request.contextPath }/">
						<button class="Ealrybird_page_btn" style="cursor: pointer;">2
						</button>
				</a>
				</li>
				<li
					style="padding-left: 7px; margin-right: 7px; display: inline-block;">
					<!--얼리버드 페이지 DB api 예정 --> <a
					href="${pageContext.request.contextPath }/">
						<button class="Ealrybird_page_btn" style="cursor: pointer;">3
						</button>
				</a>
				</li>
				<li
					style="padding-left: 7px; margin-right: 7px; display: inline-block;">
					<!--얼리버드 페이지 DB api 예정 --> <a
					href="${pageContext.request.contextPath }/">
						<button class="Ealrybird_page_btn" style="cursor: pointer;">4
						</button>
				</a>
				</li>
			</ul>
			<!-- 이후 페이지  -->
			<ion-icon name="chevron-forward-outline"
				class="Ealrybird_btn_outline"></ion-icon>
		</div>
		<div class="EalrybirdTag_Container" style="padding-top: 20px;">
			<ul style="list-style: none; display: flex;">
				<!--  얼리버드 1번 li -->
				<li>
					<div class="EalrybirdCard">
						<!-- 얼리버드 세부펀딩 페이지이동  -->
						<a href="${pageContext.request.contextPath }/">
							<div class="EalrybirdCard_img">
								<!-- ::before -->
								<span> <!-- img 추가 405x229 px --> <img
									src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_01.png"
									alt="Los Angeles" style="width: 390px; height: 229px;">
								</span>
							</div>
						</a>
					</div> <!-- 얼리버드 펀딩 내용 부분  -->
					<div class="EarlybirdCard_Type">
						<div>
							<p class="EarlybirdCard_Type-p">펀딩</p>
						</div>
						<div>
							<h1 class="EalrybirdCard_Type_h1">써본사람은 안다! 이게 왜필요한지. 아이폰12
								유저를 위한 [맥그립]</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span">532%</span>
								<!-- after  -->
							</p>
						</div>
						<div class="cardType_earlybordContent">
							<h2 class="cardType_earlybordContent-h2">[패밀리 얼리버드] 36%가격혜택</h2>
							<p style="font-size: 12px; font-weight: 500;">-ION BRONCO
								턴테이블 5개</p>
							<p style="font-size: 13px; font-weight: 700;">49,000원</p>
						</div>
						<div>
							<p class="cardType_earlybordContent-p">
								지금 참여하기
								<ion-icon name="chevron-forward-outline"></ion-icon>
							</p>
						</div>

					</div>
				</li>
				<!--  중간 padding  -->
				<li style="padding: 0px 33px;">
					<div class="EalrybirdCard">
						<!-- 얼리버드 세부펀딩 페이지이동  -->
						<a href="${pageContext.request.contextPath }/">
							<div class="EalrybirdCard_img">
								<!-- ::before -->
								<span> <!-- img 추가 390x229 px --> <img
									src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_02.png"
									alt="Los Angeles" style="width: 390px; height: 229px;">
								</span>
							</div>
						</a>
					</div> <!-- 얼리버드 펀딩 내용 부분  -->
					<div class="EarlybirdCard_Type">
						<div>
							<p class="EarlybirdCard_Type-p">펀딩</p>
						</div>
						<div>
							<h1 class="EalrybirdCard_Type_h1">배기원의 하루 10분 영어. 두달이면 외국인과
								프리토킹!</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span">532%</span>
								<!-- after  -->
							</p>
						</div>
						<div class="cardType_earlybordContent">
							<h2 class="cardType_earlybordContent-h2">[패밀리 얼리버드] 36%가격혜택</h2>
							<p style="font-size: 12px; font-weight: 500;">-ION BRONCO
								턴테이블 5개</p>
							<p style="font-size: 13px; font-weight: 700;">49,000원</p>
						</div>
						<div>
							<p class="cardType_earlybordContent-p">
								지금 참여하기
								<ion-icon name="chevron-forward-outline"></ion-icon>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="EalrybirdCard">
						<!-- 얼리버드 세부펀딩 페이지이동  -->
						<a href="${pageContext.request.contextPath }/">
							<div class="EalrybirdCard_img">
								<!-- ::before -->
								<span> <!-- img 추가 405x229 px --> <img
									src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_03.png"
									alt="Los Angeles" style="width: 390px; height: 229px;">
								</span>
							</div>
						</a>
					</div> <!-- 얼리버드 펀딩 내용 부분  -->
					<div class="EarlybirdCard_Type">
						<div>
							<p class="EarlybirdCard_Type-p">펀딩</p>
						</div>
						<div>
							<h1 class="EalrybirdCard_Type_h1">배기원의 하루 10분 영어. 두달이면 외국인과
								프리토킹!</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span">532%</span>
								<!-- after  -->
							</p>
						</div>
						<div class="cardType_earlybordContent">
							<h2 class="cardType_earlybordContent-h2">[패밀리 얼리버드] 36%가격혜택</h2>
							<p style="font-size: 12px; font-weight: 500;">-ION BRONCO
								턴테이블 5개</p>
							<p style="font-size: 13px; font-weight: 700;">49,000원</p>
						</div>
						<div>
							<p class="cardType_earlybordContent-p">
								지금 참여하기
								<ion-icon name="chevron-forward-outline"></ion-icon>
							</p>
						</div>

					</div>
				</li>
			</ul>
		</div>
		<div></div>
	</div>
	<!-- 얼리버드 Container  end-->
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

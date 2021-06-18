<%@page import="java.net.URLDecoder"%>
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
<!-- Ionicons Js 예제  -->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

<script>
/* 실시간랭킹  hide show  예제*/
 $.ajax({
				url:"${pageContext.request.contextPath}/funding/fundinglike",
				success:(data) =>{
					console.log(data);
					
				},
				error: (xhr, statusText, err) => {
					console.log(xhr, statusText, err);
				}
			});
function showForI(){
		 if($('input:radio[name=ranking-btn]').is(':checked')){
			$("#fundingZone").hide();
			$("#likeZone").css('display','block');
			
		}
		 else{
			$("#fundingZone").show();
			$("#likeZone").css('display','none');
			 }
	} 

function Refresh(){
$.ajax({
	url:"${pageContext.request.contextPath}/funding/fundingRefresh",
	success:function(json) {
		console.log(json);
		 $('#kiwonfunding').empty();
		 $('#kiwonfunding-1').empty();
		 var html = '';
		        html = $('<div class="kiwonfunding-div" id="kiwonfunding">' +
				        '<div class="kiwonfunding-div-img1">'+
				        '<a href="${pageContext.request.contextPath }/" class="funding_class">'+
				        ' <img src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_04.png"alt="">'
				        +'</a>'+'<p class="funding_class-p">'+'</p>'+' <div class="progress">'+' <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 20%" aria-valuenow="10" aria-valuemin="0"aria-valuemax="100">'
						+'</div>' +'</div>'+'<p class="kiwonfunding-percent">'+ '%'+'<span class="kiwonfunding-percent-after">'+'</span>'+'</p>'+'</div>'+'<div class="kiwonfunding-div-img2">'+ '<a href="${pageContext.request.contextPath }/" class="funding_class">'
						+'<img src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_05.png">'+'</a>'+'<p class="funding_class-p">'+'</p>'+'<div class="progress">'+'<div class="progress-bar progress-bar-striped" value=""role="progressbar" style="width: 20%" aria-valuenow="10"aria-valuemin="0" aria-valuemax="100">'+
						'</div>'+'</div>'+'<p class="kiwonfunding-percent">'+'%'+'<span class="kiwonfunding-percent-after"'+'</span>'+'</p>'+'</div>'+'<div class="kiwonfunding-div-img3">'+'<a href="${pageContext.request.contextPath }/" class="funding_class">'+'<img src="${pageContext.request.contextPath}/resources/images/kiwon_images//sample_images_06.png">'+
						'</a>'+'<p class="funding_class-p">'+'</p>'+'<div class="progress">'+'<div class="progress-bar progress-bar-striped" value=""role="progressbar" style="width: 20%" aria-valuenow="10" a0ria-valuemin="0" aria-valuemax="100">'+'</div>'+'</div>'+'<p class="kiwonfunding-percent">'+'%'+'<span class="kiwonfunding-percent-after">'+'</span>'+'</p>'+'</div>'+'</div>');
		        $('#kiwonfunding').append(html);
		  var html1='';
		  	html1=$('<div class="kiwonfunding-1" id="kiwonfunding-1">'+'<div class="kiwonfunding-div-img4">'+
				  	'<a href="${pageContext.request.contextPath }/" class="funding_class4">'+'<img src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_07.png">'+'</a>'+'<p class="funding_class-p1">'+'</p>'
				  	+'<div class="progress">'+'<div class="progress-bar progress-bar-striped" value=""role="progressbar" style="width: 20%" aria-valuenow="10"aria-valuemin="0" aria-valuemax="100">'+'</div>'+'</div>'+'<p class="kiwonfunding-percent">'+'%'+' <span class="kiwonfunding-percent-after">'+'</span>'+'</p>'+'</div>'
				  	+'<div class="kiwonfunding-div-img5">'+'<a href="${pageContext.request.contextPath }/" class="funding_class">'+'<img src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_08.png"width="240px" height="134px">'+'</a>'+'<p class="funding_class-p1">'+'</p>'+'<div class="progress">'+'<div class="progress-bar progress-bar-striped" value="" role="progressbar" style="width: 20%" aria-valuenow="10"aria-valuemin="0" aria-valuemax="100">'
				  	+'</div>'+'</div>'+'<p class="kiwonfunding-percent">'+'%'+'<span class="kiwonfunding-percent-after">'+'</span>'+'</p>'+'</div>'+'</div>'+'<div class="kiwonfunding-div-img6">'+'<a href="${pageContext.request.contextPath }/" class="funding_class">'
				  	+'<img src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_10.png"width="240px" height="134px">'+'</a>'+'<p class="funding_class-p1">'+'</p>'+'<div class="progress">'+'<div class="progress-bar progress-bar-striped" value="" role="progressbar" style="width: 20%" aria-valuenow="10"aria-valuemin="0" aria-valuemax="100">'+'</div>'+'</div>'+'<p class="kiwonfunding-percent">'+'%'+'<span class="kiwonfunding-percent-after">'+'</span>'+'</p>'+'<button type="button" id="button" class="btn btn-light" onclick="Refresh()"style="position: relative; left: 60%; padding: 12px; font-weight: 700;">'+'<ion-icon name="refresh-outline">'+'</ion-icon>'
				  	+'새로고침'+'</button>'+'</div>'+'</div>'
				  	);
		  		$('#kiwonfunding-1').append(html1);
	},
	error: (xhr, statusText, err) => {
		console.log(xhr, statusText, err);

	}
});
}
</script>

<script>
	//3개씩 이동
 var Earlybirdbox =3;
 function right(){
	if(Earlybirdbox >= 1 && Earlybirdbox <=3){
		$("#EalrybirdTag_Container").attr("style","transform:translateX("+(-240)*(Earlybirdbox++)+"px);")
		}
	 }
 function left(){
 	if(Earlybirdbox >=2 && Earlybirdbox <=4){
 		$("#EalrybirdTag_Container").attr("style","transform:translateX("+(-240)*(--Earlybirdbox-1)+"px);")
 	 	}
	 } 
</script>

<div class="kiwon_cardbanner">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_01.png"
					alt="First slide">
				<div class="carousel-caption">
					<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
					<p class="carousel-caption-p">
						지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
					</p>
					<span class="carousel-caption-funding">투자</span>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_02.png"
					alt="Second slide">
				<div class="carousel-caption">
					<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
					<p class="carousel-caption-p">
						지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
					</p>
					<span class="carousel-caption-funding">투자</span>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_03.png"
					alt="Third slide">
				<div class="carousel-caption">
					<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
					<p class="carousel-caption-p">
						지진으로 부터 안전한나라 <br> 정부기관 절찬리 납품 중!
					</p>
					<span class="carousel-caption-funding">투자</span>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>
<div>${likeList}</div>
<div class="bd-sidebar-body">
	<h1>실시간 랭킹</h1>
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-secondary active"> <input type="radio"
			name="ranking-btn" id="funding" checked onchange="showForI()">
			펀딩하기
		</label>

	</div>
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-secondary active"> <input type="radio"
			name="ranking-btn" id="invest" checked onchange="showForI()">
			좋아요
		</label> <span class="kiwon_Ranking_badge">진행중</span>
	</div>
	<ul class="nav" id="fundingZone">
		<li style="font-weight: 700;"><a
			href="${pageContext.request.contextPath}/ " style="color: #000000;">
				<span class="orderText-span">1. <c:forEach
						items="${list}" varStatus="vs" var="funding">
						<c:if test="${vs.count==1}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>
		</a></li>
		<li style="font-weight: 700;"><a
			href="${pageContext.request.contextPath }/ " style="color: #000000;">
				<span class="orderText-span">2. <c:forEach items="${list}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==2}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>

		<li style="font-weight: 700;"><a> <span
				class="orderText-span">3. <c:forEach items="${list}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==3}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>
		</a></li>
		<li style="font-weight: 700;"><a> <span
				class="orderText-span">4. <c:forEach items="${list}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==4}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>
		<li style="font-weight: 700;"><a> <span
				class="orderText-span">5. <c:forEach items="${list}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==5}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>

	</ul>
	<!-- likeZone -->
	<ul class="nav" id="likeZone" style="display: none;">
		<li style="font-weight: 700;"><a
			href="${pageContext.request.contextPath }/ " style="color: #000000;">
				<span class="orderText-span">1. <c:forEach
						items="${likelist}" varStatus="vs" var="funding">
						<c:if test="${vs.count==1}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>
		</a></li>
		<li style="font-weight: 700;"><a
			href="${pageContext.request.contextPath }/ " style="color: #000000;">
				<span class="orderText-span">2. <c:forEach
						items="${likelist}" varStatus="vs" var="funding">
						<c:if test="${vs.count==2}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>

		<li style="font-weight: 700;"><a> <span
				class="orderText-span">3. <c:forEach items="${likelist}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==3}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>
		</a></li>
		<li style="font-weight: 700;"><a> <span
				class="orderText-span">4. <c:forEach items="${likelist}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==4}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>
		<li style="font-weight: 700;"><a> <span
				class="orderText-span">5. <c:forEach items="${likelist}"
						varStatus="vs" var="funding">
						<c:if test="${vs.count==5}">
							<p class="Ranking_class-p1">${funding.title}</p>
							<p class="kiwonRanking_percent">
								<fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" />
								%<span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</p>
						</c:if>
					</c:forEach> <!-- 94x63 픽셀 지정 ---> <img
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_09.png"
					style="width: 75px; height: 63px" />
			</span>

		</a></li>

	</ul>
</div>
<br>

<div class="kiwonfunding">
	<!-- 로그인 안되었을때-->
	<c:if test="${empty loginMember}">
		<h1>프로젝트 어때요?</h1>
	</c:if>
	<!-- 로그인 되었을때 -->
	<c:if test="${not empty loginMember}">
		<h1>${loginMember.name}님이프로젝트 어때요?</h1>
	</c:if>

	<!-- 펀딩하기 -->
	<div class="kiwonfunding-div" id="kiwonfunding">
		<!-- 펀딩하기 첫번째 img-->

		<div class="kiwonfunding-div-img1">
			<a href="${pageContext.request.contextPath }/" class="funding_class">

				<!--240 x 134 px--> <img
				src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_04.png"
				alt="">
			</a>
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:if test="${vs.count==1}">
					<p class="funding_class-p">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" role="progressbar"
							style="width: 20%" aria-valuenow="10" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<p class="kiwonfunding-percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						% <span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach>
		</div>

		<div class="kiwonfunding-div-img2">
			<!-- 펀딩하기 두번째 img-->
			<a href="${pageContext.request.contextPath }/" class="funding_class">
				<!--240 x 134 px--> <img
				src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_05.png">
			</a>
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:if test="${vs.count==2}">
					<p class="funding_class-p">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" value=""
							role="progressbar" style="width: 20%" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<p class="kiwonfunding-percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						% <span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach>
		</div>
		<div class="kiwonfunding-div-img3">
			<a href="${pageContext.request.contextPath }/" class="funding_class">
				<!--240 x 134 px--> <img
				src="${pageContext.request.contextPath}/resources/images/kiwon_images//sample_images_06.png">
			</a>
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:if test="${vs.count==3}">
					<p class="funding_class-p">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" value=""
							role="progressbar" style="width: 20%" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<p class="kiwonfunding-percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						% <span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach>
		</div>
		<!-- 기획전  240 x 134 px -->
	</div>
</div>
<div class="kiwonfunding-1" id="kiwonfunding-1">
	<div class="kiwonfunding-div-img4">
		<!--  오른쪽 아래 -->
		<a href="${pageContext.request.contextPath }/" class="funding_class4">
			<img
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_07.png">
		</a>
		<c:forEach items="${list}" varStatus="vs" var="funding">
			<c:if test="${vs.count==4}">
				<p class="funding_class-p1">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" value=""
							role="progressbar" style="width: 20%" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				<p class="kiwonfunding-percent">
					<fmt:formatNumber
						value="${funding.nowAmount/funding.goalAmount*100}"
						pattern="##.###" />
					% <span class="kiwonfunding-percent-after">
						${funding.categoryCode}</span>
				</p>
			</c:if>
		</c:forEach>

	</div>

	<!-- 이미지 사이즈 240 x 134px -->
	<div class="kiwonfunding-div-img5">
		<a href="${pageContext.request.contextPath }/" class="funding_class">
			<img
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_08.png"
			width="240px" height="134px">
		</a>
		<c:forEach items="${list}" varStatus="vs" var="funding">
			<c:if test="${vs.count==5}">
				<p class="funding_class-p1">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" value=""
							role="progressbar" style="width: 20%" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				<p class="kiwonfunding-percent">
					<fmt:formatNumber
						value="${funding.nowAmount/funding.goalAmount*100}"
						pattern="##.###" />
					% <span class="kiwonfunding-percent-after">
						${funding.categoryCode}</span>
				</p>
			</c:if>
		</c:forEach>
	</div>
	<!-- 이미지 사이즈 240 x 134px -->
	<div class="kiwonfunding-div-img6">
		<a href="${pageContext.request.contextPath }/" class="funding_class">
			<img
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_10.png"
			width="240px" height="134px">
		</a>
		<c:forEach items="${list}" varStatus="vs" var="funding">
			<c:if test="${vs.count==6}">
				<p class="funding_class-p1">${funding.title}</p>
					<div class="progress">
						<div class="progress-bar progress-bar-striped" value=""
							role="progressbar" style="width: 20%" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				<p class="kiwonfunding-percent">
					<fmt:formatNumber
						value="${funding.nowAmount/funding.goalAmount*100}"
						pattern="##.###" />
					% <span class="kiwonfunding-percent-after">
						${funding.categoryCode}</span>
				</p>
			</c:if>
		</c:forEach>
		<button type="button" id="button" class="btn btn-light" onclick="Refresh()"
			style="position: relative; left: 60%; padding: 12px; font-weight: 700;">
			<ion-icon name="refresh-outline"></ion-icon>
			새로고침
		</button>
	</div>
</div>

<p class="p-likeProject">
	회원들이 <span style="color: #00a2a2;">좋아할</span> 프로젝트
</p>
<div class="likeProject">
	<div class="card" style="width: 18rem; margin-right: 1vw">
		<img class="card-img-top"
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_05.png"
			alt="Card image cap">
		<div class="card-body" id="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:if test="${vs.count==1}">
						<p class="card-text-p">${funding.title}</p>
						<p class="card-text-p1">
							<fmt:formatNumber
								value="${funding.nowAmount/funding.goalAmount*100}"
								pattern="##.###" />
							%<span class="card-text-span"> ${funding.categoryCode}</span>
						</p>
					</c:if>
				</c:forEach>
			</p>
		</div>
	</div>
	<div class="card" style="width: 18rem; margin-right: 1vw">
		<img class="card-img-top"
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_06.png"
			alt="Card image cap">
		<div class="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:if test="${vs.count==2}">
						<p class="card-text-p">${funding.title}</p>
						<p class="card-text-p1">
							<fmt:formatNumber
								value="${funding.nowAmount/funding.goalAmount*100}"
								pattern="##.###" />
							%<span class="card-text-span"> ${funding.categoryCode}</span>
						</p>
					</c:if>
				</c:forEach>
			</p>
		</div>
	</div>
	<div class="card" style="width: 18rem; margin-right: 1vw">
		<img class="card-img-top"
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_07.png"
			alt="Card image cap">
		<div class="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:if test="${vs.count==3}">
						<p class="card-text-p">${funding.title}</p>
						<p class="card-text-p1">
							<fmt:formatNumber
								value="${funding.nowAmount/funding.goalAmount*100}"
								pattern="##.###" />
							%<span class="card-text-span"> ${funding.categoryCode}</span>
						</p>
					</c:if>
				</c:forEach>
			</p>
		</div>
	</div>
	<div class="card" style="width: 18rem; margin-right: 1vw">
		<img class="card-img-top"
			src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_05.png"
			alt="Card image cap">
		<div class="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:if test="${vs.count==4}">
						<p class="card-text-p">${funding.title}</p>
						<p class="card-text-p1">
							<fmt:formatNumber
								value="${funding.nowAmount/funding.goalAmount*100}"
								pattern="##.###" />
							%<span class="card-text-span"> ${funding.categoryCode}</span>
						</p>
					</c:if>
				</c:forEach>
			</p>
		</div>
	</div>
</div>
<!-- 얼리버드 Container  Start-->
<div class="Earlybird_Container">
	<!--  -->
	<h1 class="Earlybird_Container-h1">얼리버드</h1>
	<p class="Earlybird_Container-p">먼저 참여하시는분들께 드리는 얼리버드 혜택</p>
</div>
<!--  구현예정중  -->
<div class="Ealrybird_Paging">
	<div class="btn-group" role="group" aria-label="Third group">
		<button type="button" class="btn btn-secondary" onclick="left()">
			&lt</button>
	</div>
	<div class="btn-group" role="group" aria-label="Third group">
		<button type="button" class="btn btn-secondary" onclick="right()">
			&gt</button>
	</div>
</div>
<!--  얼리버드 -->
<div class="EalrybirdTag_Container" style="padding-top: 20px;">
	<ul style="list-style: none; display: flex;">
		<!--  얼리버드 1번 li -->
		<li>
			<div class="EalrybirdCard">
				<!-- 얼리버드 세부펀딩 페이지이동  -->
				<a href="${pageContext.request.contextPath }/"> <!-- ::before -->
					<span> <!-- img 추가 405x229 px --> <img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_01.png"
						alt="Los Angeles" style="width: 390px; height: 229px;">
				</span>
				</a>
			</div> <!-- 얼리버드 펀딩 내용 부분  -->
			<div class="EarlybirdCard_Type">
				<div>
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:set var="test" value="0" />
						<c:if test="${vs.count %3 ==0}">
							<p class="EarlybirdCard_Type-p">${funding.title}</p>
						</c:if>
					</c:forEach>
				</div>
				<div>
					<c:set var="test" value="0" />
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:if test="${vs.count eq 1}">

							<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
										value="${funding.nowAmount/funding.goalAmount*100}"
										pattern="##.###" /> % <span
									class="kiwonfunding-percent-after">
										${funding.categoryCode}</span>
								</span>
								<!-- after  -->
							</p>
						</c:if>
					</c:forEach>
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
				<a href="${pageContext.request.contextPath }/"> <!-- ::before -->
					<span> <!-- img 추가 390x229 px --> <img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_02.png"
						alt="Los Angeles" style="width: 390px; height: 229px;">
				</span>
				</a>
			</div> <!-- 얼리버드 펀딩 내용 부분  -->
			<div class="EarlybirdCard_Type">
				<div>
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:set var="test" value="0" />
						<c:if test="${vs.count %3 ==0}">
							<p class="EarlybirdCard_Type-p">${funding.title}</p>
						</c:if>
					</c:forEach>
				</div>
				<div>
					<c:set var="test" value="0" />
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:if test="${vs.count eq 2}">

							<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
										value="${funding.nowAmount/funding.goalAmount*100}"
										pattern="##.###" /> % <span
									class="kiwonfunding-percent-after">
										${funding.categoryCode}</span>
								</span>
								<!-- after  -->
							</p>
						</c:if>
					</c:forEach>
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
				<a href="${pageContext.request.contextPath }/"> <!-- ::before -->
					<span> <!-- img 추가 405x229 px --> <img
						src="${pageContext.request.contextPath}/resources/images/kiwon_images/sample_images_03.png"
						alt="Los Angeles" style="width: 390px; height: 229px;">
				</span>
				</a>
			</div> <!-- 얼리버드 펀딩 내용 부분  -->
			<div class="EarlybirdCard_Type">
				<div>
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:set var="test" value="0" />
						<c:if test="${vs.count %3 ==0}">
							<p class="EarlybirdCard_Type-p">${funding.title}</p>
						</c:if>
					</c:forEach>
				</div>
				<div>
					<c:set var="test" value="0" />
					<c:forEach items="${earlylist}" begin="0" step="1" end="2"
						varStatus="vs" var="funding">
						<c:if test="${vs.count eq 3}">

							<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
							<p class="EalrybirdCard_percent">
								<!--DB 사용예제! -->
								<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
										value="${funding.nowAmount/funding.goalAmount*100}"
										pattern="##.###" /> % <span
									class="kiwonfunding-percent-after">
										${funding.categoryCode}</span>
								</span>
								<!-- after  -->
							</p>
						</c:if>
					</c:forEach>
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
<!-- 이미지 배너 부분  -->
<div class="image-banner">
	<h1 class="image-banner-h1">이프에서 프로젝트 오픈하기</h1>
	<span class="image-banner-span">당신의 이야기를 소개하고 투자자와 서포터를 만나보세요</span>
	<button type="button" class="btn btn-secondary btn-lg"
		style="position: absolute; left: 40%; top: 60%; padding: 0.9vw; padding-inline: 2vw;"
		onclick="openProject();">
		바로가기
		<ion-icon name="arrow-forward-outline"></ion-icon>
	</button>
	<img
		src="${pageContext.request.contextPath}/resources/images/kiwon_images/index(human).jpg"
		class="img-fluid" alt="Responsive image" style="height: 318px;">
</div>

<!-- 얼리버드 Container  end-->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
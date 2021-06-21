<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.interactFunding.funding.model.vo.Funding"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
<%
List<Funding> list = (List) request.getAttribute("list");
for(Funding funding: list){
	String cCode = funding.getCategoryCode();
	switch (cCode) {
	case "C1":
		funding.setCategoryCode("테크·가전");
		break;
	case "C2":
		funding.setCategoryCode("푸드");
		break;
	case "C3":
		funding.setCategoryCode("여행");
		break;
	case "C4":
		funding.setCategoryCode("스포츠");
		break;
	case "C5":
		funding.setCategoryCode("게임·취미");
		break;
	case "C6":
		funding.setCategoryCode("모임");
		break;
	case "C7":
		funding.setCategoryCode("반려동물");
		break;
	case "C8":
		funding.setCategoryCode("기부·후원");
		break;
	default:
		funding.setCategoryCode("잘못된 카테고리");
		break;
	}
}

List<Funding> Rankinglist = (List) request.getAttribute("Rankinglist");
for(Funding funding: Rankinglist){
	String cCode= funding.getCategoryCode();
	switch (cCode) {
	case "C1":
		funding.setCategoryCode("테크·가전");
		break;
	case "C2":
		funding.setCategoryCode("푸드");
		break;
	case "C3":
		funding.setCategoryCode("여행");
		break;
	case "C4":
		funding.setCategoryCode("스포츠");
		break;
	case "C5":
		funding.setCategoryCode("게임·취미");
		break;
	case "C6":
		funding.setCategoryCode("모임");
		break;
	case "C7":
		funding.setCategoryCode("반려동물");
		break;
	case "C8":
		funding.setCategoryCode("기부·후원");
		break;
	default:
		funding.setCategoryCode("잘못된 카테고리");
		break;
	}
}

List<Funding> likelist = (List) request.getAttribute("likelist");
	for(Funding funding:likelist){
		String cCode=funding.getCategoryCode();
		switch(cCode){
		case "C1":
			funding.setCategoryCode("테크·가전");
			break;
		case "C2":
			funding.setCategoryCode("푸드");
			break;
		case "C3":
			funding.setCategoryCode("여행");
			break;
		case "C4":
			funding.setCategoryCode("스포츠");
			break;
		case "C5":
			funding.setCategoryCode("게임·취미");
			break;
		case "C6":
			funding.setCategoryCode("모임");
			break;
		case "C7":
			funding.setCategoryCode("반려동물");
			break;
		case "C8":
			funding.setCategoryCode("기부·후원");
			break;
		default:
			funding.setCategoryCode("잘못된 카테고리");
			break;
		}
	}
	
	 List<Funding>viewlist=(List)request.getAttribute("viewlist");
	for(Funding funding:viewlist){
		String cCode=funding.getCategoryCode();
		switch(cCode){
		case "C1":
			funding.setCategoryCode("테크·가전");
			break;
		case "C2":
			funding.setCategoryCode("푸드");
			break;
		case "C3":
			funding.setCategoryCode("여행");
			break;
		case "C4":
			funding.setCategoryCode("스포츠");
			break;
		case "C5":
			funding.setCategoryCode("게임·취미");
			break;
		case "C6":
			funding.setCategoryCode("모임");
			break;
		case "C7":
			funding.setCategoryCode("반려동물");
			break;
		case "C8":
			funding.setCategoryCode("기부·후원");
			break;
		default:
			funding.setCategoryCode("잘못된 카테고리");
			break;
		}
	}  	
%>
<script>
// 실시간랭킹  버튼 
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
	//새로고침 버튼
function Refresh(){
$.ajax({
	url:"${pageContext.request.contextPath}/funding/fundingRefresh",
	success:function(json) {
		 $('#kiwonfunding').empty();
		$(json).each(function(index,item){
		 var html = '';		 
		 html = $('<div class="card" style="border: none">'+'<div class="card-body">'+' <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo='+item.fundingNo+'" style="color: #000000;">'
			      +'<img class="card-img-top"src="${pageContext.request.contextPath}/resources/'+item.renamedFilename+'"width="240px" height="134px" >'+'</a>'+' <h5 class="card-title">'+item.title+'</h5>'+'<div id="funding_detail_dday_bar" class="progress">'+
			      '<div id="funding_detail_dday_bar_div"class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="'+item.nowAmount+'"aria-valuemin="0" aria-valuemax="'+item.goalAmount+'"style="width:'
			      +item.nowAmount /item.goalAmount * 100+'%">'+'</div>'+'</div>'+'<p class="kiwonfunding-percent">'
			      +item.nowAmount/item.goalAmount*100+'%'+'<span class="kiwonfunding-percent-after">'+item.categoryCode+'</span>'+'</p>'+'</div>'+'</div>')
		        $('#kiwonfunding').append(html);
			});       
	},
	error: (xhr, statusText, err) => {
		console.log(xhr, statusText, err);
	}
});
}
</script>

<script>
	//3개씩 이동
 var move=3;
 function right(){
	if(move >= 3 && move <=6){
		$("#loctionList").attr("style","transform:translateX("+(-240)*(move++)+"px);")
		}
	 }
 function left(){
 	if(move >=4 && move <=5){
 		$("#loctionList").attr("style","transform:translateX("+(-240)*(--move-1)+"px);")
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
					src="${pageContext.request.contextPath}/resources/images/kiwon_images/korea.jpg"
					alt="First slide">
				<div class="carousel-caption">
					<span class="carousel-caption-span">#원금손실가능성이 있습니다</span>
					<p class="carousel-caption-p">
						전세계가 빠진 콘텐츠 <br> 그 교육시장을 이끌어갑니다!
					</p>
					<span class="carousel-caption-funding">투자</span>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/image/food2.jpg"
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
					src="${pageContext.request.contextPath}/resources/image/food1.jpg"
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
			조회순
		</label>

	</div>
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-secondary active"> <input type="radio"
			name="ranking-btn" id="invest" checked onchange="showForI()">
			좋아요
		</label> <span class="kiwon_Ranking_badge">진행중</span>
	</div>
	<ul class="nav" id="fundingZone">
		<li style="font-weight: 700;"><c:forEach var="funding"
				items="${Rankinglist}" varStatus="vs">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==1}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <img
							src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"
							style="width: 75px; height: 63px; display: inline-block;" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode} </span>
					</p>
				</c:if>
			</c:forEach> </a></li>
		<li style="font-weight: 700;">
			<!--  클릭시 세부페이지이동  --> <c:forEach items="${Rankinglist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==2}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach>
		</li>
		<li style="font-weight: 700;"><c:forEach items="${Rankinglist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==3}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${Rankinglist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==4}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${Rankinglist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==5}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
	</ul>
	<!-- likeZone -->
	<ul class="nav" id="likeZone" style="display: none;">
		<li style="font-weight: 700;"><c:forEach items="${likelist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==1}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${likelist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==2}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${likelist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==3}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${likelist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==4}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
		<li style="font-weight: 700;"><c:forEach items="${likelist}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==5}">
					<span class="orderText-span">${vs.count}.</span>
					<p class="Ranking_class-p1">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000; display: flex;"> <span
							class="Ranking_class-span"> ${funding.title} </span> <!-- 75x63 픽셀 지정 --->
							<img
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							style="width: 75px; height: 63px" />
						</a>
					</p>
					<p class="kiwonRanking_percent">
						<fmt:formatNumber
							value="${funding.nowAmount/funding.goalAmount*100}"
							pattern="##.###" />
						%<span class="kiwonfunding-percent-after">
							${funding.categoryCode}</span>
					</p>
				</c:if>
			</c:forEach></li>
	</ul>
</div>
<br>

<!-- 로그인 안되었을때-->
<c:if test="${empty loginMember}">
	<h1 class="card-project-h1">이 프로젝트 어때요?</h1>
</c:if>
<!-- 로그인 되었을때 -->
<c:if test="${not empty loginMember}">
	<h1 class="card-project-h1">${loginMember.name}님,이 프로젝트 어때요?</h1>
</c:if>

<div class="card-columns" id="kiwonfunding" style="padding-left: 2vw;">
	<div class="card" style="border: none">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==1}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
	<div class="card" style="border: none;">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==2}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
	<div class="card" style="border: none;">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==3}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
	<div class="card" style="border: none;">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==4}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
	<div class="card" style="border: none;">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==5}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
	<div class="card" style="border: none;">
		<div class="card-body">
			<c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count==6}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="240px" height="134px">
					</a>
					<h5 class="card-title">${funding.title}</h5>
					<div id="funding_detail_dday_bar" class="progress">
						<div id="funding_detail_dday_bar_div"
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="${funding.nowAmount}"
							aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
							style="width:${funding.nowAmount / funding.goalAmount * 100}%">
						</div>
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
	</div>
</div>
<button type="button" id="button" class="btn btn-light"
	onclick="Refresh()"
	style="position: relative; left: 60%; padding: 12px; font-weight: 500; background-color: #545B62; color: #ffffff;">
	<ion-icon name="refresh-outline"></ion-icon>
	새로고침
</button>

<p class="p-likeProject">
	회원들이 <span style="color: #00a2a2;">좋아할</span> 프로젝트
</p>
<div class="likeProject">
	<div class="card"
		style="width: 18rem; margin-right: 1vw; border: none;">
		<div class="card-body" id="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:set var="attach" value="${funding.attachment}" scope="page" />
					<c:if test="${vs.count==1}">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000;"> <img class="card-img-top"
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							width="284px;" height="157px;">
						</a>
						<p class="card-text-p">${funding.title}</p>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
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
	<div class="card"
		style="width: 18rem; margin-right: 1vw; border: none;">
		<div class="card-body" id="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:set var="attach" value="${funding.attachment}" scope="page" />
					<c:if test="${vs.count==2}">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000;"> <img class="card-img-top"
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							width="284px;" height="157px;">
						</a>
						<p class="card-text-p">${funding.title}</p>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
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
	<div class="card"
		style="width: 18rem; margin-right: 1vw; border: none;">
		<div class="card-body" id="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:set var="attach" value="${funding.attachment}" scope="page" />
					<c:if test="${vs.count==3}">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000;"> <img class="card-img-top"
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							width="284px;" height="157px;">
						</a>
						<p class="card-text-p">${funding.title}</p>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
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
	<div class="card"
		style="width: 18rem; margin-right: 1vw; border: none;">
		<div class="card-body" id="card-body">
			<p class="card-text">
				<c:forEach items="${viewlist}" varStatus="vs" var="funding">
					<c:set var="attach" value="${funding.attachment}" scope="page" />
					<c:if test="${vs.count==4}">
						<a
							href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
							style="color: #000000;"> <img class="card-img-top"
							src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
							width="284px;" height="157px;">
						</a>
						<p class="card-text-p">${funding.title}</p>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
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
	<div class="btn-group" role="group" aria-label="Third group" onclick="left()">
		<button type="button" class="btn btn-secondary">
			&lt</button>
	</div>
	<div class="btn-group" role="group" aria-label="Third group" onclick="right()">
		<button type="button" class="btn btn-secondary">
			&gt</button>
	</div>
</div>
<!--  얼리버드 -->
<div class="EalrybirdTag_Container"  id="locationlist"style="padding-top: 20px;">
	<ul style="list-style: none; display: flex;">
		<!--  얼리버드 1번 li -->
		<li><c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count eq 1}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="390px;" height="229px;">
					</a>
					<div class="EarlybirdCard_Type">
						<p class="EarlybirdCard_Type-p">펀딩</p>
						<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
						<p class="EalrybirdCard_percent">
							<!--DB 사용예제! -->
							<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" /> % <span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</span>
							<!-- after  -->
						</p>
						<p class="cardType_earlybordContent-p">
							지금 참여하기
							<ion-icon name="chevron-forward-outline"></ion-icon>
						</p>
					</div>
				</c:if>
			</c:forEach></li>
		<!--  중간 padding  -->
		<li style="padding: 0px 33px;"><c:forEach items="${list}"
				varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count eq 2}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="390px;" height="229px;">
					</a>
					<div class="EarlybirdCard_Type">
						<p class="EarlybirdCard_Type-p">펀딩</p>
						<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
						<p class="EalrybirdCard_percent">
							<!--DB 사용예제! -->
							<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" /> % <span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</span>
							<!-- after  -->
						</p>
						<p class="cardType_earlybordContent-p">
							지금 참여하기
							<ion-icon name="chevron-forward-outline"></ion-icon>
						</p>
					</div>
				</c:if>
			</c:forEach></li>
		<li><c:forEach items="${list}" varStatus="vs" var="funding">
				<c:set var="attach" value="${funding.attachment}" scope="page" />
				<c:if test="${vs.count eq 3}">
					<a
						href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
						style="color: #000000;"> <img class="card-img-top"
						src="${pageContext.request.contextPath}/resources/${attach.renamedFilename}"
						width="390px;" height="229px;">
					</a>
					<div class="EarlybirdCard_Type">
						<p class="EarlybirdCard_Type-p">펀딩</p>
						<h1 class="EalrybirdCard_Type_h1">${funding.title}</h1>
						<div id="funding_detail_dday_bar" class="progress">
							<div id="funding_detail_dday_bar_div"
								class="progress-bar progress-bar-success progress-bar-striped"
								role="progressbar" aria-valuenow="${funding.nowAmount}"
								aria-valuemin="0" aria-valuemax="${funding.goalAmount}"
								style="width:${funding.nowAmount / funding.goalAmount * 100}%">
							</div>
						</div>
						<p class="EalrybirdCard_percent">
							<!--DB 사용예제! -->
							<span class="EalrybirdCard_percent-span"> <fmt:formatNumber
									value="${funding.nowAmount/funding.goalAmount*100}"
									pattern="##.###" /> % <span class="kiwonfunding-percent-after">
									${funding.categoryCode}</span>
							</span>
							<!-- after  -->
						</p>
						<p class="cardType_earlybordContent-p">
							지금 참여하기
							<ion-icon name="chevron-forward-outline"></ion-icon>
						</p>
					</div>
				</c:if>
			</c:forEach></li>
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
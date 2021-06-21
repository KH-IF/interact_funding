<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fundingList.css" />
<script>
	$(function(){
	    //이미지 불러오기
	    $("img[alt=image1]").attr("src","${pageContext.request.contextPath }/resources/image/food3.jpg");
	    $("img[alt=image2]").attr("src","${pageContext.request.contextPath }/resources/image/food2.jpg");
	    $("img[alt=image3]").attr("src","${pageContext.request.contextPath }/resources/image/food1.jpg");
	    $("img[alt=image4]").attr("src","${pageContext.request.contextPath }/resources/image/trip.jpg");
	    $("img[alt=image5]").attr("src","${pageContext.request.contextPath }/resources/image/game.jpg");
	
		//페이드인 효과
	    $('.fundingProjectCardItemImage').animate({'opacity':'1'},500);
	});

</script>
<style>
.slide-title{
   	display: block;
   	position: absolute;
   	bottom: 20px;
   	left: 20px;
   	text-decoration: none;
   	overflow: hidden;
}
.slide-title span{
   	color: white;
   	font-size: 20px;
   	font-weight: 700;
}
.slide-title p{
   	display: block;
   	color: white;
   	overflow: hidden;
   	text-overflow: ellipsis;
}
/* .FundingProjectCardItem{
	display:none;
} */
.fundingProjectCardItemImage{
	opacity: 0;
}
</style>
<div class="fundingMainWrapper">
       <div id="demo" class="carousel slide" data-ride="carousel">
           <ul class="carousel-indicators">
               <li data-target="#demo" data-slide-to="0" class="active"></li>
               <li data-target="#demo" data-slide-to="1"></li>
               <li data-target="#demo" data-slide-to="2"></li>
               <li data-target="#demo" data-slide-to="3"></li>
               <li data-target="#demo" data-slide-to="4"></li>
           </ul>

		   
           <div class="carousel-inner">
               <div class="carousel-item active">
                   <a href="#">
                       <img alt="image1" style="width: 1300px; height: 400px;">
                    <div class="slide-title">
                     <span>고급 고기</span>
                     <p>영양도 맛도 풍부한 갈비명가 갈비집이 만듭니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img alt="image2" style="width: 1300px; height: 400px;">
                    <div class="slide-title">
                    	<span>한상차린 밥상! 한식매니아를 위한 밥상!</span>
                    	<p>밥힘으로 삽니다.</p>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img alt="image3" style="width: 1300px; height: 400px;">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img alt="image4" style="width: 1300px; height: 400px;">
                </a>
            </div>
            <div class="carousel-item">
                <a href="#">
                    <img alt="image5" style="width: 1300px; height: 400px;">
                </a>
            </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <div class="fundingCategoryContainer">
        <div class="fundingCategoryList">
            <div class="fundingCategoryListWrap">
            	<ul>
                	<li id="fundingCategory" class="C0">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC0"></span>
		                         <span class="fundingCategoryListCricleName">전체보기</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C1">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C1&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC1"></span>
		                         <span class="fundingCategoryListCricleName">테크·가전</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C2">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C2&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC2"></span>
		                         <span class="fundingCategoryListCricleName">푸드</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C3">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C3&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC3"></span>
		                         <span class="fundingCategoryListCricleName">여행</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C4">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C4&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC4"></span>
		                         <span class="fundingCategoryListCricleName">스포츠</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C5">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C5&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC5"></span>
		                         <span class="fundingCategoryListCricleName">게임·취미</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C6">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C6&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC6"></span>
		                         <span class="fundingCategoryListCricleName">모임</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C7">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C7&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC7"></span>
		                         <span class="fundingCategoryListCricleName">반려동물</span>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C8">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C8&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                         <span class="fundingCategoryListCricleImageC8"></span>
		                         <span class="fundingCategoryListCricleName">기부·후원</span>
		                     </span>
		                </a>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="fundingProjectList">
        <div class="fundingProjectListHead">
            <h3 class="fundingProjectListHeadTitle">전체보기</h3>
            <form action="" class="fundingProjectListSearchFrm" onsubmit="return false;">
                <input type="search" id="searchKeyword2" placeholder="검색" value="${map.searchKeyword}" >
                <input type="button" id="searchButton" value="">
            </form>
            <select name="status" id="searchSelect1" onchange="select();">
            	<option value="processing" ${map.searchSelect1 eq 'processing' ? 'selected' : ''}>진행중</option>
            	<option value="quit" ${map.searchSelect1 eq 'quit' ? 'selected' : ''}>종료</option>
            </select>
            <select name="status" id="searchSelect2" onchange="select();">
            	<option value="recent" ${map.searchSelect2 eq 'recent' ? 'selected' : ''}>최신순</option>
            	<option value="recommand" ${map.searchSelect2 eq 'recommand' ? 'selected' : ''}>추천순</option>
            	<option value="past" ${map.searchSelect2 eq 'past' ? 'selected' : ''}>과거순</option>
            </select>
            
        </div>
        <!-- 목록 -->
        <div class="fundingProjectCardList">
            <div class="fundingProjectCardListIn">
                <!-- 목록 제목 -->
	        	<c:forEach items="${list}" var="funding">
                <div class="fundingProjectCardItem">
                    <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}" class="FundingProjectCardItemImageArea">
                        <div class="fundingProjectCardItemImage" style="background-image:url('${pageContext.request.contextPath}/resources/upload/${funding.attachment.renamedFilename}');"></div>
                    </a>

                    <div class="fundingProjectCardListInfo">
                        <div class="fundingProjectCardItemTitle">
                            <div class="fundingProjectCardItemTitleBox">
<<<<<<< HEAD
                                <a class="fundingProjectCardItemTitleLink" href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}">
=======
                                <a class="fundingProjectCardItemTitleLink" href="${pageContext.request.contextPath}/funding/fundingDetail?funding_no=${funding.fundingNo}">
                                    <p><strong>${funding.content}</strong></p>

                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">		
                                <a class="FundingProjectCardItemTitleLink">
>>>>>>> branch 'master' of https://github.com/KH-IF/interact_funding.git
                                    <p><strong>${funding.title}</strong></p>
                                </a>
                                <div>
                                    <span class="rewordProjectCardCategory">
                                    	<c:if test="${funding.categoryCode == 'C1'}">
                                    		테크·가전
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C2'}">
                                    		푸드
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C3'}">
                                    		여행
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C4'}">
                                    		스포츠
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C5'}">
                                    		게임·취미
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C6'}">
                                    		모임
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C7'}">
                                    		반려동물
                                    	</c:if>
                                    	<c:if test="${funding.categoryCode == 'C8'}">
                                    		기부·후원
                                    	</c:if>
                                    </span>
                                    <span class="line"></span>
                                    <span class="rewordProjectCardMakerName">
                                        <%-- ${memberName} --%>
                                    </span>
                                </div>
                            </div>
							<!-- 날짜계산 -->
							<jsp:useBean id="now" class="java.util.Date"/>
                           	<fmt:parseNumber value="${funding.startDate.time / (1000*60*60*24)}" integerOnly="true" var="staDate"/>
                           	<fmt:parseNumber value="${funding.DDay.time / (1000*60*60*24)}" integerOnly="true" var="dDate"/>
                           	<fmt:parseNumber value="${now.time/(1000*60*60*24)}" integerOnly="true" var="today"/>
                           	<c:if test="${dDate-today > 0}" >
                           	<div class="progress">
						        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: ${(funding.nowAmount/funding.goalAmount)*100}%"></div>
						    </div>
                            <span class="rewordProjectCardPercent">
                            	<fmt:formatNumber value="${(funding.nowAmount/funding.goalAmount)}" type="percent"/>
                            </span>
                            <span class="rewordProjectCardAmount">
								<fmt:formatNumber value="${funding.goalAmount}" pattern="#,###원"/>
							</span>
                           		<span class="rewordProjectCardDay">${dDate-today}일 남음</span>
                           	</c:if>
                           	<c:if test="${dDate-today <= 0}" >
                           	<div class="progress">
						        <div class="progress" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: ${(funding.nowAmount/funding.goalAmount)*100}%"></div>
						    </div>
                            <span class="rewordProjectCardPercent">
                            	<fmt:formatNumber value="${(funding.nowAmount/funding.goalAmount)}" type="percent"/>
                            </span>
                            <span class="rewordProjectCardAmount">
								<fmt:formatNumber value="${funding.goalAmount}" pattern="#,###원"/>
							</span>
                           		<span class="rewordProjectCardDay" style="color:red;">마감</span>
                           	</c:if>
                           		
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        ${pageBar}
<!--         <div>
            <div class="moreFunding">
                <button id="moreBtn">더보기↓</button>
            </div>
        </div>         -->
    </div>
</div>

<script>
    
    /* function fundingEnterkey(){
		if(window.event.keyCode == 13){
			search2();
		}
    } */
	//검색
	/* function focues_searchInput(){
		$("#searchKeyword").focus();
    }
    function searchStart(input){
		if(window.event.keyCode == 13){
			const searchKeyword=$(input).val();
			console.log(searchKeyword);
			var url = "${pageContext.request.contextPath}/funding/fundingList";
			url = url + "?searchKeyword="+$('#searchKeyword').val();
			location.href = url;
		}
    } */
    
  	//펀딩검색
    $("#searchButton").click(function (){
    	search2()
    });

    function search2(){
    	var keyword = $("#searchKeyword2").val();
        /* var category = $("#FundingCategory").attr("class"); */
        var category = "${map.category}";
    	var searchSelect1 = $("#searchSelect1").val();
    	/* var searchSelect1 = "${map.searchSelect1}"; */
        var searchSelect2 = $("#searchSelect2").val();
    	console.log(keyword);
    	console.log(category);
    	console.log(searchSelect1);
    	console.log(searchSelect2);
    	
		
		if(keyword.length ==0){
			swal("검색키워드","한글자 이상 입력해주세요","info");
			return;
		}
		else{
			var url = "${pageContext.request.contextPath}/funding/fundingList";
			url = url + "?category=${map.category}";
			url = url + "&searchSelect1=" + searchSelect1;
			url = url + "&searchSelect2=" + searchSelect2;
			url = url + "&searchKeyword=" + keyword;
			location.href = url;
			console.log(url);
		}
    }

    $("#searchKeyword2").keyup(function(e){
        if(e.keyCode == 13)
            search2();
    })

	function select(){
		var url = "${pageContext.request.contextPath}/funding/fundingList";
		url = url + "?category=${map.category}";
		url = url + "&searchSelect1=" + $("#searchSelect1").val();
		url = url + "&searchSelect2=" + $("#searchSelect2").val();
		url = url + "&searchKeyword=" + $("#searchKeyword2").val();
		location.href = url;
	}
	
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
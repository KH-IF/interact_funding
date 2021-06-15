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
	    $('.FundingProjectCardItemImage').animate({'opacity':'1'},500);
	});
	//더보기
	$(function(){
	    $(".FundingProjectCardItem").slice(0,9).show();
	    $("#moreBtn").click(function(e){
			e.preventDefault();
			$(".FundingProjectCardItem:hidden").slice(0,9).show();
			if($(".FundingProjectCardItem:hidden").length == 0){
				console.log("더이상 항목이 없습니다.");
			}
	    })
	});

	/* $(".FundingCategoryList").click(e => {
		var $a = $(e.target).
	}); */
	//자동페이징
	/* var page = 2;

	$(window).scroll(function(){
		if($(window).scrollTop() == $(document).height() - $(window).height()){
			console.log(++page);
			$(".FundingProjectCardItem").append();
		}
	}); */
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
.FundingProjectCardItem{
	display:none;
}
.FundingProjectCardItemImage{
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
    <div class="FundingCategoryContainer">
        <div class="FundingCategoryList">
            <div class="FundingCategoryListWrap">
            	<ul>
                	<li id="FundingCategoryC0" class="C0">
                		<a class="FundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C0&search=">
		                     <span class="FundingCategoryListCricle">
		                         <span class="FundingCategoryListCricleImageC0"></span>
		                         <span class="FundingCategoryListCricleName">전체보기</span>
		                     </span>
		                </a>
                	</li>
                	<c:forEach items="${categoryList}" var="funding">
                	<li id="FundingCategory${funding.categoryCode}" class="${funding.categoryCode}">
                		<a class="FundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=${funding.categoryCode}&search=">
		                    <span class="FundingCategoryListCricle">
		                        <span class="FundingCategoryListCricleImage${funding.categoryCode}"></span>
		                        <span class="FundingCategoryListCricleName">${funding.categoryName}</span>
		                    </span>
		                </a>
                	</li>
                	</c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="FundingProjectList">
        <div class="FundingProjectListHead">
            <h3 class="FundingProjectListHeadTitle">전체보기</h3>
            <form action="" class="FundingProjectListSearchFrm" onsubmit="return false;">
                <input type="search" id="searchKeyword2" placeholder="검색">
                <input type="button" id="SearchButton" value="">
            </form>
            <select name="status" id="searchSelect1">
            	<option value="All">전체</option>
            	<option value="processing" ${param.searchSelect1 eq 'processing' ? 'selected' : ''}>진행중</option>
            	<option value="quit" ${param.searchSelect1 eq 'quit' ? 'selected' : ''}>종료</option>
            </select>
            <select name="status" id="searchSelect2">
            	<option value="recent" ${param.searchSelect2 eq 'recent' ? 'selected' : ''}>최신순</option>
            	<option value="recommand" ${param.searchSelect2 eq 'recommand' ? 'selected' : ''}>추천순</option>
            </select>
            
        </div>
        <!-- 목록 -->
        <div class="FundingProjectCardList">
            <div class="FundingProjectCardListIn">
                <!-- 목록 제목 -->
	        	<c:forEach items="${list}" var="funding">
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>${funding.title}</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">${funding.categoryCode}</span>
                                    <span class="line"></span>
                                    <span class="RewordProjectCardMakerName">
                                        ${funding.writerNo}
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: ${(funding.nowAmount/funding.goalAmount)*100}%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">
                            	<fmt:formatNumber value="${(funding.nowAmount/funding.goalAmount)}" type="percent"/>
                            </span>
                            <span class="RewordProjectCardAmount">
								<fmt:formatNumber value="${funding.goalAmount}" pattern="#,###원"/>
							</span>
                           	<span class="RewordProjectCardDay">
                           		<fmt:formatDate var="startDate" value="${funding.startDate}" pattern="yyyy년MM월dd일"/>
                           		<fmt:formatDate var="DDay" value="${funding.DDay}" pattern="yyyy년MM월dd일"/>
								<%-- <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
								<fmt:parseNumber value="${DDay.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/> --%>
                           	</span>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="line"></span>
                                    <span class="RewordProjectCardMakerName">
                                        TG삼보
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="RewordProjectCardMakerName">
                                        한성컴퓨터
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="RewordProjectCardMakerName">
                                        ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="RewordProjectCardMakerName">
                                        주연테크(?)
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="RewordProjectCardMakerName">
                                        주연테크(?)
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
                <div class="FundingProjectCardItem">
                    <a href="#" class="FundingProjectCardItemImageArea">
                        <div class="FundingProjectCardItemImage"></div>
                    </a>
                    <div class="FundingProjectCardListInfo">
                        <div class="FundingProjectCardItemTitle">
                            <div class="FundingProjectCardItemTitleBox">
                                <a class="FundingProjectCardItemTitleLink" href="#">
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
                                </a>
                                <div>
                                    <span class="RewordProjectCardCategory">테크·가전</span>
                                    <span class="RewordProjectCardMakerName">
                                        주연테크(?)
                                    </span>
                                </div>
                            </div>
                            <div class="RewordProjectCardBar">
                                <span style="width: 20%;"></span>
                            </div>
                            <span class="RewordProjectCardPercent">20%</span>
                            <span class="RewordProjectCardAmount">10,000,000원</span>
                            <span class="RewordProjectCardDay">24일 남음</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="MoreFunding">
                <button id="moreBtn">더보기↓</button>
            </div>
        </div>
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

	$(".FundingCategoryListCricle").click(function (){
		var category = $("#FundingCategory").attr("class");
		console.log(category);
	});
    
  	//펀딩검색
    $("#SearchButton").click(function (){
    	search2()
    });

    function search2(){
    	var keyword = $("#searchKeyword2").val();
        var category = $("#FundingCategory").attr("class");
    	var searchSelect1 = $("#searchSelect1").val();
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
			url = url + "?category=" + $(".FundingCategory").attr("id");
			url = url + "&searchSelect1=" + $('#searchSelect1').val();
			url = url + "&searchSelect2=" + $('#searchSelect2').val();
			url = url + "&searchKeyword="+$('#searchKeyword2').val();
			location.href = url;
			console.log(url);
		}
    }

    $("#searchKeyword2").keyup(function(e){
        if(e.keyCode == 13)
            search2();
    })
    
    $()
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
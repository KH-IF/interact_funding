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
        $("img[alt=image1]").attr("src","${pageContext.request.contextPath }/resources/image/food3.jpg");
        $("img[alt=image2]").attr("src","${pageContext.request.contextPath }/resources/image/food2.jpg");
        $("img[alt=image3]").attr("src","${pageContext.request.contextPath }/resources/image/food1.jpg");
        $("img[alt=image4]").attr("src","${pageContext.request.contextPath }/resources/image/trip.jpg");
        $("img[alt=image5]").attr("src","${pageContext.request.contextPath }/resources/image/game.jpg");
    });
    $(function(){
        $(".FundingProjectCardItem").slice(0,3).show();
        $("#moreBtn").click(function(e){
			e.preventDefault();
			$(".FundingProjectCardItem:hidden").slice(0,3).show();
			if($(".FundingProjectCardItem:hidden").length == 0){
				
			}
        })
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

</style>
<div class="FundingMainWrapper">
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
                <a class="FundingCategoryList" href="#">
                     <span class="FundingCategoryListCricle">
                         <span class="FundingCategoryListCricleImage0"></span>
                         <span class="FundingCategoryListCricleName">전체보기</span>
                     </span>
                </a>
                <a class="FundingCategoryList" href="#1">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage1"></span>
                        <span class="FundingCategoryListCricleName">테크·가전</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage2"></span>
                        <span class="FundingCategoryListCricleName">푸드</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage3"></span>
                        <span class="FundingCategoryListCricleName">여행</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage4"></span>
                        <span class="FundingCategoryListCricleName">스포츠</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage5"></span>
                        <span class="FundingCategoryListCricleName">게임·취미</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage6"></span>
                        <span class="FundingCategoryListCricleName">모임</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage7"></span>
                        <span class="FundingCategoryListCricleName">반려동물</span>
                    </span>
                </a>
                <a class="FundingCategoryList" href="#">
                    <span class="FundingCategoryListCricle">
                        <span class="FundingCategoryListCricleImage8"></span>
                        <span class="FundingCategoryListCricleName">기부후원</span>
                    </span>
                </a>
            </div>
        </div>
    </div>
    <div class="FundingProjectList">
        <div class="FundingProjectListHead">
            <h3 class="FundingProjectListHeadTitle">전체보기</h3>
            <form class="FundingProjectListSearch">
                <label for="">
                    <input type="search" placeholder="검색">
                    <div class="SearchButtonIcon">
                        <input type="submit" class="SearchButton" value="검색">
                    </div>
                </label>
            </form>
            <div class="FundingProjectListSearchOption1">
                전체
            </div>
            <div class="FundingProjectListSearchOption2">
                추천순
            </div>
        </div>
        <!-- 목록 -->
        <div class="FundingProjectCardList">
            <div class="FundingProjectCardListIn">
                <!-- 목록 제목 -->
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
                                    <p><strong>가전제품의 놀라움!!!!</strong></p>
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
                                    <p><strong>가전제품의 놀라움!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</strong></p>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
		  //페이드인 효과
        $('.FundingProjectCardItemImage').animate({'opacity':'1'},500);
	});
	$(function(){
        $(".FundingProjectCardItem").slice(0,3).show();
        $("#moreBtn").click(function(e){
			e.preventDefault();
			$(".FundingProjectCardItem:hidden").slice(0,3).show();
			if($(".FundingProjectCardItem:hidden").length == 0){
				console.log("더이상 항목이 없습니다.");
			}
        })
    });
</script>
<style>
	/* 슬라이드 이미지 */
	@@ -50,12 +37,7 @@
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
	<div class="FundingMainWrapper">
	@@ -116,25 +98,6 @@
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
                                    <a class="EarlyProjectCardItemTitleLinkArea" href="#">
                                        <p class="EarlyProjectCardItemTitleLink"><strong>${funding.title}</strong></p>
                                        <p class="EarlyProjectCardDay">6/11(금) 14시00분 오픈예정</p>
                                    </a>
	                                <p class="RewordProjectCardMakerName">주연테크</p>
                                </div>
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
                                    <a class="EarlyProjectCardItemTitleLinkArea" href="#">
                                        <p class="EarlyProjectCardItemTitleLink"><strong>세상에 없던 초간편 미래형 제품 등장!</strong></p>
                                        <p class="EarlyProjectCardDay">6/11(금) 14시00분 오픈예정</p>
                                    </a>
	                                <p class="RewordProjectCardMakerName">주연테크</p>
                                </div>
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
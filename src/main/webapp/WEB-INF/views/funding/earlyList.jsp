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
        $('.fundingProjectCardItemImage').animate({'opacity':'1'},500);
	});
	$(function(){
        $(".fundingProjectCardItem").slice(0,3).show();
        $("#moreBtn").click(function(e){
			e.preventDefault();
			$(".fundingProjectCardItem:hidden").slice(0,3).show();
			if($(".fundingProjectCardItem:hidden").length == 0){
				console.log("더이상 항목이 없습니다.");
			}
        })
    });
</script>
<style>
	.slide-title p{
	   	display: block;
	   	color: white;
	   	overflow: hidden;
	   	text-overflow: ellipsis;
	}
	.fundingProjectCardItem{
	display:none;
	}
	.fundingProjectCardItemImage{
		opacity: 0;
	}
	
</style>
	<div class="fundingMainWrapper">
	@@ -116,25 +98,6 @@
            <div class="fundingProjectCardList">
                <div class="fundingProjectCardListIn">
                    <!-- 목록 제목 -->
                    <c:forEach items="${list}" var="funding">
                    <div class="fundingProjectCardItem">
                        <a href="#" class="fundingProjectCardItemImageArea">
                            <div class="fundingProjectCardItemImage"></div>
                        </a>
                        <div class="fundingProjectCardListInfo">
                            <div class="fundingProjectCardItemTitle">
                                <div class="fundingProjectCardItemTitleBox">
                                    <a class="earlyProjectCardItemTitleLinkArea" href="#">
                                        <p class="earlyProjectCardItemTitleLink"><strong>${funding.title}</strong></p>
                                        <p class="earlyProjectCardDay">6/11(금) 14시00분 오픈예정</p>
                                    </a>
	                                <p class="rewordProjectCardMakerName">주연테크</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="fundingProjectCardItem">
                        <a href="#" class="fundingProjectCardItemImageArea">
                            <div class="fundingProjectCardItemImage"></div>
                        </a>
                        <div class="fundingProjectCardListInfo">
                            <div class="fundingProjectCardItemTitle">
                                <div class="fundingProjectCardItemTitleBox">
                                    <a class="earlyProjectCardItemTitleLinkArea" href="#">
                                        <p class="earlyProjectCardItemTitleLink"><strong>세상에 없던 초간편 미래형 제품 등장!</strong></p>
                                        <p class="earlyProjectCardDay">6/11(금) 14시00분 오픈예정</p>
                                    </a>
	                                <p class="rewordProjectCardMakerName">주연테크</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div>
                <div class="moreFunding">
                    <button id="moreBtn">더보기↓</button>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
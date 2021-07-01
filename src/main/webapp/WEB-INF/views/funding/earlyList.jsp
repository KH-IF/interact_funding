<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오픈예정" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fundingList.css" />
<script>
/* 스크롤 페이드인 효과 */
$(document).ready(function() {
	/* 이미지 슬라이드 */
	$(".carousel-item").animate({'opacity':'1'},300);
   /* 1 */
   $('.fundingProjectCardItemImage').each( function(i){
            var bottom_of_object = $(this).offset().top;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            /* 3 */
            if( bottom_of_window > bottom_of_object){
                $(this).animate({'opacity':'1'},500);
            }
   });
    $(window).scroll( function(){
        /* 2 */
        $('.fundingProjectCardItemImage').each( function(i){
        	var bottom_of_object = $(this).offset().top;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            /* 3 */
            if( bottom_of_window > bottom_of_object){
                $(this).animate({'opacity':'1'},500);
            }
        }); 
    });
});
	/* $(function(){
		//페이드인 효과
        $('.fundingProjectCardItemImage').animate({'opacity':'1'},500);
	}); */
	
</script>
<style>
.slide-title{
   	position: absolute;
    z-index: 1;
    bottom: 15px;
    left: 160px;
    text-decoration: none;
    color: #ffffff;
    overflow: hidden;
}
.slide-title span{
   	color: white;
    font-size: 32px;
    font-weight: 700;
    letter-spacing: .7px;
    -webkit-line-clamp: 3;
    width: 570px;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    text-shadow: 1px 1px 1px black;
}
.slide-title p{
   	display: block;
   	color: white;
   	overflow: hidden;
   	text-overflow: ellipsis;
}
/* .fundingProjectCardItem{
	display:none;
} */
.fundingProjectCardItemImage{
	opacity: 0;
}
.carousel-item{
	opacity: 0;
}
.carousel-inner{
	height:464px;
}
.rewordProjectCardMakerName{
	margin-top: 10px;
}
.fundingProjectList-h1{
    padding-top: 40px;
    font-weight: 700;
    line-height: 32px;
    font-size: 24px;
}
.fundingProjectList-h-div{
	border-bottom: 1px solid rgba(0,0,0,0.1);
}
.fundingProjectList-container-div{
	margin: 50px;
}
.earlyProjectCardDay-yh{
	display: block;
    font-weight: 700;
    color: #00b2b2;
}
</style>
</section>
	<div id="demo" class="carousel slide" data-ride="carousel">
           <ul class="carousel-indicators">
	           <c:forEach items="${bannerList}" var="banner" varStatus="status">
	           		<c:if test="${status.first}">
	           			<li data-target="#demo" data-slide-to="0" class="active"></li>
	           		</c:if>
	           		<c:if test="${not status.first}">
	           			<c:if test="${status.count == 2}">
		           			<li data-target="#demo" data-slide-to="1"></li>
		           		</c:if>
		           		<c:if test="${status.count == 3}">
		            		<li data-target="#demo" data-slide-to="2"></li>
		            	</c:if>
		            	<c:if test="${status.count == 4}">
		               		<li data-target="#demo" data-slide-to="3"></li>
		               	</c:if>
		               	<c:if test="${status.count >= 5}">
		               	<li data-target="#demo" data-slide-to="4"></li>
		               	</c:if>
	               	</c:if>
	           </c:forEach>
           </ul>

           <div class="carousel-inner">
           <c:forEach items="${bannerList}" var="banner" varStatus="status">
           		<c:if test="${status.first}">
			   		<div class="carousel-item active">
           		</c:if>
           		<c:if test="${not status.first}">
		   			<div class="carousel-item">
		   		</c:if>
                   <a href="${pageContext.request.contextPath}/funding/fundingDetailEarly?fundingNo=${banner.fundingNo}">
                       <img src="${pageContext.request.contextPath}/resources/upload/${banner.attachment.renamedFilename}" style="width:100%; object-fit:cover; height: 464px;">
                    <div class="slide-title">
                     <span>${banner.title}</span>
                     <p></p>
                    </div>
                	</a>
            	</div>
		   </c:forEach>
		   
          </div>
           
	        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	            <span class="carousel-control-prev-icon"></span>
	        </a>
	        <a class="carousel-control-next" href="#demo" data-slide="next">
	            <span class="carousel-control-next-icon"></span>
	        </a>
	</div>
	<section>
	<div class="fundingProjectList-container-div">
	<div class="fundingProjectList-h-div">
	<h3  class="fundingProjectList-h1">오픈예정 둘러보기</h3>
	</div>
	<div class="fundingProjectList-yh">
            <!-- 목록 -->
	        <div class="fundingProjectCardList">
	        	<c:if test="${empty list}">
	                <div class="emptyFundingList">
	                	<h4>조회결과가 없습니다.</h4>
	               	</div>
	            </c:if>
	            <c:if test="${not empty list}">
	            <div class="fundingProjectCardListIn">
	                <!-- 목록 제목 -->
	                <c:forEach items="${list}" var="funding">
	                <div class="fundingProjectCardItem">
	                    <a href="${pageContext.request.contextPath}/funding/fundingDetailEarly?fundingNo=${funding.fundingNo}" class="fundingProjectCardItemImageArea">
	                    	<div class="fundingProjectCardItemImage" style="background-image:url('${pageContext.request.contextPath}/resources/upload/${funding.attachment.renamedFilename}');"></div>
	                    </a>
	                    <div class="fundingProjectCardListInfo">
	                        <div class="fundingProjectCardItemTitle">
	                            <div class="fundingProjectCardItemTitleBox">
	                                <a class="earlyProjectCardItemTitleLinkArea" href="#">
                                        <span class="earlyProjectCardItemTitleLink">${funding.title}</span>
                                        <span class="earlyProjectCardDay-yh">
                                        <!-- 기원 MM/dd(E)오픈예정 수정  -->
                                        <fmt:formatDate value="${funding.startDate}" pattern="MM/dd(E) 오픈예정"/>
                                        </span>
                                    </a>
	                            </div>
	                            <div>
                                	<span class="rewordProjectCardMakerName">
                                	</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                </c:forEach>
	                
	            </div>
	            </c:if>
	        </div>
	        
	        <c:if test="${totalContents <= map.limit}">
	        	<div id="nonePage"></div>
	        </c:if>
	        <c:if test="${totalContents > map.limit}">
	        	<div id="pageBar">
	        		${pageBar}
	        	</div>
	        </c:if>
        </div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
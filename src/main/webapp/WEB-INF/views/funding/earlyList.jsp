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
   /* 1 */
   $('.fundingProjectCardItemImage').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            /* 3 */
            if( bottom_of_window > bottom_of_object ){
                $(this).animate({'opacity':'1'},500);
            }
   });
    $(window).scroll( function(){
        /* 2 */
        $('.fundingProjectCardItemImage').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            /* 3 */
            if( bottom_of_window > bottom_of_object/1.75){
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
   	display: block;
   	position: absolute;
   	bottom: 20px;
   	left: 200px;
   	z-index:1;
   	text-decoration: none;
   	overflow: hidden;
}
.slide-title span{
   	color: #ffffff;
   	font-size: 40px;
   	font-weight: 700;
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
.rewordProjectCardMakerName{
	margin-top: 10px;
}
.fundingProjectList-h1{
	margin-inline: 48px;
    padding-top: 40px;
    font-weight: 700;
    font-size: 32px;
}
</style>
</section>
<div class="fundingMainWrapper">
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
                       <img src="${pageContext.request.contextPath}/resources/upload/${banner.attachment.renamedFilename}" style="width: 1300px; height: 400px;">
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
	<h1  class="fundingProjectList-h1">오픈예정 둘러보기</h1>
	<div class="fundingProjectList">
            <!-- 목록 -->
	        <div class="fundingProjectCardList">
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
                                        <span class="earlyProjectCardItemTitleLink"><strong>${funding.title}</strong></span>
                                        <span class="earlyProjectCardDay">
                                        <fmt:formatDate value="${funding.startDate}" pattern="MM/dd(E) HH시mm분 오픈예정"/>
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
	        </div>
	        <c:if test="${totalContents > map.limit}">
	        	${pageBar}
	        </c:if>
            <!-- <div>
                <div class="moreFunding">
                    <button id="moreBtn">더보기↓</button>
                </div>
            </div> -->
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
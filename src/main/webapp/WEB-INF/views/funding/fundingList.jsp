<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="펀딩하기" name="title" 	/>
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
       if( bottom_of_window > bottom_of_object/1.5){
           $(this).animate({'opacity':'1'},500);
       }
       $(window).scroll( function(){
           /* 2 */
           $('.fundingProjectCardItemImage').each( function(i){
               /* 3 */
               var bottom_of_object = $(this).offset().top;
       		   var bottom_of_window = $(window).scrollTop() + $(window).height();
               if( bottom_of_window > bottom_of_object){
                   $(this).animate({'opacity':'1'},500);
               }
           });
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
/* .FundingProjectCardItem{
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
</style>
<!--세션 닫는태그  -->
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
                   <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${banner.fundingNo}">
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
    <!--세션 여는태그  -->
	<section>
    <div class="fundingCategoryContainer">
        <div class="fundingCategoryList">
            <div class="fundingCategoryListWrap">
            	<ul>
                	<li id="fundingCategory" class="C0">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle" >
		                     	<c:if test="${empty map.category}">
		                        	<span class="fundingCategoryListCricleImageC0" style="border: 2px #00a2a2 solid;"></span>
		                        	<span class="fundingCategoryListCricleName" style="color: #00a2a2;">전체보기</span>
		                     	</c:if>
		                     	<c:if test="${not empty map.category}">
		                     		<span class="fundingCategoryListCricleImageC0"></span>
		                        	<span class="fundingCategoryListCricleName">전체보기</span>
		                     	</c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C1">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C1&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C1'}">
		                        	<span class="fundingCategoryListCricleImageC1" style="border: 2px #00a2a2 solid;"></span>
		                        	<span class="fundingCategoryListCricleName" style="color: #00a2a2;">테크·가전</span>
		                        </c:if>
		                     	<c:if test="${map.category != 'C1'}">
		                        	<span class="fundingCategoryListCricleImageC1"></span>
		                        	<span class="fundingCategoryListCricleName">테크·가전</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C2">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C2&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C2'}">
		                        	<span class="fundingCategoryListCricleImageC2" style="border: 2px #00a2a2 solid;"></span>
		                        	<span class="fundingCategoryListCricleName" style="color: #00a2a2;">푸드</span>
		                        </c:if>
		                     	<c:if test="${map.category != 'C2'}">
		                        	<span class="fundingCategoryListCricleImageC2"></span>
		                        	<span class="fundingCategoryListCricleName">푸드</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C3">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C3&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
			                     <c:if test="${map.category == 'C3'}">
			                        <span class="fundingCategoryListCricleImageC3" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color: #00a2a2;">여행</span>
			                     </c:if>
			                     <c:if test="${map.category != 'C3'}">
			                        <span class="fundingCategoryListCricleImageC3"></span>
			                        <span class="fundingCategoryListCricleName">여행</span>
			                     </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C4">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C4&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C4'}">
			                        <span class="fundingCategoryListCricleImageC4" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color: #00a2a2;">스포츠</span>
		                        </c:if>
		                        <c:if test="${map.category != 'C4'}">
			                        <span class="fundingCategoryListCricleImageC4"></span>
			                        <span class="fundingCategoryListCricleName">스포츠</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C5">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C5&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C5'}">
			                        <span class="fundingCategoryListCricleImageC5" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color: #00a2a2;">게임·취미</span>
		                        </c:if>
		                     	<c:if test="${map.category != 'C5'}">
			                        <span class="fundingCategoryListCricleImageC5"></span>
			                        <span class="fundingCategoryListCricleName">게임·취미</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C6">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C6&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C6'}">
			                        <span class="fundingCategoryListCricleImageC6" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color: #00a2a2;">모임</span>
		                        </c:if>
		                        <c:if test="${map.category != 'C6'}">
		                        	 <span class="fundingCategoryListCricleImageC6"></span>
			                        <span class="fundingCategoryListCricleName">모임</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C7">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C7&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C7'}">
			                        <span class="fundingCategoryListCricleImageC7" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color:#00a2a2;">반려동물</span>
		                        </c:if>
		                        <c:if test="${map.category != 'C7'}">
		                        	<span class="fundingCategoryListCricleImageC7"></span>
			                        <span class="fundingCategoryListCricleName">반려동물</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                	<li id="fundingCategory" class="C8">
                		<a class="fundingCategoryList" href="${pageContext.request.contextPath}/funding/fundingList?category=C8&searchSelect1=${map.searchSelect1}&searchSelect2=${map.searchSelect2}&searchKeyword=${map.searchKeyword}">
		                     <span class="fundingCategoryListCricle">
		                     	<c:if test="${map.category == 'C8'}">
			                        <span class="fundingCategoryListCricleImageC8" style="border: 2px #00a2a2 solid;"></span>
			                        <span class="fundingCategoryListCricleName" style="color:#00a2a2;">기부·후원</span>
		                        </c:if>
		                        <c:if test="${map.category != 'C8'}">
			                        <span class="fundingCategoryListCricleImageC8"></span>
			                        <span class="fundingCategoryListCricleName">기부·후원</span>
		                        </c:if>
		                     </span>
		                </a>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    	<c:if test="${not empty map.searchKeyword}">
    	<div class="resetArea">
        	<h4 class="reset">제목검색: ${map.searchKeyword}</h4>
        	<button type="button" class="btn btn-secondary btn-sm" onclick='location.href="${pageContext.request.contextPath}/funding/fundingList?category=${map.category}"'>초기화</button>
		</div>
    	</c:if>
    <div class="fundingProjectList">
        <div class="fundingProjectListHead">
            <h3 class="fundingProjectListHeadTitle">
            	<c:if test="${empty map.category}">
            		전체보기
            	</c:if>
            	<c:if test="${map.category == 'C1'}">
            		테크·가전
            	</c:if>
            	<c:if test="${map.category == 'C2'}">
            		푸드
            	</c:if>
            	<c:if test="${map.category == 'C3'}">
            		여행
            	</c:if>
            	<c:if test="${map.category == 'C4'}">
            		스포츠
            	</c:if>
            	<c:if test="${map.category == 'C5'}">
            		게임·취미
            	</c:if>
            	<c:if test="${map.category == 'C6'}">
            		모임
            	</c:if>
            	<c:if test="${map.category == 'C7'}">
            		반려동물
            	</c:if>
            	<c:if test="${map.category == 'C8'}">
            		기부·후원
            	</c:if>
            </h3>
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
                    <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}" class="FundingProjectCardItemImageArea">
                        <div class="fundingProjectCardItemImage" style="background-image:url('${pageContext.request.contextPath}/resources/upload/${funding.attachment.renamedFilename}');"></div>
                    </a>

                    <div class="fundingProjectCardListInfo">
                        <div class="fundingProjectCardItemTitle">
                            <div class="fundingProjectCardItemTitleBox">
                                <a class="fundingProjectCardItemTitleLink" href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}">
                                    <p>${funding.title}</p>
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
                                    <!-- <span class="line"></span> -->
                                    <!-- <span class="rewordProjectCardMakerName"> -->
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
                           		<!-- 퍼센트 충족조건 : 성공 -->
	                           	<c:if test="${(funding.nowAmount/funding.goalAmount)*100 >= 100}">
	                           	<div class="progress">
							        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: ${(funding.nowAmount/funding.goalAmount)*100}%"></div>
							    </div>
							    <span class="rewordProjectCardPercent" style="color:green;">
	                            	<fmt:formatNumber value="${(funding.nowAmount/funding.goalAmount)}" type="percent"/>
	                            </span>
	                            <span class="rewordProjectCardAmount">
									<fmt:formatNumber value="${funding.goalAmount}" pattern="#,###원"/>
								</span>
	                           		<span class="rewordProjectCardDay" style="color:green;">마감 
	                           		<span class="line"></span>
									 성공</span>
	                           	</c:if>
	                           	<!-- 퍼센트 충족조건 : 실패 -->
	                           	<c:if test="${(funding.nowAmount/funding.goalAmount)*100 < 100}">
	                           	<div class="progress">
							        <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: ${(funding.nowAmount/funding.goalAmount)*100}%"></div>
							    </div>
							    <span class="rewordProjectCardPercent" style="color:red;">
	                            	<fmt:formatNumber value="${(funding.nowAmount/funding.goalAmount)}" type="percent"/>
	                            </span>
	                            <span class="rewordProjectCardAmount">
									<fmt:formatNumber value="${funding.goalAmount}" pattern="#,###원"/>
								</span>
	                           		<span class="rewordProjectCardDay" style="color:red;">마감</span>
	                           	</c:if>
                           	</c:if>
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
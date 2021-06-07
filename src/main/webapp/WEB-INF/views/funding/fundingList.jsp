<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이프" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fundingList.css" />

	<div class="FundingMainWrapper">
        <div class="FundingViewSlider">
            <div class="FundingViewSlideList">
                <div class="FundingViewSlideTrack">
                    <div class="FundingViewSlideClone">
                        <div>
                            <div>
                                <a href="#">
                                    <div class="FundingViewSlideWrap">
                                        <div class="FundingViewSlideText">
                                            <p class="FundingViewSlideTitle">샐러드</p>
                                            <p class="FundingViewSlideContent">샐러드</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="FundingViewSlideBar">
                <div class="FundingViewSlideArrows">
                    <button type="button" class="FundingViewSlideArrowsPrev"></button>
                    <button type="button" class="FundingViewSlideArrowsNext"></button>
                </div>
                <div class="FundingViewSlideBarActive">
                    <div></div>
                </div>
            </div>
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
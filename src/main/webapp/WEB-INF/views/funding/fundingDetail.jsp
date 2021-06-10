<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />

<script>


	//창 가운데 띄우기위함
	function maker_chat_function(){
	var popupWidth = 200;
	var popupHeight = 300;
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	var popupY= (window.screen.height / 2) - (600 / 2);
	window.open('fundingChatMaker', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
		}
</script>
	
	<div id="funding_tap">
            <ol>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/fundingDetail">스토리</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/news.do">새소식</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/community.do">커뮤니티</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/supporter.do">서포터</a>
                </li>
            </ol>
        </div>

        <div id="funding_main">
            <div id="funding_main_image_and_content">
                <div id="funding_main_image">
                    <img src="${pageContext.request.contextPath }/resources/images/city1.PNG" alt="" style="width: 100%; height: 100%;">
                </div>

                <div id="funding_main_content">
					${funding.content}
                    내용들어갈부분

                </div>
            </div>


            <div id="funing_main_right_div">
                <div id="funing_main_right_div_1">
                    <div id="funding_detail_dday_div">10일 남음</div>
                    <div id="funding_detail_dday_div">aaaaa 목표bar 들어갈곳</div>
                    <div id="funding_detail_goal_percent_div">8500% 달성</div>
                    <div id="funding_detail_now_amount_div">444444 원 펀딩</div>
                    <div id="funding_detail_supporter_div">3333명의 서포터</div> <!-- funding_participation -->
                    <input id="funding_button" type="button" value="펀딩하기" onclick="location.href='${pageContext.request.contextPath}/funding/fundingReward';" />
                    <input type="button" value="좋아요" id="funding_detail_like_button"/>
                    <input type="button" value="1:1 채팅" id="funding_detail_chat_button"/>
                    <input type="button" value="공유하기" id="funding_detail_share_button"/>
                </div>


				<!--메이커정보 (해당 펀딩의 작성자정보) -->
                <div id="funing_main_right_div_2">
                메이커 정보
                	<div id="funding_detail_maker_logo_name_div">
                		<div id="funding_detail_maker_logo">로고</div>
                		<div id="funding_detail_maker_name">ㅁㅁㅁ컴퍼니</div>
                	</div>
                		<div id="funding_detail_maker_phone">메이커 연락처:0000</div>
                    <input type="button" value="메이커에게 문의하기" id="funding_detail_maker_chat_button" 
                    onclick="maker_chat_function()"/>


                </div>



                <div id="funing_main_right_div_3">
                    

                </div>

                <div id="funing_main_right_div_4">
                    

                </div>

            </div>

        </div>


      <style>
    #funding_tap {

    }    

    #funding_tap > ol {
    height: 50px;
    border: 2px solid black;
    text-align: center;
    }

    #funding_tap > ol > li{
    display: inline-block; 
    width: 98px;
    padding: 3px 10px;
    border-left: 1px solid #999;
    }




    /* 펀딩 메인 전체 div */
    #funding_main{
    width: 1000px;
    display: flex;
    margin: auto;
    }


    #funding_main_image_and_content{
    
    width: 800px;
    overflow: hidden;


    }


    /* 펀딩 메인 이미지 */
    #funding_main_image{
    height: 500px;
    height: 500px;
    

    }


    /* 펀딩 메인 내용 */
    #funding_main_content{
    width: 100%;
    height: 2000px;
    border: 2px solid black;

    }


    /* 펀딩 메인 오른쪽 펀딩하기 div*/
    #funing_main_right_div{


    }
    
    /* 펀딩 메인 오른쪽 펀딩하기 div1 > div*/
    #funing_main_right_div_1 > div{
    border: 1px solid black;
    height: 41px;

    }
    

    #funing_main_right_div > div{
    border: 2px solid black;
    width: 200px;
    height: 400px;
    margin-top: 30px;

    }
    
    
    /* 펀딩하기버튼 */
    #funding_button {
    width: 100%;
    height: 50px;
    
    }
    
    /* 좋아요 1:1채팅 공유하기 버튼 */
	#funding_detail_like_button, #funding_detail_chat_button, #funding_detail_share_button{
	width:31.3%;
	
	}
	
	/* 메이커 로고 + name */
	#funding_detail_maker_logo_name_div {
	display: flex;
	}
	
	#funding_detail_maker_logo_name_div > div {
	border: 2px solid black;
	}

    </style>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

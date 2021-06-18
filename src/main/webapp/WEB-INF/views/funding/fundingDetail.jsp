<%@page import="com.kh.interactFunding.member.model.vo.Member"%>
<%@page import="com.kh.interactFunding.funding.model.vo.FundingDetailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>

	//좋아요 버튼 클릭여부
	window.onload = function(){
		console.log("온로드함수")

	$.ajax({
		url:"${pageContext.request.contextPath}/funding/likeStatusCheck",
		data: {
			memberNo : ${loginMember.memberNo},
		},
		success(data){
			console.log(data)
			/* 좋아요를 누른상황 */
			if(data == 1){
				$("#icon_heart").html('<i class="fas fa-heart"></i>');
			
			}else{
			/* 좋아요 안누른상황 */
				$("#icon_heart").html('<i class="far fa-heart"></i>');
			}
		},
		error: console.log
		,
		
		})
	};


	//창 가운데 띄우기위함
	function maker_chat_function(){
	var popupWidth = 200;
	var popupHeight = 300;
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	var popupY= (window.screen.height / 2) - (600 / 2);
	window.open('fundingChatMaker', '', 'status=no, height=600, width=500, left='+ popupX + ', top='+ popupY);
		}
</script>

	<div id="funding_top_title_wrapper_wrapper">
		<div id="funding_top_title_wrapper">
			<div id="funding_top_title">
				<img src="${pageContext.request.contextPath }/resources/images/city1.PNG" id="funding_top_title_image">
				
			
			</div>
			<div id="funding_top_title_div">
			  ${funding.categoryCode}
			  <br />
			  ${funding.title}
			</div>
		</div>
	</div>
	
	<div id="funding_tap_wrapper">
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
       </div>

        <div id="funding_main">
            <div id="funding_main_image_and_content">
                <div id="funding_main_image">
                    <img src="${pageContext.request.contextPath }/resources/images/city1.PNG" alt="" style="width: 100%; height: 100%;">
   					<%-- ${funding.originalFileName}
					${funding.renamedFileName} --%>
                </div>

                <div id="funding_main_content">
                 	<br />	<br />	<br />	<br />	<br />
              		
              		${funding.content}
           		    ${funding.earlyContent}
                </div>
            </div>

			<!-- 남은날계산용 -->
			<fmt:parseNumber value="${funding.startDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
			<fmt:parseNumber value="${funding.DDay.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
			

            <div id="funing_main_right_div">
                <div id="funing_main_right_div_1">
                    <div id="funding_detail_dday_div">${endDate - strDate}일 남았습니다</div>
                    <div id="funding_detail_dday_bar_wrapper">
	                    <div id="funding_detail_dday_bar" class="progress">
		                      <div id="funding_detail_dday_bar_div" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
							  aria-valuenow="${funding.nowAmount}" aria-valuemin="0" aria-valuemax="${funding.goalAmount}" style="width:${funding.nowAmount / funding.goalAmount * 100}%">
		 					 </div>
						</div>
					</div>
                    <div id="funding_detail_goal_percent_div"> <fmt:formatNumber value="${funding.nowAmount / funding.goalAmount}" type="percent"/>달성</div><!-- 8500% 달성 -->
                   
                    <div id="funding_detail_now_amount_div">현재 ${funding.nowAmount}원 펀딩중</div><!-- 444444 원 펀딩 -->
                    <div id="funding_detail_supporter_div"> 현재 ${funding2}명의 서포터</div> <!-- 3333명의 서포터funding_participation -->
                    <input id="funding_button" type="button" value="펀딩하기" onclick="location.href='${pageContext.request.contextPath}/funding/fundingReward?fundingNo=	${funding.fundingNo}';" class="btn btn-info"/>
                    <button type="button" id="funding_detail_like_button" class="btn btn-outline-secondary" onclick="like_controll()">
                    <!--하트  -->
                    <span id="icon_heart" style="color:red;"><i class="far fa-heart"></i></span>
                    <!--좋아요숫자  -->
                    <span id="funding_detail_like_count">${funding.likeCount}</span></button>
                    <button type="button" value="1:1 채팅" id="funding_detail_chat_button" class="btn btn-outline-secondary"><span>1:1 채팅</span></button>
                    <!-- <input type="button" value="1:1 채팅" id="funding_detail_chat_button"/> -->
                </div>
                
                <span id="funding_detail_like_count"></span>

			 	<span id="maker_span">메이커 정보</span>
				<!--메이커정보 (해당 펀딩의 작성자정보) -->
                <div id="funing_main_right_div_2">
            		 
                	<div id="funding_detail_maker_logo_name_div">
                		<div id="funding_detail_maker_name">${funding.name}</div>
                	</div>
                		<div id="funding_detail_maker_phone">메이커 연락처 <br/>${funding.phone}</div>
                    <input type="button" value="메이커에게 문의하기" id="funding_detail_maker_chat_button" class="btn btn-info"
                    onclick="maker_chat_function()"/>


                </div>



                <span id="reward_span">리워드 선택</span>
                <div id="funing_main_right_div_3">
                    

                </div>

				<span id="ranking_span">인기게시글</span>
                <div id="funing_main_right_div_4">
                    

                </div>

            </div>

        </div>


      <style>
      
    #funding_top_title_wrapper_wrapper{
    height: 194px;
    overflow: hidden;
    }
     
    #funding_top_title_wrapper{
     }
      
    #funding_top_title{
    }
    
    #funding_top_title_image{
    width: 1600px;
    height: 197px;
    filter: blur(5px);
    transform: scale(1.8);
    
    }
    
    #funding_top_title_div{
    margin-top: -159px;
    text-align: center;
    font-size: 40px;
    font-weight: 900;
    z-index: 999;
    position: relative;
    color: #fff;
    }
    
    #funding_top_p{
    margin-top: -62px;
    text-align: center;
    font-size: 40px;
    font-weight: 900;
    z-index: 999;
    
    }
    #funding_tap {

    }    

    #funding_tap > ol {
    height: 50px;
    border-bottom: 3px solid #c0c2c0;
    text-align: center;
    }

    #funding_tap > ol > li{
    display: inline-block; 
    width: 98px;
    padding: 3px 10px;
    font-weight: 800;
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
    width: 95%;
    

    }


    /* 펀딩 메인 내용 */
    #funding_main_content{
    width: 97%;
    height: 2000px;

    }


    /* 펀딩 메인 오른쪽 펀딩하기 div*/
    #funing_main_right_div{
    font-size: 20px;
    font-weight: 600;


    }
    #funing_main_right_div_2, #funing_main_right_div_3, #funing_main_right_div_4{
	border: 2px solid #cccccc;
    border-radius: 6px;

    }
    
    /* 펀딩 메인 오른쪽 펀딩하기 div1 > div*/
    #funing_main_right_div_1 > div{
    height: 41px;
    margin-top: 6px;
    
    }
    

    #funing_main_right_div > div{
    width: 200px;
    height: 400px;
    padding-left: 10px;
    padding-top: 9px;
    

    }
    
    
    /* 펀딩하기버튼 */
    #funding_button {
    width: 96%;
    height: 50px;
    margin-top: 25px;
    
    }
    
    /* 좋아요 1:1채팅 공유하기 버튼 */
	#funding_detail_like_button, #funding_detail_chat_button{
	width:47.8%;
    height: 33px;
    margin-top: 8px;
	
	}
	
	/* 메이커 로고 + name */
	#funding_detail_maker_logo_name_div {
	display: flex;
	}
	
	#funding_detail_maker_logo_name_div > div {
	/* border: 2px solid black; */
	}

	#funding_detail_dday_bar_wrapper{
	height: 2px;
	
	}
	
	#funding_detail_dday_div{
	font-size: 24px;
	font-weight: 700;
	
	}
	
	#funding_detail_dday_bar{
	height: 10px;
	margin-top: 14px;
	}
	
	#funding_detail_maker_chat_button{
	margin-top: 13px;
    width: 96%;
    height: 50px;
	}
	
	#funding_detail_maker_name{
	margin-bottom: 11px;
	font-size : 25px;
	}
	
	#maker_span, #reward_span, #ranking_span{
	font-size: 9px;
    color: gray;
	}
	
	
	
    </style>
    
	<script>

    //좋아요 누를시
	function like_controll(){
		$("#funding_detail_like_button").attr("onclick","");
		$.ajax({
			url: "${pageContext.request.contextPath}/funding/loginMemberClickLike",
			data: {
				memberNo : ${loginMember.memberNo},
				fundingNo : ${funding.fundingNo},
			},
			method: "POST",
			success(data){
				console.log(data);
				$('#funding_detail_like_count').text(data.likeCount);
				if(data.heart == "on"){
					$("#icon_heart").html('<i class="fas fa-heart"></i>');
				}else{
					$("#icon_heart").html('<i class="far fa-heart"></i>');
					}
			},
			error: console.log
			,
			complete(){
				$("#funding_detail_like_button").attr("onclick","like_controll();");
			} 
		})
	}
	
	</script>	




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

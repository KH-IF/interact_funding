<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" 	/>
</jsp:include>




<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />

	<div id="funding_tap">
            <ol>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/funding_detail">스토리</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/funding_newboard">새소식</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/funding_community">커뮤니티</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/funding/funding_suporter">서포터</a>
                </li>
            </ol>
        </div>

        <div id="funding_main">
            <div id="funding_main_image_and_content">
                <div id="funding_main_image">
                    <img src="${pageContext.request.contextPath }/resources/images/city1.PNG" alt="" style="width: 100%; height: 100%;">
                </div>

                <div id="funding_main_content">

                    내용들어갈부분

                </div>
            </div>


            <div id="funing_main_right_div">
                <div id="funing_main_right_div_1">
                    <h2>10일 남음</h2>
                    <h4>20% 달성</h4>
                    <h4>100000000</h4>
                    <h4>50</h4>
                    <input id="funding_button" type="button" value="펀딩하기" onclick="location.href='${pageContext.request.contextPath}/funding/funding_reward';" />
                    <input type="button" value="좋아요" />
                    <input type="button" value="1:1 채팅" />
                    <input type="button" value="공유하기" />
                </div>

                <div id="funing_main_right_div_2">


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

    #funing_main_right_div > div{
    border: 2px solid black;
    width: 200px;
    height: 400px;
    margin-top: 30px;

    }

    </style>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

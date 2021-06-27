<!--펀딩하기 시작하기를 누르면 오게되는 페이지 입니다.
여기서는 프로젝트 새로만들기, 작성중인 프로젝트 정보, 작성완료한 프로젝트 정보, 현재 진행중인 프로젝트 정보, 진행완료한 지난 프로젝트 정보를
리스트로 받아옵니다.
알람 표시하는 부분이 header.jsp와 곂치는 부분이 있습니다 확인해주세요.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fundingMaker.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false">
    <jsp:param value="IF Funding Start" name="title"/>
</jsp:include>
<script>
window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 2000);
</script>
<style>
.cardProjectNo{
	text-align: center;
	padding: 5px;
	font-weight: bold;
	color: #17A2B8;

}
.card:hover{
	 box-shadow: 5px 5px 7px #888888;
	 background: #EEEEEE;
     height: 450px;
}
.card{
    height: 450px;
}
.goStudio{
	width: 100%;
}
.goFunding{
	width: 100%;
}
.startEndDate{
	font-size: 12px;
	text-align: right;
}
h2.h2Title{
	border-left: 15px solid #17A2B8;
	margin: 10px 0px 30px 0px;
	padding: 0px 0px 0px 15px;
}
.card-img-top{
	height: 175px;

}
.card-title{
	width: 240px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 45px;
}

</style>
    <section>
      	<!-- 알람 -->
		<c:if test="${not empty msg}">
		  <div class="alert alert-success" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>${msg}</strong> 
		  </div>
		</c:if>
		
        <div class ="container p-5">
        
        	<h2 class="h2Title"><strong>프로젝트 새로 만들기</strong></h2>
          	<form action="${pageContext.request.contextPath}/funding/newFunding" method="POST">
            	<button class="btn btn-outline-info" type="submit" id="sendPhoneNumber" style="width: 20vw;">새로 만들기 </button>
          	</form>
       
            <br />
           	<hr />
           	<br />
        	<h2 class="h2Title">
        		<strong>작성중인 프로젝트 정보</strong></h2>
           	<c:if test="${not empty statusNList}">
	            <c:forEach var="funding" items="${statusNList}" varStatus="vs">
					<div  class="card d-inline-flex m-2" style="width: 18rem;">
					<form  action="${pageContext.request.contextPath}/funding/existFunding" >
			           	<div class="cardProjectNo"><span>Project No.${funding.fundingNo}</span></div>
			           	<input  name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
						<c:set value="${funding.attachment}" var="attach" scope="page" />
						<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
							  
						
						<div class="card-body ">
						    <h5 class="card-title font-weight-bold">${funding.title == null? '제목 미지정':funding.title}</h5>
						    <div class="text-muted">
							    <p class="card-text">${loginMember.name}</p>
						    </div>
							<br>
							<button class="btn btn-outline-info goStudio" type="submit" >스튜디오 바로가기 </button>
						</div>
					</form>
					</div>
	            </c:forEach>
           	</c:if>
           	<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty statusNList}">
           		<div> 작성중인 프로젝트가 없습니다.</div>
           	</c:if>
	
	
			<br />
           	<hr />
           	<br />
        	<h2 class="h2Title"><strong>작성완료한 프로젝트 정보</strong></h2>
        	<c:if test="${not empty statusYList}">
				<c:forEach var="funding" items="${statusYList}">
					<div class="card d-inline-flex m-2" style="width: 18rem;">
					<form  action="${pageContext.request.contextPath}/funding/existFunding" >
						<div class="cardProjectNo"><span>Project No.${funding.fundingNo}</span></div>
						<input name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
					  	<c:set value="${funding.attachment}" var="attach" scope="page" />
					  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
						  
				  		<div class="card-body">
					    	<h5 class="card-title font-weight-bold">${funding.title == null? '제목 미지정':funding.title}</h5>
					    	<div class="text-muted">
							    <p class="card-text">${loginMember.name}</p>
						    	<p class="startEndDate">시작일 : ${funding.startDate} <br />
							    					  종료일 : ${funding.DDay}
							    </p>
					    	</div>
						    <button class="btn btn-outline-info goStudio" type="submit" >스튜디오 바로가기 </button>
					 	</div>
					</form>
					</div>
	            </c:forEach>
            </c:if>
         
			<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty statusYList}">
           		<div> 작성완료한 프로젝트가 없습니다.</div>
           	</c:if>
           	
           	
			<br />
           	<hr />
           	<br />
        	<h2 class="h2Title"><strong>현재 진행중인 프로젝트 정보</strong></h2>
        	<c:if test="${not empty nowList}">
				<c:forEach var="funding" items="${nowList}">
					<div class="card d-inline-flex m-2" style="width: 18rem;">
						<div class="cardProjectNo"><span>Project No.${funding.fundingNo}</span></div>
						<input name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
					  	<c:set value="${funding.attachment}" var="attach" scope="page" />
					  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
						  
					  	<div class="card-body">
					    	<h5 class="card-title font-weight-bold">${funding.title == null? '제목 미지정':funding.title}</h5>
						    <div class="text-muted">
							    <p class="card-text">${loginMember.name}</p>
								<p class="startEndDate">시작일 : ${funding.startDate} <br />
							    					종료일 : ${funding.DDay}
							    </p>
							</div>
						    <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
		                        style="color: #000000;">
						    	<button class="btn btn-outline-info goFunding" type="button">펀딩페이지 바로가기 </button>
		                    </a>
						</div>
					</div>
	            </c:forEach>
        	</c:if>
          
			<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty nowList}">
           		<div> 현재 진행중인 프로젝트가 없습니다.</div>
           	</c:if>
           	
           	
			<br />
           	<hr />
           	<br />
        	<h2 class="h2Title"><strong>진행완료한 지난 프로젝트 정보</strong></h2>
        	<c:if test="${not empty finishList}">
				<c:forEach var="funding" items="${finishList}">
					<div class="card d-inline-flex m-2" style="width: 18rem;">
						<div class="cardProjectNo"><span>Project No.${funding.fundingNo}</span></div>
						<input name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
					  	<c:set value="${funding.attachment}" var="attach" scope="page" />
					  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
						  
					  	<div class="card-body">
					    	<h5 class="card-title font-weight-bold">${funding.title == null? '제목 미지정':funding.title}</h5>
						    <div class="text-muted">
							    <p class="card-text">${loginMember.name}</p>
								<p class="startEndDate">시작일 : ${funding.startDate} <br />
							    					종료일 : ${funding.DDay}
							    </p>
							</div>
						    <a href="${pageContext.request.contextPath}/funding/fundingDetail?fundingNo=${funding.fundingNo}"
		                        style="color: #000000;">
						    	<button class="btn btn-outline-info goFunding" type="button">펀딩페이지 바로가기 </button>
		                    </a>
						</div>
					</div>
	            </c:forEach>
            </c:if>
         
			<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty finishList}">
           	<div> 진행완료한 지난 프로젝트가 없습니다.</div>
           	</c:if>
    </div>
    </section>
    
  
<script>
function newFunding(){

	$.ajax({
		url:`${pageContext.request.contextPath}/funding/newFunding`,
		method:"POST",
		success(data){
			window.location.href = `${pageContext.request.contextPath}/funding/fundingStart2`;
			},
		error:console.log
		});
	
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 

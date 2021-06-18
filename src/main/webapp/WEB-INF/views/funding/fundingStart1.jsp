<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save | IF Maker Studio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- SweetAlert Ver1 , 2아님 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>

window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 2000);
</script>
</head>
<body>
    <section>
      	<!-- 알람 -->
		<c:if test="${not empty msg}">
		  <div class="alert alert-success" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>${msg}</strong> 
		  </div>
		</c:if>
        <div class ="container p-5">
        	<h2><strong>프로젝트 새로 만들기</strong></h2>
          	<form action="${pageContext.request.contextPath}/funding/newFunding" method="POST">
            	<button class="btn btn-outline-info " type="submit" id="sendPhoneNumber">새로 만들기 </button>
          	</form>
          
            
            <br />
           	<hr />
           	<br />
        	<h2><strong>작성중인 프로젝트 정보</strong></h2>
            
            
           	<c:if test="${not empty statusNList}">
            <c:forEach var="funding" items="${statusNList}" varStatus="vs">
			<div id="funding" class="card d-inline-flex m-2" style="width: 18rem;">
			<form  action="${pageContext.request.contextPath}/funding/existFunding" id="existFundingFrm">
	           	<p class="card-text">${funding.fundingNo}</p>
	           	<input id="fundingNo" name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
				<!-- 메인이미지 넣을 것  -->
				  <c:forEach items="${funding.attachList}" var="attach" varStatus="vs">
					  <c:if test="${vs.count == 1}">
					  <c:if test="${attach.originalFilename == null}">
					  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/image-not-found.jpg" alt="대표이미지 등록 필요"> 
					  </c:if>
					  <c:if test="${attach.originalFilename != null}">
					  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="대표이미지 등록 필요"> 
					  </c:if>
					  </c:if>
				  </c:forEach>
				  <div class="card-body">
				    <h5 class="card-title">${funding.title == null? '제목 미지정':funding.title}</h5>
				<!-- 작성자 불러오기  -->
				    <p class="card-text">${loginMember.name}</p>
				    <button class="btn btn-outline-info " type="submit" id="goStudio">스튜디오 바로가기 </button>
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
        	<h2><strong>작성완료한 프로젝트 정보</strong></h2>
        	<c:if test="${not empty statusYList}">
			<c:forEach var="funding" items="${statusYList}">
			<div class="card d-inline-flex m-2" style="width: 18rem;">
			<input id="fundingNo" type="hidden" value="${funding.fundingNo}"/>
			<!-- 메인이미지 넣을 것  -->
			  <img class="card-img-top" src="" alt="대표이미지 등록 필요">
			  <div class="card-body">
			    <h5 class="card-title">${funding.title}</h5>
			    <h5 class="card-title">${loginMember.name}</h5>
			<!-- 작성자 불러오기  -->
			    <p class="card-text">${funding.name}</p>
			    <button class="btn btn-outline-info " type="button" id="goStudio" onclick="goStudio(this)">스튜디오 바로가기 </button>
			  </div>
			</div>
            </c:forEach>
            </c:if>
         
			<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty statusYList}">
           	<div> 작성완료한 프로젝트가 없습니다.</div>
           	</c:if>
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


/* $("#existFundingFrm").submit(e =>{
	

	const fundingNo = $('#fundingNo').val();
	console.log(fundingNo);
	
	$.ajax({
		url:`${pageContext.request.contextPath}/funding/fundingStart2/\${fundingNo}`,
		method:"GET",
		success(data){
			console.log(data);
			window.location.href = `${pageContext.request.contextPath}/funding/fundingStart2`;
			},
		error:console.log
		});
	
}); */


</script>
</body>
</html>
 

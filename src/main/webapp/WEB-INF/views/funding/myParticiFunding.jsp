<!-- 	<h1 style="cursor:pointer" data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="2" onclick="msgSetting(this)">쪽지 보내기 테스트</h1> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save | IF Maker Studio</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- SweetAlert Ver1 , 2아님 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
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
        	<h2><strong>내가 참여한 펀딩</strong></h2>
       		
        	<c:if test="${not empty list}">
			<c:forEach var="funding" items="${list}">
			<div class="card d-inline-flex m-2" style="width: 18rem;">
			<!-- 진행완료한 펀딩 페이지로 이동하기 -->
				<p class="card-text">${funding.fundingNo}</p>
				<input name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
				<!-- 메인이미지 넣을 것  -->
				<c:if test="${funding.attachment == null}">
				<img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/image-not-found.jpg" alt="대표이미지 등록 필요"> 
				</c:if>
				<c:if test="${funding.attachment != null}">
				<c:set value="${funding.attachment}" var="attach" scope="page" />
				<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
				</c:if>
				  
				<div class="card-body">
					<h5 class="card-title">${funding.title == null? '제목 미지정':funding.title}</h5>
				<!-- 작성자 불러오기  -->
				    <p class="card-text">${loginMember.name}</p>
			    	<button class="btn btn-outline-info" type="button" data-toggle="modal" data-target="#fundingParticipationDetail${funding.fundingNo}">펀딩상세보기</button>
				</div>
			</div>
			<!-- detail Modal -->
			<div class="modal fade" id="fundingParticipationDetail${funding.fundingNo}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">${funding.title}</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" id="modal-body-${funding.fundingNo}">
			      <c:forEach items="${map[funding.fundingNo].rewardList}" var="reward">
			      <div class="rewardContainer alert alert-warning">
			      	<table class="table table-bordered center" style="text-align:center;">
			      	<thead class="thead-light">
			      		<tr>
			      			<th>상품명</th>
			      			<th>가격</th>
			      			<th>배송비</th>
			      			<th>배송시작일</th>
			      			<th>취소</th>
			      		</tr>
			      	</thead>
			      		<tr>
			      			<td>${reward.title}</td>
			      			<td>${reward.price}</td>
			      			<td>${reward.shippingPrice}</td>
			      			<td>${reward.shippingDate}</td>
			      			<td><input type="button" class="btn btn-outline-danger" value="취소" data-price="${reward.price}" data-fno="${funding.fundingNo}" data-no="${reward.no}" onclick="cancelReward(this);"/></td>
			      		</tr>
			      		<tr>
			      			<td colspan="5">${reward.content}</td>
			      		</tr>
			      	</table>
			      </div>
			      </c:forEach>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
            </c:forEach>
            </c:if>
			<!--불러올 리스트가 없을 경우  -->
           	<c:if test="${empty list}">
           	<div>참여한 펀딩이 존재하지 않습니다.</div>
           	</c:if>
       	</div>
    </section>
    <script>

	  	//모달을 사용할수있게 해주는 함수
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').trigger('focus')
		});

		//리워드 취소
		function cancelReward(btn){
			var no = $(btn).data("no");
			var fno = $(btn).data("fno");
			var price = $(btn).data("price");
			var $reward = $(btn).parent().parent().parent().parent().parent();
			$reward[0].outerHTML = "";

			var $modalBody = $("#modal-body-"+fno);
			if($.trim($modalBody.html())==""){
				var notification = "<h5 class='alert alert-danger'>신청한 리워드가 존재하지 않습니다</h5>";
				$modalBody.append(notification);
			}

			$.ajax({
				url:"${pageContext.request.contextPath}/funding/cancelReward",
				method:"post",
				data:{
					no:no,
					price:price,
				},
				success:function(data){
					var {status, msg} = data;
					if(status){
						swal("안내",msg,"success");
					}else{
						swal("안내",msg,"error");
					}
				},
				error:console.log,
			});
		}
    </script>
    
    <style>
    .rewardContainer tbody tr:first-child{
    	line-height: 40px;
    }
    </style>
</body>
</html>
 

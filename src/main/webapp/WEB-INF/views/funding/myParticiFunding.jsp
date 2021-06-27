<!-- 	<h1 style="cursor:pointer" data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="2" onclick="msgSetting(this)">쪽지 보내기 테스트</h1> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fundingMaker.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false">
    <jsp:param value="IF Funding Start" name="title"/>
</jsp:include>
      	<!-- 알람 -->
		<c:if test="${not empty msg}">
		  <div class="alert alert-success" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  <strong>${msg}</strong> 
		  </div>
		</c:if>
        <div class ="container p-5">
        	<h2 class="h2Title"><strong>내가 참여한 펀딩</strong></h2>
       		
        	<c:if test="${not empty list}">
			<c:forEach var="funding" items="${list}">
			<div class="card d-inline-flex m-2" style="width: 18rem;">
			<!-- 진행완료한 펀딩 페이지로 이동하기 -->
				<div class="cardProjectNo"><span>Project No.${funding.fundingNo}</span></div>
				<input name="fundingNo" type="hidden" value="${funding.fundingNo}"/>
				<!-- 메인이미지 넣을 것  -->
				<c:set value="${funding.attachment}" var="attach" scope="page" />
			  	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}"  alt="파일을 찾을 수 없습니다."> 
						  
				  
				<div class="card-body">
					<h5 class="card-title">${funding.title == null? '제목 미지정':funding.title}</h5>
				<!-- 작성자 불러오기  -->
					<p class="startEndDate">시작일 : ${funding.startDate} <br />
				    					종료일 : ${funding.DDay}
				    </p>
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
		.cardProjectNo {
			text-align: center;
			padding: 5px;
			font-weight: bold;
			color: #17A2B8;
		}
		
		.card:hover {
			box-shadow: 5px 5px 7px #888888;
			background: #EEEEEE;
			height: 450px;
		}
		
		.card {
			height: 450px;
		}
		
		.goStudio {
			width: 100%;
		}
		
		.goFunding {
			width: 100%;
		}
		
		.startEndDate {
			font-size: 12px;
			text-align: right;
		}
		
		h2.h2Title {
			border-left: 15px solid #17A2B8;
			margin: 10px 0px 30px 0px;
			padding: 0px 0px 0px 15px;
		}
		
		.card-img-top {
			height: 175px;
		}
		
		.card-title {
			width: 240px;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
			overflow: hidden;
			text-overflow: ellipsis;
			height: 45px;
		}
	</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 

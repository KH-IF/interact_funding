<!-- 기본정보를 입력하는 페이지 입니다.  -->
<%@page import="com.kh.interactFunding.funding.model.vo.FundingExt"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/makerNav.jsp" flush="false">
    <jsp:param value="Basic Info | IF Maker Studio" name="title"/>
</jsp:include>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
	<form name="basicInfo"
		action="${pageContext.request.contextPath}/funding/saveBasicInfo" 
		method="post"
		enctype="multipart/form-data" 
		>
    <div class="container p-5">
        <input type="hidden" name="fundingNo" value="${funding.fundingNo}" />
        
        <h1 class="font-weight-bold">기본 정보</h1>
        <p>프로젝트를 대표할 주요 기본 정보를 입력하세요.</p>
        
        
        <br>    
        <h6> 프로젝트 제목</h6>
        <div class="input-group">
        <c:if test="${funding.title != null}">
            <input value="${funding.title}" name="title" type="text" class="form-control" maxlength="40" placeholder="제목 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
        </c:if>
        <c:if test="${funding.title == null}">
            <input name="title" type="text" class="form-control" maxlength="40" placeholder="제목 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
        </c:if>
        </div>

        <br>    
        <h6> 목표 금액</h6>
        <p class="text-muted" style="font-size:13px">최소 50만 원 ~ 최대 1억 원으로 설정하세요.</p>
        <div class="input-group">
         <c:if test="${funding.goalAmount != null}">
            <input value="${funding.goalAmount< 500000? 500000:funding.goalAmount}" name="goalAmount" type="number" min="500000" max="100000000" class="form-control" placeholder="목표 금액 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <span class="p-1">원</span>
         </c:if>
         <c:if test="${funding.goalAmount == null}">
            <input name="goalAmount" type="number" min="500000" max="100000000" class="form-control" placeholder="목표 금액 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <span class="p-1">원</span>
         </c:if>
        </div>
     
     	
     
        <br>
        <h6>대표 이미지</h6>
	   	
        <div class="custom-file">
	        <label for="upFile" class="custom-file-label" for="upFile" onclick="updateImage();">등록하기</label>
	        <input name="upFile"class="custom-file-input" id="upFile" type="file"  accept=".jpg, .jpeg, .png" style="display:none"/>
        </div>
        <p class="text-muted">
            3MB 이하의 JPEG, PNG 파일
            해상도 1200x675 픽셀 이상
            텍스트 및 로고 삽입 금지
        </p>
        
     
	    <c:if test="${funding.attachment != null}">
	    <c:set var="attach" value="${funding.attachment}" scope="page"/>
	    	<div id="existImg" style="margin-top:10px;">
	    		<img src="${pageContext.request.contextPath}/resources/upload/${attach.renamedFilename}" style="width:20vw;" onerror="imgAreaError()"/>
	    	</div>
	
	    </c:if>
	    <!-- 업로드 했을 때 미리보기 이미지 -->
    	<div id="imgViewArea" style="margin-top:10px; display:none;">
    		<img id="imgArea" style="width:20vw;" onerror="imgAreaError()"/>
    	</div>
	
	
		 

        <br>
        <h6>카테고리</h6>
        <div class="input-group mb-3">
            <select class="custom-select" name="categoryCode">
<!-- : 테크가전, 푸드, 여행, 스포츠, 게임취미, 모임, 반려동물, 기부후원-->
              <option selected disabled>카테고리 선택</option>
              <option value="C1" ${funding.categoryCode eq 'C1'? "selected":""}>테크·가전</option>
              <option value="C2" ${funding.categoryCode eq 'C2'? "selected":""}>푸드</option>
              <option value="C3" ${funding.categoryCode eq 'C3'? "selected":""}>여행</option>
              <option value="C4" ${funding.categoryCode eq 'C4'? "selected":""}>스포츠</option>
              <option value="C5" ${funding.categoryCode eq 'C5'? "selected":""}>게임·취미</option>
              <option value="C6" ${funding.categoryCode eq 'C6'? "selected":""}>모임</option>
              <option value="C7" ${funding.categoryCode eq 'C7'? "selected":""}>반려동물</option>
              <option value="C8" ${funding.categoryCode eq 'C8'? "selected":""}>기부후원</option>
            </select>
        </div>

        <br>
     	
        
        <h6>프로젝트 종료일</h6>
        <p class="text-muted">
            요건・콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해주세요.
        </p>
  
     	<c:if test="${funding.DDay == null}">
        <div class="form-group row">
		    <input class="form-control ml-3" type="date" value="<%=sf.format(nowTime) %>" name="dDay">
		</div>
     	</c:if>
 
     	<c:if test="${funding.DDay != null}">
        <div class="form-group row">
		    <input class="form-control ml-3" type="date" value="${funding.DDay}" name="dDay">
		</div>
     	</c:if>
   
        
        <br><br>
        <input type="submit" class="btn btn-primary btn-lg" style="width: 200px;" value="저장하기"/>

    </div>
	</form>
	</section>
<script>
$(() =>{
	$("[name=upFile]").change(e =>{
		//파일명 가져오기
		var file = $(e.target).prop('files')[0];
		console.log(file);
		/* var $label = $(e.target).next();
		
		//label 적용
		$label.html(file? file.name:"파일을 선택하세요"); */
		
	});
});


function updateImage(){
	$("#existImg").hide()
}

//이미지 미리보기
//콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgArea').attr('src', e.target.result); 
			console.log(e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
};

$(":input[name='upFile']").change(function() {
	if( $(":input[name='upFile']").val() == '' ) {
		$('#imgArea').attr('src' , '');  
	}
	$('#imgViewArea').css({ 'display' : '' });
	readURL(this);
});

// 이미지 에러 시 미리보기영역 미노출
function imgAreaError(){
	$('#imgViewArea').css({ 'display' : 'none' });
};

</script>
</body>
</html>
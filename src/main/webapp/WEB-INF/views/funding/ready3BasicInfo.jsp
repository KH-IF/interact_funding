<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		<!-- onsubmit="return boardValidate();" -->
    <div class="container p-5">
        <input type="hidden" name="fundingNo" value="${funding.fundingNo}" />
        
        <h1 class="font-weight-bold">기본 정보</h1>
        <p>프로젝트를 대표할 주요 기본 정보를 입력하세요.</p>
        
        
        <br>    
        <h6> 프로젝트 제목</h6>
        <div class="input-group">
            <input name="title" type="text" class="form-control" maxlength="40" placeholder="제목 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
        </div>
        <p>40자 남음</p>

        <br>    
        <h6> 목표 금액</h6>
        <p class="text-muted" style="font-size:13px">최소 50만 원 ~ 최대 1억 원으로 설정하세요.</p>
        <div class="input-group">
            <input name="goalAmount" type="number" min="500000" max="100000000" class="form-control" placeholder="목표 금액 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <span class="p-1">원</span>
        </div>
        <p>40자 남음</p>

        <br>
        <h6>대표 이미지</h6>
	   	
        <div class="custom-file">
	        <label for="upFile" class="custom-file-label" for="upFile">등록하기</label>
	        <input name="upFile"class="custom-file-input" id="upFile" type="file"  accept=".jpg, .jpeg, .png" style="display:none"/>
        </div>
        <p class="text-muted">
            3MB 이하의 JPEG, PNG 파일
            해상도 1200x675 픽셀 이상
            텍스트 및 로고 삽입 금지
        </p>
        
	    <!-- 업로드 했을 때 미리보기 이미지 -->
    	<div id="imgViewArea" style="margin-top:10px; display:none;">
    		<img id="imgArea" style="width:200px; height:100px;" onerror="imgAreaError()"/>
    	</div>
		 

        <br>
        <h6>카테고리</h6>
        <div class="input-group mb-3">
            <select class="custom-select" name="categoryCode">
<!-- : 테크가전, 푸드, 여행, 스포츠, 게임취미, 모임, 반려동물, 기부후원-->
              <option selected disabled>카테고리 선택</option>
              <option value="C1">테크가전</option>
              <option value="C2">푸드</option>
              <option value="C3">여행</option>
              <option value="C4">스포츠</option>
              <option value="C5">게임취미</option>
              <option value="C6">모임</option>
              <option value="C7">반려동물</option>
              <option value="C8">기부후원</option>
            </select>
        </div>

        <br>
        <h6>프로젝트 종료일</h6>
        <p class="text-muted">
            요건・콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해주세요.
        </p>
        <div class="form-group row">
		    <input class="form-control ml-3" type="date" value="<%=sf.format(nowTime)%>" name="dDay">
		</div>
        
        <br><br>
        <input type="submit" class="btn btn-primary btn-lg" style="width: 200px;" value="시작하기"/>
<!--         <button type="button" class="btn btn-primary btn-lg" style="width: 200px;" onclick="saveBasicInfo()">시작하기</button> -->
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


/* function basicInfoValidate(){
	var $projectTitle = $("[name=title]");
	if(/^(.|\n)+$/.test($title.val()) == false){
		alert("제목을 입력하세요");
		return false;
	}
	var $goal_amount = $("[name=goal_amount]");
	if(/^(.|\n)+$/.test($goal_amount.val()) == false){
		alert("목표금액을 입력하세요");
		return false;
	}
	var $projectTitle = $("[name=projectTitle]");
	if(/^(.|\n)+$/.test($projectTitle.val()) == false){
		alert("제목을 입력하세요");
		return false;
	}
	return true;
}; */


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
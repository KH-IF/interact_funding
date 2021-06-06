<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/maker/common/makerNav.jsp" flush="false">
    <jsp:param value="Basic Info | IF Maker Studio" name="title"/>
</jsp:include>
    <div class="container p-5">

        <h1 class="font-weight-bold">기본 정보</h1>
        <p>프로젝트를 대표할 주요 기본 정보를 입력하세요.</p>
        
        <br>    
        <h6> 프로젝트 제목</h6>
        <div class="input-group">
            <input type="text" class="form-control" maxlength="40" placeholder="제목 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
        </div>
        <p>40자 남음</p>

        <br>    
        <h6> 목표 금액</h6>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="목표 금액 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
            <span class="p-1">원</span>
        </div>
        <p>40자 남음</p>

        <br>
        <h6>대표 이미지</h6>
        <button type="button" class="btn btn-secondary btn-lg">등록하기</button>
        <p class="text-muted" style="width: 250px;">
            3MB 이하의 JPEG, PNG 파일
            해상도 1200x675 픽셀 이상
            텍스트 및 로고 삽입 금지
        </p>

        <br>
        <h6>카테고리</h6>
        <div class="input-group mb-3">
            <select class="custom-select" id="makerCategory">
<!-- : 테크가전, 푸드, 여행, 스포츠, 게임취미, 모임, 반려동물, 기부후원-->
              <option selected>카테고리 선택</option>
              <option value="techno">테크가전</option>
              <option value="food">푸드</option>
              <option value="travel">여행</option>
              <option value="sport">스포츠</option>
              <option value="gameHobby">게임취미</option>
              <option value="meeting">모임</option>
              <option value="pet">반려동물</option>
              <option value="donation">기부후원</option>
            </select>
        </div>

        <br>
        <h6>프로젝트 종료일</h6>
        <p class="text-muted">
            요건・콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해주세요.
        </p>
        <input type="date" name="endDate" id="endDate">
        <br><br>
        <!-- 성인인증과 검색용 태그는 논의 후에 집어넣을 것 -->
        <button type="button" class="btn btn-primary btn-lg" style="width: 200px;">시작하기</button>
    </div>

</section> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/maker/common/makerNav.jsp" flush="false">
    <jsp:param value="Start3 | IF Maker Studio" name="title"/>
</jsp:include>


    <div class="container p-5">
        <div class="btn-block progress">
            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <br>
        <h1 class="display-5 font-weight-bold">프로젝트는 4단계에 걸쳐 오픈됩니다.</h1>
        <p class="lead">아래와 같은 4단계의 진행 과정을 통해 프로젝트가 오픈됩니다. 
            투명하고 신뢰도 있는 프로젝트를 오픈하기 위해 꼭 필요한 절차이니 차근차근 진행해주세요.</p>
        <hr class="my-4">
        <br>

        <p class="font-weight-bold">1단계: 펀딩 준비 작성</p>
        <p>펀딩 준비 메뉴들의 필수항목을 모두 작성하여 제출해주세요.</p>

        <p class="font-weight-bold">2단계: 요건 확인 진행</p>
        <p>메이커님이 작성하신 항목들을 토대로 와디즈 펀딩을 진행하기 위한 기본 요건 사항이 충족되는지 확인합니다. (영업일 기준 3-5일 소요)</p>
        
        <p class="font-weight-bold">3단계: 콘텐츠 확인 진행</p>
        <p>요건 확인 완료 시, 프로젝트의 핵심인 스토리를 중심으로 콘텐츠를 확인합니다. 필요 시, 와디즈 담당자가 피드백을 반영 요청할 수 있습니다.</p>

        <p class="font-weight-bold">4단계: 펀딩 오픈</p>
        <p>약정 체결 등 모든 준비가 완료되면 오픈이 승인됩니다. 메이커님이 직접 '바로 오픈' 혹은 '오픈예약’ 할 수 있습니다.</p>
        
        <p class="lead">
            <button type="button" class="btn btn-secondary btn-lg"> &lt; 이전 </button> 
            <a class="btn btn-primary btn-lg" href="#" role="button" style="width: 200px;">다음</a>
        </p>






    </div>
    </section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/maker/common/makerNav.jsp" flush="false">
    <jsp:param value="Start5 | IF Maker Studio" name="title"/>
</jsp:include>

    <div class="container p-5">
        <div class="btn-block progress">
            <div class="progress-bar bg-info" role="progressbar" style="width: 100%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <br>
        <h1 class="display-5 font-weight-bold">마지막으로 기본 사항을 확인하세요.</h1>
        <p class="lead">메이커님의 프로젝트를 등록하려면 일정 기준에 부합해야 합니다. 프로젝트를 작성하기 전에 다음 기준을 충족하는지 확인해보세요.</p>


        <br>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
            <label class="form-check-label" for="defaultCheck1">
                펀딩 진행 중에는 제공할 리워드를 다른 온∙오프라인에서 펀딩하거나 판매하지 않습니다.
            </label>
        </div>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
            <label class="form-check-label" for="defaultCheck1">
                제공할 리워드는 현금, 지분 등의 수익이 아닌 제품 또는 서비스입니다.
            </label>
        </div>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck3">
            <label class="form-check-label" for="defaultCheck1">
                진행할 프로젝트 및 리워드가 제 3자의 지식재산권을 침해하지 않으며, 와디즈가 침해 사실을 인지하는 경우 해당 프로젝트를 중단/취소할 수 있습니다.
            </label>
        </div>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck4">
            <label class="form-check-label" for="defaultCheck1">
                서포터에게 프로젝트 진행 과정을 안내하고, 배송 약속을 지킬 수 있습니다.
            </label>
        </div>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck5">
            <label class="form-check-label" for="defaultCheck1">
                서포터와의 신뢰를 위해 펀딩 진행∙리워드 제작∙배송 등 모든 과정에서 겪는 어려움들을 서포터에게 진솔하게 전달하고 문제를 해결합니다.
            </label>
        </div>

        <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" value="" id="defaultCheck6">
            <label class="form-check-label" for="defaultCheck1">
                리워드의 관계 법령 및 관련 광고 심의 규정을 준수하여 스토리를 작성하겠습니다.
            </label>
        </div>

        <br>

        <button type="button" class="btn btn-secondary btn-lg"> &lt; 이전 </button> 
        <!-- 다 체크해야 버튼 활성화되게 하기 -->
        <a class="btn btn-primary btn-lg" href="#" role="button" style="width: 200px;">시작하기</a>
      

    </section> 
</body>
</html>
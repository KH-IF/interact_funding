<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/maker/common/makerNav.jsp" flush="false">
    <jsp:param value="Basic Require | IF Maker Studio" name="title"/>
</jsp:include>

<!-- 페이지 설명 리워드의 과거 유통여부와 배송. 카테고리를 정하는 페이지 -->

<style>

/* 모달 배경화면 투명도  */
.modal-backdrop
{
    opacity:0.5 !important;
}

/* 내부 scroll */
/* Important part */
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 80vh;
    overflow-y: auto;
}

</style>

<div class="container p-5">
            
    <h1 class="font-weight-bold">기본 요건</h1>
    <p class="text-muted">펀딩 진행을 위한 기본 요건을 확인하고자 합니다. 심사 시 확인하는 중요한 정보이므로 반드시 정확한 정보를 입력하세요.
        답변 내용이 사실과 다른 경우, 약정 위반에 따른 불이익이 발생할 수 있습니다.
    </p>

    <p>
        Q1. 리워드가 타 크라우드펀딩사 및 온라인 커머스, 자사 홈페이지 등 다른 판매처에서 유통된 적이 있거나 현재 유통 중인가요?
    </p>
    <div class="makerbasicrequirechb">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <input type="radio" aria-label="Radio button for following text input">
          </div>
            <label for="">아니요. 다른 곳에서 유통한 적이 없으며 와디즈를 통해 처음 선보이는 제품입니다.</label>
        </div>
        
        <div class="input-group-prepend">

            <div class="input-group-text">
                <input type="radio" aria-label="Radio button for following text input">
            </div>
            <label for="">예, 다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.</label>
        </div>
            
            <!-- 예일 경우에 보여야하는 TEXTAREA  -->
            <div class="container">
                <p class="text-muted">
                    리워드가 다른 판매처에서 유통된 적이 있다면 리워드로 제공할 수 없습니다.
                    기존에 유통하던 제품/서비스에 비해 개선된 점이 있다면 아래에 상세하게 작성해주세요.
                </p>
                <textarea class="form-control" aria-label="With textarea" id="basicRequireYes" placeholder="ex) 리워드의 개선점을 보안하여 00이 추가되었고, 이전에 판매된 적 없는 새로운 브라운 컬러로 리워드 프로젝트를 진행하려 합니다." cols=""  rows="3" maxlength="500"></textarea>
                <!-- 몇 글자 남았는지 표시 -->
                <p>500</p>
            </div>
    </div>

    <p>
        Q2. 현재까지 진행된 리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.
    </p>
    <p class="text-muted">
        1) 리워드가 유형의 제품인 경우 제작 공정에 따른 현재 리워드의 제작 상태 및 제조 시설명과 일일 최대 생산 가능량을 포함한 앞으로의 생산 계획을 작성해주세요.
        2) 공연, 영화, 전시 등 무형 서비스인 경우, 장소 대관, 촬영 일정 등의 현재 준비 상태 및 앞으로의 계획을 작성해주세요.
    </p>
  
    <div class="container">
        <textarea class="form-control" aria-label="With textarea" id="basicRequireYes" placeholder="내용을 입력하세요." cols=""  rows="3" maxlength="500"></textarea>
        <!-- 몇 글자 남았는지 표시 -->
        <p>500</p>
    </div>
    

    <p>
        Q3. 리워드의 전달 계획을 알려주세요.
    </p>
    <p class="text-muted">
        1) 리워드의 전달 방법(택배 or SMS 등)을 입력하고, 리워드 제작 및 전달 일정이 변동될 가능성이 있다면 사유를 알려주세요.
        2) 발송 업체명 및 일일 최대 발송 가능량을 입력해주세요.
        3) 공연, 영화, 전시 등 무형 서비스의 경우 좌석수, 일 최대 예약 가능 수량 등을 작성해주세요.
    </p>
  
    <div class="container">
        <textarea class="form-control" aria-label="With textarea" id="basicRequireYes" placeholder="내용을 입력하세요." cols=""  rows="3" maxlength="500"></textarea>
        <!-- 몇 글자 남았는지 표시 -->
        <p>500</p>
    </div>

    <p>
        리워드 종류 및 제작 형태
    </p>
    <p class="text-muted">
        리워드 종류 및 제작 형태를 선택한 후, 그에 따른 필수 서류를 업로드하세요. 제공할 모든 리워드의 종류를 반드시 추가하세요.
    </p>
    <button type="button" class="btn btn-secondary" onclick="makerRewardCategory();">
        +추가하기
    </button>

    <!-- 리워드 종류 선택 -->
    <div id="makerRewardCategory" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" >
    <div class="modal-content">
        <div class="modal-header">
            <p class="font-weight-bold">리워드 종류 및 제작 형태</p>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <hr>
        <div class="modal-body" data-spy="scroll"  style="height: 500px;">
            <!--: 테크가전, 푸드, 여행, 스포츠, 게임취미, 모임, 반려동물, 기부후원-->
            <div>
                <div class="list-group-item">
                    <strong>테크제품</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="테크제품">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>푸드</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="푸드">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>여행</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="여행">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>스포츠</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="스포츠">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>게임취미</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="게임취미">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>모임</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="모임">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>반려동물</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="반려동물">선택</button>
                </div>
                <div class="list-group-item">
                    <strong>기부후원</strong>
                    <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm" onclick="nextModal(this)" value="기부후원">선택</button>
                </div>
                
            </div>
        </div>
    </div>
    </div>
    </div>

    <!-- 리워드 상세사항 -->
    <div id="makerRewardCategoryDetail" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">리워드 종류 및 제작 형태</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>리워드의 종류를 선택하세요</p>
                <div class="border">
                    <div class="font-weight-bold p-1" id="detailRewardCategory">안녕</div>
                    <button class="float-right btn btn-outline-secondary btn-sm 
                    "style=" margin-top: -31px;"
                     onclick="rewardRechoice()">재선택</button>
                </div>
                <p class="text-muted" style="font-size: 9px;">※ 리워드 종류에 따라 필요한 서류를 확인하고
                    반드시 아래 리워드 필수 인증 서류 항목에 업로드해주세요.</p>
                <br><br>

                <p>리워드의 금형 이용 여부를 선택하세요</p>
                <input type="radio" name="moldYN" value="moldY"/> <label for="moldYN">금형을 이용하여 제작되는 리워드입니다.</label>
                <br>
                <input type="radio" name="moldYN" value="moldN"/><label for="moldYN">금형을 이용하지 않고 제작되는 리워드입니다.</label>
                <br>
                <br><br>

                <p>리워드 제작 형태를 선택하세요</p>
                <p class="text-muted"  style="font-size: 9px;">※ 제조 형태에 따라 필요한 서류는 반드시 아래 리워드 필수 인증 서류 항목에 업로드해주세요.
                    ※ 외국어로 작성된 서류의 경우 반드시 한글 번역본을 첨부하여야 합니다.</p>
                <input type="radio" name="madeForm" value="madeAll" /> <label for="madeForm">메이커가 아이디어 단계부터 리워드의 기획 및 개발, 생산까지의 전 과정을 담당합니다.</label>
                <input type="radio" name="madeForm" value="madeCommisson" /><label for="madeForm">메이커가 아이디어 단계부터 직접 기획 및 개발한 제품이지만, 제품의 양산 등의 과정은 제3자인 위탁 생산 업체가 담당합니다.</label>

                <input type="radio" name="madeForm" value="madeFix" /><label for="madeForm">메이커가 국내외 제조업체에서 개발이 완료된 제품의 일부를 개선 혹은 변경한 뒤 자신의 브랜드로 위탁 생산을 의뢰하였습니다.</label>
                
                <input type="radio" name="madeForm" value="made" /><label for="madeForm">이미 제작 완료된 해외 브랜드의 제품을 메이커가 국내 첫 단독 총판의 자격으로 수입하여 유통합니다.</label>
              
                <br><br>
                
                <!-- 파일업로드 기능  -->
                <p>리워드 종류 및 제작 형태에 따른 필수 서류를 업로드하세요</p>
                <p class="font-weight-bold" style="font-size: 9px;">필수 서류</p>
                <button class="d-inline-flex float-right btn btn-outline-info btn-sm " onclick="rewardRechoice()">업로드</button>
                <p class="text-muted" style="font-size: 8px;">jpg, jpeg, png, pdf, zip, xlsx, hwp, 10MB 이하 20개의 파일 업로드 가능</p> 
            </div>
            <div class="modal-footer d-block">
                
                <input type="checkbox" name="mailSend" aria-label="Checkbox for following text input">
                <label for="mailSend">메일로 전송하였습니다 (파일 첨부 제한되는 경우)</label>
                
                <input type="checkbox" name="beforeship" aria-label="Checkbox for following text input">
                <label for="beforeship">리워드 발송 전까지 리워드 종류에 따른 필수 서류 제출이 가능한 리워드입니다.</label>
                
                <input type="checkbox" name="uncalledDocument" aria-label="Checkbox for following text input">
                <label for="uncalledDocument">서류를 제출하지 않아도 되는 리워드 종류입니다.</label>
            </div>
            <div class ="pb-3"style="text-align:center;">
                <input type="reset" value="취소" class="d-inline-flex btn btn-outline-primary btn-lg " onclick="cancel()"/>
                &nbsp;&nbsp;
                <input type="submit" value="등록" class="d-inline-flex btn btn-primary btn-lg"></input>
            </div>
        </div>
    </div>
    </div>


    <!-- 리워드 선택시에 카드 나오기 -->
    <div class="d-flex justify-content-between">

       
        <div class="p-5 border rounded" style="width: 18rem;">
            <h5>리워드 종류</h5>
            <p>출판</p>
            <br>
            <h5>리워드 금형 제작 유무</h5>
            <p>출판</p>
            <br>
            <h5>리워드 제작 형태</h5>
            <p>출판</p>
            <br>
            <h5>관련 필수 서류</h5>
            <p>출판</p>
            <br>
            <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm " onclick="">편집</button>
            <button class="d-inline-flex float-right btn btn-outline-secondary btn-sm " onclick="">삭제</button>
        </div>
        
    </div>
        
    <br><br>
    <button type="button" class="btn btn-primary btn-lg" style="width: 200px;">저장하기</button>
</div>



</section> 

<script>

function makerRewardCategory(){
        $("#makerRewardCategory").modal()
    };

function nextModal(btn){
    console.log(btn.value);
    $("#makerRewardCategoryDetail").modal();
    var catagoryTitle = document.querySelector("#detailRewardCategory");
    catagoryTitle.innerText=btn.value;
    console.log(catagoryTitle.innerText);
};

function rewardRechoice(){
    $("#makerRewardCategory").modal()
};

</script>

</body>
</html>
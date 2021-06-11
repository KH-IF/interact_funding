<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/makerNav.jsp" flush="false">
    <jsp:param value="Choice Charge | IF Maker Studio" name="title"/>
</jsp:include>
<style>
    ul.listCheckMark{
        list-style-image: url( "${pageContext.request.contextPath}/resources/image/checked.png" );
       
        font-size: 14px;
    }
    div.cardTag{
        border-radius: 10px 0px 0px 14px;
    }

    .makeLikebutton{
        opacity: 0;
    }

    /* 선택시 선택완료라고 변경하기 */
    input[type=radio]:checked +label{

        background-color: darkcyan;
        color: white;
        content: '선택 완료';
    }
    

</style>
<!-- 요금제 코드 사용 rate_plan_code -->
    <div class="container p-5">
		<input type="hidden" id="hide_funding_no" value="${funding_no}">
        <h1 class="font-weight-bold"> 요금제 선택</h1>
        <p class="text-muted">원하는 요금제를 선택해주세요</p>

        <div class= "bg-light rounded p-3" style="height: 100px;">
            <p class="font-weight-bold">
                전체 서비스별 안내가 필요하신가요?
            </p>
            <a href="">
                <p class="text-info">메이커 서비스 보러가기</p>
            </a>
        </div>
        <br>

        <div class="lightcard d-flex container">

            <div class="cardTag border p-4 bg-info" style="width: 12rem;">
                <h5 class="font-weight-bold">Light</h5>
                <h6 class="mb-2">수수료 9%</h6>
                <p>(VAT 별도)</p>
            </div>

            <div class="p-4 border" style="width: 45rem;">
                <span class="h6 mb-2 text-muted">가볍게 펀딩을 시작하고 싶다면</span>
                <input id="LightCharge" value ="light" type="radio" name="choiceCharge" class="makeLikebutton" />
                <label class="d-inline-flex float-right btn btn-outline-info " for="LightCharge">선택하기</label>
                
                <br><br><br>
                <div class="card-text">
                    <ul class="listCheckMark">
                        <li>펀딩 오픈</li>
                        <li>이프 스쿨 수강</li>
                        <li>컨텐츠 제작 도우미</li>
                        <li>이딜리버리</li>
                        <li>데이터 플러스 (BETA)</li>
                        <li>새소식 알림</li>
                        <li>펀딩 인증마크</li>
                    </ul>
                </div>

            </div>

        </div>
        <br>

        <div class="basiccard d-flex container">
            <div class="cardTag border p-4 bg-success" style="width: 12rem;">
                <h5 class="font-weight-bold">Basic</h5>
                <h6 class="mb-2">수수료 12%</h6>
                <p>(VAT 별도)</p>
            </div>

            <div class="p-4 border" style="width: 45rem;">
                
                <span class="h6 mb-2 text-muted">펀딩을 미리 오픈해서
                        사전에 서포터를 모으고 싶다면</span>
                <input id="BasicCharge" value ="basic" type="radio" name="choiceCharge" class="makeLikebutton" />
                <label class="d-inline-flex float-right btn btn-outline-info " for="BasicCharge">선택하기</label>
                
                <br><br><br>
                <div class="card-text">
                    <h6 class="font-weight-bold">Light 요금제의 모든 서비스 포함 +</h6>
                    <ul class="listCheckMark">
                        <li>📣 오픈예정 서비스</li>
                    </ul>
                </div>

            </div>
                
        </div>
        <br>

        <div class="Pro d-flex container">

            <div class="cardTag border p-4 bg-danger" style="width: 12rem;">
                <h5 class="font-weight-bold text-light">Pro</h5>
                <h6 class="mb-2 text-light">수수료 14%</h6>
                <p class="text-light">(VAT 별도)</p>
            </div>

            <div class="p-4 border" style="width: 45rem;">
                <span class="h6 mb-2 text-muted">온・오프라인에서
                        동시에 서포터를 모으고 싶다면</span>
                <input id="ProCharge" value ="pro" type="radio" name="choiceCharge" class="makeLikebutton" />
                <label class="d-inline-flex float-right btn btn-outline-info " for="ProCharge">선택하기</label>
                
                <br><br><br>
                <div class="card-text">
                    <h6 class="font-weight-bold">Light 요금제의 모든 서비스 포함 +</h6>
                    <ul class="listCheckMark">
                        <li>📣 오픈예정 서비스</li>
                        <li>✨ 공간 이프 쇼룸</li>
                    </ul>
                </div>

            </div>
                
        </div>
        <br>

        <div class="Expert d-flex container">

            <div class="cardTag border p-4 bg-dark" style="width: 12rem;">
                <h5 class="font-weight-bold text-white">Expert</h5>
                <h6 class="mb-2 text-light">수수료 별도 협의</h6>
                <p class="text-light">(VAT 별도)</p>
            </div>

            <div class="p-4 border" style="width: 45rem;">
                <span class="h6 mb-2 text-muted">
                    성공적인 펀딩을 위해
                    와디즈 담당자의 도움을 받고싶다면
                </span>

                <input id="ExpertCharge" value ="expert" type="radio" name="choiceCharge" class="makeLikebutton" />
                <label class="d-inline-flex float-right btn btn-outline-info " for="ExpertCharge">선택하기</label>
                
                <br><br><br>
                <div class="card-text">
                    <h6 class="font-weight-bold">Light 요금제의 모든 서비스 포함 +</h6>
                    <ul class="listCheckMark">
                        <li>📣 오픈예정 서비스</li>
                        <li>✨ 공간 이프 쇼룸</li>
                        <li>🔊 광고대행 중개 서비스</li>
                        <li>👨‍💻 PD 컨설팅</li>
                        <li>📝 에디터 피드백</li>
                    </ul>
                </div>

            </div>
                
        </div>
        <br>

        <button type="button" onclick="saveCharge()" class="btn btn-primary btn-lg m-3" style="width: 200px;">저장하기</button>
      

    </div>


   
                
</section>   

<script>


//요금제 저장
function saveCharge(){

    const charge = $("section").find("[name=choiceCharge]:checked").val();
    console.log(charge);
	const no = ${funding.funding_no};
	console.log(no);
    
	$.ajax({
		url:`${pageContext.request.contextPath}/funding/saveCharge/\${no}/\${charge}`,
		method: "put",
		success(data){
		},
		error: console.log
		});
};

</script>

</body>
</html>
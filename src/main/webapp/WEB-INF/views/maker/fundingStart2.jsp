<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/maker/common/makerNav.jsp" flush="false">
    <jsp:param value="Start2 | IF Maker Studio" name="title"/>
</jsp:include>


        <div class="container p-5">
            <div class="btn-block progress">
                <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <br>
            
            <!-- 이름 들어갈 것 -->
            <h1>00님, 반갑습니다.</h1>    
            <p>프로젝트 개설을 축하드리며, 서포터에게 잊지 못할 프로젝트 경험을 선사하고
                메이커님의 성공적인 펀딩을 위해 "IF"가 함께 협력할 수 있기를 기대합니다.</p>

            <p>
             자! 시작해볼까요?
            </p>

            <button type="button" class="btn btn-primary btn-lg" style="width: 200px;">시작하기</button>
        </div>
                

    </section>
    
</body>
</html>
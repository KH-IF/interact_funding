<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css" />
	</section>
	<footer>
		<hr style="height: 1px; background-color: #999; margin: 0 auto;"/>
	<!-- Ionicons Js 예제  -->
<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
	  <div class="IF-footer">
	  	<div class="IF-footer-Information">
	  	<h4> <img src="${pageContext.request.contextPath}/resources/image/IF_logo.png"alt="logo" style="height: 30px; object-fit: cover; "/><span style="font-size: 15px; font-weight: 700; padding-left: 2px; color: #444;">InteractFunding 제작정보</span></h4>
	  	<hr style="height: 1px; background-color: #999;"/>
	  	<p style="color:#7C8288; font-size: 12px;">소속:KH정보교육원 | 서울특별시 강남구 역삼동 823-35 </p>
	  	<p style="color:#7C8288; font-size: 12px;">팀장:김윤수</p>
	  	<p style="color:#7C8288; font-size: 12px;">팀원: 천호현 김주연 박요한 김경태 이승우 배기원</p>
	  	<p style="color: rgba(0,0,0,.84);font-size: 17px;line-height: 30px; font-weight: 700;">© Interact Funding Final PROJECT Co. Ltd.</p>
	  	</div>
	  	<div class="IF-footer-site">
	  	<h4 style="font-size: 15px; font-weight: 700; color: #444;" >관련사이트</h4>
	  	<hr style="height: 1px; background-color: #999;"/>
	  	<p style="font-size: 12px; color:#7C8288;">김윤수:<a href="https://github.com/kimdia200" style="font-size: 12px; color:#7C8288;">https://github.com/kimdia200 <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">천호현:<a href="https://github.com/hohyuncheon" style="font-size: 12px; color:#7C8288;">https://github.com/hohyuncheon <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">김주연:<a href="https://github.com/KIMJOOYEON97" style="font-size: 12px; color:#7C8288;">https://github.com/KIMJOOYEON97 <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">박요한:<a href="https://github.com/dygksqkr12" style="font-size: 12px; color:#7C8288;">https://github.com/dygksqkr12 <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">김경태:<a href="https://github.com/kyoung-tae" style="font-size: 12px; color:#7C8288;">https://github.com/kyoung-tae <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">이승우:<a href="https://github.com/onreverse01" style="font-size: 12px; color:#7C8288;">https://github.com/onreverse01 <ion-icon name="logo-github"></ion-icon></a></p>
	  	<p style="font-size: 12px; color:#7C8288;">배기원:<a href="https://github.com/rlwi440" style="font-size: 12px; color:#7C8288;">https://github.com/rlwi440 <ion-icon name="logo-github"></ion-icon></a></p>
	  	</div>
	  	<div class="If-footer-question">
	  		<h4 class="If-footer-question-p">이프 대표고객센터</h4>
	  		<hr style="height: 1px; background-color: #999;"/>
	  		<p style="font-weight: 700;">이메일: <span style="color: #999;">interact.funding@gmail.com</span></p>
	  		<p class="If-footer-question-p1">상담시간: <span style="color: #999;" >평일 오전9시~오후 6시(주말,공휴일제외)</span></p>
	  		<button style="cursor:pointer;" type="button" data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="121" onclick="msgSetting(this)"><span style="font-weight: 700;"><ion-icon name="help-circle-outline" ></ion-icon>이프문의하기</span></button>
	  	</div>
	 	  </div>
	 	  <hr style="margin:0 auto; height: 1px; background-color: #999;"/>
	 	  <div class="If-footer-black">
	 	   		<p class="If-footer-black-p"><span style="color: #BABDC0;font-weight: bold; font-size: 17px; ">투자위험고지</span> 비상장기업 투자는 원금손실이 크니 <span style="text-decoration: underline;">투자위험안내를</span> 꼭 확인하세요.</p>
	 	  </div>
	</footer>
</body>
</html>
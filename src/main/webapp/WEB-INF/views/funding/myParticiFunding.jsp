<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="내가 참여한 펀딩" name="title" 	/>
</jsp:include>

	<h1>내가 참여한 펀딩페이지는 fundingStart1페이지가 완성되면 참고해서 만들거임</h1>

	<!-- header에 정의해놓았습니다 -->
	<h1 style="cursor:pointer" data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="2" onclick="msgSetting(this)">쪽지 보내기 테스트</h1>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

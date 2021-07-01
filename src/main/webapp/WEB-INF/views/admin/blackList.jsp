<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원조회" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css" />
<div id="memberList-container">
	<h2 class="blackh2"><a href="${pageContext.request.contextPath}/admin/memberList">회원관리</a> | <span style="text-decoration:underline; color:#00a2a2;">블랙리스트</span></h2>
    <div id="blackListTableArea">
        <table id=blackListArea>
            <thead>
                <tr>
                    <th>no</th>
                    <th>이메일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty list}">
            		<tr>
            			<td colspan="3" style="text-align:center;">조회된 회원이 없습니다.</td>
            		</tr>
            	</c:if>
            	<c:if test="${not empty list}">
            		<c:forEach items="${list}" var="blackList" varStatus="status">
		                <tr>
		                    <td>${status.count}</td>
		                    <td>${blackList.email}</td>
		                    <td><input type="button" class="delBlackMember" value="해제" data-email="${blackList.email}" onclick="delBlackMember(this)"></td>
		                </tr>
	                </c:forEach>
	        	</c:if>
            </tbody>
        </table>
    </div>
    <form:form id="blackListDelete" method="post" action="${pageContext.request.contextPath}/admin/blackListDel">
    	<input type="hidden" name="email"/>
    </form:form>
    
    <!-- 페이지바 -->
    <c:if test="${totalContents <= map.limit}">
       	<div id="nonePage"></div>
    </c:if>
    <c:if test="${totalContents > map.limit}">
    	<div id="pageBar">
        	${pageBar}
        </div>
    </c:if>
    
<script>
	//추방해제
	function delBlackMember(btn){
		var email = $(btn).data("email");
		if(!confirm(email+"을 블랙리스트에서 해제 하시겠습니까?")){
			return;
		}
		var $form = $("#blackListDelete");
		$form.find("[type=hidden]").val(email);
		$form.submit();
	}
</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
<script>
$(document).ready(function(){
    $("#search-type").change(function(){
        var result = $("#search-type option:selected").val();
        if(result == 'email'){
            $("#search-email").css("display", "inline-block");
            $("#search-memberName").css("display", "none");
        }
        else if(result == 'memberName'){
            $("#search-email").css("display", "none");
            $("#search-memberName").css("display", "inline-block");
        }
    });
});
</script>
<div id="memberList-container">
    <h2><span style="text-decoration:underline; color:#00a2a2;">회원관리</span> | <a href="${pageContext.request.contextPath}/admin/blackList">블랙리스트</a></h2>
    <!-- 검색 -->
    <div id="search-container">
        <select id="search-type">
            <option value="email" ${map.searchType eq 'email' ? 'selected' : ''}>이메일</option>
            <option value="memberName" ${map.searchType eq 'memberName' ? 'selected' : ''}>이름</option>
        </select>
        <div id="search-email" style="display:${empty map.searchType || map.searchType eq 'email' ? 'inline-block' : 'none'}">
            <form:form action="" onsubmit="return false;">
                <input type="hidden" name="searchType" value="email">
                <input type="search" id="memberSearchKeyword" placeholder="검색할 이메일 입력" value="${map.searchType eq 'email' ? map.searchKeyword : ''}">
                <button type="button" id="searchButton">검색</button>
            </form:form>
        </div>
        <div id="search-memberName" style="display:${map.searchType eq 'memberName' ? 'inline-block' : 'none'}">
            <form:form action="" onsubmit="return false;">
                <input type="hidden" name="searchType" value="memberName">
                <input type="search" id="memberSearchKeyword2" placeholder="검색할 이름 입력" value="${map.searchType eq 'memberName' ? map.searchKeyword : ''}">
                <button type="button" id="searchButton2">검색</button>
            </form:form>
        </div>
    </div>
    <c:if test="${not empty map.searchKeyword}">
	    <div id="resetArea">
	    	<span id="reset">검색: ${map.searchKeyword}</span>
	    	<button type="button" class="btn btn-secondary btn-sm" onclick='location.href="${pageContext.request.contextPath}/admin/memberList"'>초기화</button>
	    </div>
    </c:if>

    <!-- 리스트 -->
    <div id="memberTableArea">
        <table id="memberListArea">
            <thead>
                <tr>
                    <th>no</th>
                    <th>이메일</th>
                    <th>이름</th>
                    <th>권한</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty list}">
	                <tr>
	                    <td colspan="5" style="text-align:center;">조회된 회원이 없습니다.</td>
	                </tr>
                </c:if>
                <c:if test="${not empty list}">
                	<c:forEach items="${list}" var="member">
		                <tr>
		                    <td>${member.memberNo}</td>
		                    <td>${member.email}</td>
		                    <td>${member.name}</td>
		                    <td>
		                        <select id="memberRole" name="memberRole" data-memberno="${member.memberNo}" onchange="updateRole(this);">
		                            <option value="admin" <c:if test="${fn:contains(member.authorities, 'ROLE_ADMIN')}">selected</c:if> >관리자</option>
		                            <option value="user" <c:if test="${!fn:contains(member.authorities, 'ROLE_ADMIN')}">selected</c:if> >사용자</option>
		                        </select>
		                    </td>
		                    <td><input type="button" class="delMember" value="강제추방" data-memberno="${member.memberNo}" onclick="delMember(this)"></td>
		                </tr>
	                </c:forEach>
                </c:if>
            </tbody>
        </table>
    </div>
    <form:form id="updateRole" method="post">
    	<input type="hidden" name="memberNo" />
    </form:form>
    
    <form:form id="deleteMember" method="post" action="${pageContext.request.contextPath}/admin/memberDel">
		<input type="hidden" name="memberNo" />
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
	function updateRole(select){
		var memberNo = $(select).data("memberno");
		console.log("memberNo = "+memberNo);
		var role = $(select).find(":selected").text();
		console.log(role);
		
		if(!confirm("정말 권한을"+role+"로 변경 하시겠습니까?")){
			return;
		}
		
		if(role=="관리자"){
			var $form = $("#updateRole");
			$form.attr("action","${pageContext.request.contextPath}/admin/addAdminRole");
			$form.find("[type=hidden]").val(memberNo);
			$form.submit();
			return;
		}else{
			var $form = $("#updateRole");
			$form.attr("action","${pageContext.request.contextPath}/admin/removeAdminRole");
			$form.find("[type=hidden]").val(memberNo);
			$form.submit();
			return;
		}
	}
	
	function delMember(btn){
		var memberNo = $(btn).data("memberno");
		if(!confirm("정말 추방시키겠습니까?")){
			return;
		}
		var $form = $("#deleteMember");
		$form.find("[type=hidden]").val(memberNo);
		$form.submit();
	}

	//회원검색
	$("#searchButton").click(function (){
		memberSearch();
	});
	
	function memberSearch(){
		var keyword = $("#memberSearchKeyword").val();
		var searchType = $("#search-type").val();
		console.log(keyword);
		console.log(searchType);
		
		if(keyword.length == 0){
			swal("검색키워드", "한글자 이상 입력해주세요", "info");
			return;
		}
		
		else{
			var url = "${pageContext.request.contextPath}/admin/memberList";
			url = url + "?searchType=" + searchType;
			url = url + "&searchKeyword=" + keyword;
			location.href = url;
			console.log(url);
		}
	}
	
	$("#searchButton2").click(function (){
		memberSearch2();
	});
	
	function memberSearch2(){
		var keyword = $("#memberSearchKeyword2").val();
		var searchType = $("#search-type").val();
		console.log(keyword);
		console.log(searchType);
		
		if(keyword.length == 0){
			swal("검색키워드", "한글자 이상 입력해주세요", "info");
			return;
		}
		
		else{
			var url = "${pageContext.request.contextPath}/admin/memberList";
			url = url + "?searchType=" + searchType;
			url = url + "&searchKeyword=" + keyword;
			location.href = url;
			console.log(url);
		}
	}
	
</script>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isErrorPage="true"%%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<style>
section {
	margin: 0 auto;
	position: relative;
	width: 1300px;
}

.top {
	width: 1300px;
	height: 100px;
	background-color: white;
	position: absolute;
	top: 0px;
	left: 0px;
}

img {
	width: 1300px;
}

p {
	position: absolute;
	z-index: 1;
	top: 249px;
	left: 243px;
	font-size: 100px;
	color: #484848;
}

a {
	z-index: 1;
	color: #00b2b2;
	position: absolute;
	left: 319px;
	top: 504px;
	font-size: 50px;
	text-decoration: none;
}

a:hover {
	z-index: 1;
	color: #138496;
	position: absolute;
	left: 319px;
	top: 504px;
	font-size: 50px;
	text-decoration: none;
}

.bottom {
	width: 730px;
	height: 350px;
	background-color: white;
	position: absolute;
	bottom: 0px;
	left: 0px;
}
</style>
</head>
<body>
	<section>
		<div class="top"></div>
		<img
			src="${pageContext.request.contextPath}/resources/image/sample-custom-error-page.gif" />
		<p>
			<strong>Error</strong> :(
			<strong><%= exception.getMessage() %></strong>
			
		</p>
		<a href="${pageContext.request.contextPath}"><strong>Home</strong></a>
		<div class="bottom"></div>
	</section>

</body>
</html>
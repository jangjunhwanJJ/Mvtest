<%@page import="www.jcoding.kr.NaverApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    NaverApi naverApi = new NaverApi();
    naverApi.getMovieInfo("tenet", 0, 0);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
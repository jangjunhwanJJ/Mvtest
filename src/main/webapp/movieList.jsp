<%@page import="www.jcoding.kr.MovieController"%>
<%@page import="www.jcoding.kr.NaverApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MovieController movieController = new MovieController();
    String result = movieController.getMovieInfo("K", -1);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과<br>
<%=result %>
</body>
</html>
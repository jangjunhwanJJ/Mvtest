<%@page import="www.jcoding.kr.mvNvInfo"%>
<%@page import="java.util.List"%>
<%@page import="www.jcoding.kr.MovieInfo"%>
<%@page import="www.jcoding.kr.MovieController"%>
<%@page import="www.jcoding.kr.NaverApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    MovieController mvControl = new MovieController();
    List<MovieInfo> movie;
    movie = mvControl.getMovie("K", -1);
    
    NaverApi mvN = new NaverApi();
    
    
 
    //  MovieInfo movie = new MovieInfo();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
for(int i=0; i<movie.size(); i++){
	MovieInfo item = movie.get(i);
	List<mvNvInfo> movieN = mvN.getMovieInfo(item.getMovieNm(), 0, 0, 0);
%>
<div class="container">
		<h2>영화 순위: <%=i+1 %> </h2>
		<div class="row mb-5">
			<div class="col-md-4">
				<div class="card">
					<p class="card-text">
					<%if(movieN.size()>0) {%>
						<%=movieN.get(0).getImage()%>
					<%} %>
					</p>
					<div class="card-body">
						<h5 class="card-title"><%=item.getMovieNm() %></h5>
						<p class="card-text"><%=item.getRank() %></p>
						<%if(movieN.size()>0) {%>
						<a href="<%=movieN.get(0).getLink() %>" class="btn btn-sm btn-primary">Go somewhere</a>
						<%} %>
					</div>
				</div>
			</div>
		</div>
</div>
<%} %>
</body>
</html>
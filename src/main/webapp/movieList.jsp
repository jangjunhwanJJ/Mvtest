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
%>
<div class="container">
		<h2>Bootstrap Cards Varation: </h2>
		<h3>Same Aspect Ratio ―</h3>
		<div class="row mb-5">
			<div class="col-md-4">
				<div class="card">
					<img src="https://source.unsplash.com/random/1920x1080" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-sm btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		
		<!-- row -->
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="row no-gutters align-items-center">
						<div class="col-md-4">
							<img src="https://source.unsplash.com/random/600x800" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="row no-gutters align-items-center">
						<div class="col-md-4">
							<img src="https://source.unsplash.com/random/600x800" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
								<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- row -->
	</div>
<%} %>
</body>
</html>
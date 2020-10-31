<%@page import="java.util.ArrayList"%>
<%@page import="www.jcoding.kr.BookInfo"%>
<%@page import="java.util.List"%>
<%@page import="www.jcoding.kr.BookController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String query = request.getParameter("query");
String pageNo = request.getParameter("page");
String sort = request.getParameter("sort");
String size = request.getParameter("size");

BookController control = new BookController();
List<BookInfo> books = new ArrayList<BookInfo>();
if(query != null && query.length()>0){
	books = control.getBookList(query, pageNo, sort, size);
}
%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/cards.css">
<meta charset="UTF-8">
<title>책 리스트</title>
</head>
<body>

<section>
    <div class="container">
		<form action="./bookList.jsp">
			<input type="text" name="query" placeholder="검색어를 입력 해주세요."/>
			<input type="text" name="page" placeholder="검색할 페이지를 입력 하세요."/>
			<select name="sort">
				<option value="accuracy" selected>정확도순</option>
				<option value="recency">최신순</option>
			</select>
			<select name="size">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>
			<input type="submit" value="검색"/>
		</form>
    	<%if(books.size() == 0) {
    	out.print("검색 결과가 없습니다.");
    	} %>
    	<div class="row">
    	    <%for(BookInfo book : books) {
    	    %>
	    		<!--Profile Card 5-->
	    		<div class="col-md-4 mt-4">
	    		    <div class="card profile-card-5">
	    		        <div class="card-img-block">
	    		            <img class="card-img-top" src="<%=book.getThumbnail() %>" alt="Card image cap">
	    		        </div>
	                    <div class="card-body pt-0">
	                    <h5 class="card-title">
	                    	<a href="<%=book.getUrl()%>" target="_blank">
	                    	<%=book.getTitle() %>
	                    	</a>
	                    </h5>
	                    <p class="card-text">
	                    	<%=book.getContents() %>
	                    </p>
	                    
	                  </div>
	                </div>
	                <p class="mt-3 w-100 float-left text-center">
	                	<strong><%=book.getStatus() %></strong>
	                </p>
	    		</div>
    		<%} %>
    		
    	</div>
    </div>
</section>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="www.jcoding.kr.BookInfo"%>
<%@page import="java.util.List"%>
<%@page import="www.jcoding.kr.BookController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String query = request.getParameter("query");
String pageNo = request.getParameter("page");
String sort = "accuracy";
String size = request.getParameter("size");
int pageNoInt = 1;
if(pageNo != null){
	pageNoInt = Integer.parseInt(pageNo);
}
String temp = request.getParameter("sort"); // accuracy or recency
if(temp != null){
	sort = temp;
}
int sizeNo = 1;
if(size != null){
	sizeNo = Integer.parseInt(size);
}
BookController control = new BookController();

List<BookInfo> books;
try{
	books = control.getBookList(query, pageNo, sort, size);
}catch(Exception e){
	books = new ArrayList<BookInfo>();
}
%>
<!DOCTYPE html>
<html>
<head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="./css/cardview.css"/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./index.jsp">
	<input type="text" name="query" placeholder="검색어를 입력 해주세요."
		<%if(query != null) {%>
		value="<%=query %>"
		<%} %>
	/>
	<input type="text" name="page" placeholder="검색할 페이지를 입력 하세요."
		value="<%=pageNoInt %>"
	/>
	<select name="sort">
		<option value="accuracy" <%if(sort.equals("accuracy")) { out.print("selected"); }%>>정확도순</option>
		<option value="recency" <%if(sort.equals("recency")) { out.print("selected"); }%>>최신순</option>
	</select>
	<select name="size">
		<option value="10" <%if(sizeNo == 10){ out.print("selected");} %>>10</option>
		<option value="20" <%if(sizeNo == 20){ out.print("selected");} %>>20</option>
		<option value="30" <%if(sizeNo == 30){ out.print("selected");} %>>30</option>
		<option value="40" <%if(sizeNo == 40){ out.print("selected");} %>>40</option>
		<option value="50" <%if(sizeNo == 50){ out.print("selected");} %>>50</option>
	</select>
	<input type="submit" value="검색"/>
</form>
<section>
    <div class="container">
    	<div class="row">
    	    <%
			for(int i=0; i<books.size(); i++){
				BookInfo item = books.get(i);
			%>
    		<!--Profile Card 5-->
    		<div class="col-md-4 mt-4">
    		    <div class="card profile-card-5">
    		        <div class="card-img-block">
    		            <img class="card-img-top" src="<%=item.getThumbnail() %>" alt="Card image cap">
    		        </div>
                    <div class="card-body pt-0">
                    <h5 class="card-title">
                    <a href="<%=item.getUrl() %>">
                    <%=item.getTitle() %>
                    </a>
                    </h5>
                    <p class="card-text"><%=item.getContents() %></p>
                    
                  </div>
                </div>
¡                <p class="mt-3 w-100 float-left text-center"><strong><%=item.getSale_price() %></strong></p>
    		</div>
    		<%} %>
    	</div>
    </div>
</section>

</body>
</html>
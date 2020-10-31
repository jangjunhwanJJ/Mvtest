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

List<BookInfo> books = control.getBookList(query, pageNo, sort, size);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./index.jsp">
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
<table border="1">
<thead>
	<tr>
		<th>ISBN</th>
		<th>제목</th>
		<th>저자</th>
		<th>출판사</th>
		<th>판매가격</th>
		<th>상태</th>
	</tr>
</thead>
<tbody>
<%
for(int i=0; i<books.size(); i++){
	BookInfo item = books.get(i);
%>
<tr>
	<td><%=item.getIsbn() %></td>
	<td><%=item.getTitle() %></td>
	<td><%=item.getAuthors()[0] %></td>
	<td><%=item.getPublisher() %></td>
	<td><%=item.getSale_price() %></td>
	<td><%=item.getStatus() %></td>
</tr>
<%} %>
</tbody>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String bi_num=request.getParameter("bi_num");
%>

<form method="post" action="<%=rootPath%>/books/update-ok.jsp">
<table border="1">

<input type="hidden"name="bi_num" value="<%=bi_num%>">

<tr>
<th>제목</th>
<td><input type="text"name="bi_title"></td>
</tr>
<tr>
<th>유형</th>
<td><input type="text"name="bi_type"></td>
</tr>
<tr>
<th>별점</th>
<td><input type="text"name="bi_star"></td>
</tr>
<tr>
<th>설명</th>
<td><input type="text"name="bi_desc"></td>
</tr>
<button>수정하기</button>
</form>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String num=request.getParameter("bi_num");
%>

<form method="post" action="/bdi-web/jsp/board/board-update-ok.jsp">
<table border="1">
<tr>
<th>num</th>
<td><%=num %></td>
<td><input type="hidden"name="bi_num"value="<%=num %>"><br></td>
</tr>	
<tr>
<th>title</th>
<td><input type="text"name="bi_title"><br></td>
</tr>
<tr>
<th>user</th>
<td><input type="text"name="bi_user"></td>
</tr>
<tr>
<th>content</th>
<td><input type="text"name="bi_content"></td>
</tr>
</table>
<button>수정하기</button>
</form>
</body>
</html>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
String sql="select* from books_type order by bt_num";
Connection con=DBCon.getCon();
PreparedStatement ps= con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<form method = "post" action="<%=rootPath%>/books/insert-ok.jsp">
	<input type="hidden"name="bi_num">
	title:<input type="text"name="bi_title"><br>
	type:
	<select name="bi_type">
	<%
	while(rs.next()){ 
	%>
	<option value="<%=rs.getString("bt_num") %>"><%=rs.getString("bt_name") %>
	</option>
	<%
	} 
	%>
	</select><br>
	star:<input type="text" name="bi_star"><br>
	credat:<input type="date" name="bi_credat"><br>
	desc:<input type="text" name="bi_desc"><br>
<button>입력하기</button>
</form>

</body>
</html>
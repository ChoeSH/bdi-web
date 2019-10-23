<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uiNum=request.getParameter("ui_num");

String sql="select* from user_info where ui_num=? ";
Connection con = DBCon.getCon();
PreparedStatement ps= con.prepareStatement(sql);
ps.setString(1,uiNum);

ResultSet rs = ps.executeQuery();

if(!rs.next()){
	out.println(uiNum+"게시물이 존재하지 않습니다.");
}else{

%>
<form method="post" action="/bdi-web/jsp/user/user-update-ok.jsp">
<table border="1">
<tr>
<th>num</th>
<td><%=uiNum %></td>
</tr>
<tr>
<th>id</th>
<td><input type="text"name="id" value="<%=rs.getString("ui_id")%>"><br></td>
</tr>
<tr>
<th>pwd</th>
<td><input type="password"name="pwd"value="<%=rs.getString("ui_pwd")%>"></td>
</tr>
<tr>
<th>name</th>
<td><input type="text"name="name"value="<%=rs.getString("ui_name")%>"></td>
</tr>
<tr>
<th>age</th>
<td><input type="text"name="age"value="<%=rs.getString("ui_age")%>"></td>
</tr>
<tr>
<th>etc</th>
<td><input type="text"name="etc"value="<%=rs.getString("ui_etc")%>"></td>
</tr>
</table>
<button>수정하기</button>
<input hidden="text" name="num"value="<%=rs.getString("ui_num")%>">
</form>

<%
}
%>
</body>
</html>
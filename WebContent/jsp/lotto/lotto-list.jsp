<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.test01.Lotto"%>
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
String sql = "select * from user_info";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ResultSet rs = ps.executeQuery(); 

Lotto lo = new Lotto();
out.println(lo.getlotto());

%>
<table border="1" style="border:1px solid green">
<tr>
<th>회차</th>
<th>1번</th>
<th>2번</th>
<th>3번</th>
<th>4번</th>
<th>5번</th>
<th>6번</th>
</tr>
<tr>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){
	String sql = "select* from user_info where ui_id=? and ui_pwd=?";
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,id);
	ps.setString(2,pwd);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		out.println(rs.getString("ui_name")+"님 안녕하세요~");
	}else{
		out.println("로그인 실패");
	}
}
%>
<br><br>
<a href="/bdi/jsp/test01/test.jsp"><button>돌아가기</button></a>
</body>
</html>
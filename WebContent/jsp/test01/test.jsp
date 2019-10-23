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
<body>
<form method="post">			<%--post방식은 url이 바뀌지 않는다.--%>
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pwd"><br>
<button>로그인</button>
</form>
<br><a href="/bdi-web/jsp/test01/join.jsp"><button>회원가입</button>
</body>
</html>
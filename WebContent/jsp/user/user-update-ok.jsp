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
request.setCharacterEncoding("utf-8");

String num= request.getParameter("num");
String id= request.getParameter("id");
String pwd= request.getParameter("pwd");
String name= request.getParameter("name");
String age= request.getParameter("age");
String etc= request.getParameter("etc");

String sql="update user_info"; 
sql+=" set ui_id='"+id+"',ui_pwd='"+pwd+"',ui_name='"+name+"',ui_age="+age+",ui_etc='"+etc+"'";
sql+=" where ui_num=?";

System.out.println(sql);
System.out.println(num);
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,num);

int result = ps.executeUpdate();


if(result==1){
	out.println("완료");
	con.commit();
}else{
	out.println("실패");
	con.rollback();
}
%>
<br>
<button><a href="/bdi-web/jsp/user/user-list.jsp">돌아가기</a></button>
</body>
</html>
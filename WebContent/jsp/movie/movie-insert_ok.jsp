<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
String num= request.getParameter("num");
String name= request.getParameter("name");
String price= request.getParameter("price");
String date= request.getParameter("date");
date=date.replace("-","");
String desc= request.getParameter("desc");
String age= request.getParameter("age");
String star_rate= request.getParameter("star_rate");

String sql="insert into movie_info(mi_num,mi_name,mi_price,mi_date,mi_desc,mi_age,mi_star_rate)";
sql+="values('"+num+"','"+name+"','"+price+"','"+date+"','"+desc+"','"+age+"','"+star_rate+"')";

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();

int result = stmt.executeUpdate(sql);

if(result==1){
	out.println("정보입력 완료");
	con.commit();
}else{
	out.println("정보입력 실패");
	con.rollback();
}
%>
<a href="/bdi-web/jsp/movie/movie-list.jsp"><button>돌아가기</button></a>
</body>
</html>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
String sql="delete from books_info ";
sql+= "where bi_num=?";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,bi_num);

int result = ps.executeUpdate();

if(result==1){
	out.println("삭제 완료");
	con.commit();
}
%>
<br><br>
<a href = "<%=rootPath%>/books/list.jsp"><button>돌아가기</button></a>
</body>
</html>
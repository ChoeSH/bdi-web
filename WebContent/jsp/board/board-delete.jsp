<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Statement"%>
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

삭제한 게시물 번호 : <%=request.getParameter("bi_num")%>
<br>
<%
String sql="delete from board_info where bi_num=";
sql+=request.getParameter("bi_num");

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();

int result = stmt.executeUpdate(sql);

if(result==1){
	out.println("삭제 완료");
	con.commit();
}else{
	out.println("삭제 실패");
	con.rollback();
}
%>
<a href="/bdi-web/jsp/board/board-list.jsp">리스트로 돌아가기</a>
</body>
</html>
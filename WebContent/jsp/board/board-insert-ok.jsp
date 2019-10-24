<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
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
request.setCharacterEncoding("UTF-8");

String title=request.getParameter("bi_title");
String user=request.getParameter("bi_user");
String content=request.getParameter("bi_content");

String sql="insert into board_info ";
sql+=" values(SEQ_BI_NUM.NEXTVAL,?,?,?,to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'),to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'))";

Connection con= DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,title);
ps.setString(2,user);
ps.setString(3,content);

int result = ps.executeUpdate();

if(result==1){
	out.println("글쓰기 완료");
	con.commit();
}else{
	out.println("글쓰기 실패");
	con.rollback();
}
%>
<br><br>
<a href="/bdi-web/jsp/board/board-list.jsp">리스트로 돌아가기</a>
</body>
</html>
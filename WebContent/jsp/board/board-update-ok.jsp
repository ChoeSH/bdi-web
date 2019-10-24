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
String moddat="to_char(sysdate,'YYYYMMDD')";
String modtim="to_char(SYSDATE,'HH24MISS')";
String num=request.getParameter("bi_num");

String sql="update BOARD_INFO"; 

sql+=" set bi_title='"+title+"',bi_user='"+user+"',bi_content='"+content+"',";
sql+=" bi_moddat=to_char(sysdate,'YYYYMMDD'),";
sql+=" bi_modtim=to_char(sysdate,'HH24MISS')";
sql+=" where bi_num=?";

Connection con= DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,num);

out.println(title);
out.println(user);
out.println(content);
out.println(num);

int result= ps.executeUpdate();

if(result==1){
	out.println("수정 완료");
	con.commit();
}else{
	out.println("수정 실패");
	con.rollback();
}

%>
<br><br>
<a href="/bdi-web/jsp/board/board-list.jsp">리스트로 돌아가기</a>
</body>
</html>
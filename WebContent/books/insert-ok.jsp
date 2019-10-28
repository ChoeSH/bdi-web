<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
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
request.setCharacterEncoding("UTF-8");

String bi_title=request.getParameter("bi_title");
String bi_type=request.getParameter("bi_type");
String bi_star=request.getParameter("bi_star");
String bi_credat=request.getParameter("bi_credat");
String bi_desc=request.getParameter("bi_desc");

String sql="insert into books_info ";
sql+= "values(SEQ_books_bi_num.NEXTVAL,'/imgs/img1.jpg',?,?,?,to_char(sysdate,'YYYYMMDD'),?)";

Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,bi_title);
ps.setString(2,bi_type);
ps.setString(3,bi_star);
ps.setString(4,bi_desc);

int result = ps.executeUpdate();

if(result==1){
	out.println("입력 완료");
	con.commit();
}else{
	out.println("입력 실패");
	con.rollback();
}
%>
<br><br>
<a href="<%=rootPath%>/books/list.jsp">목록으로</a>
</body>
</html>
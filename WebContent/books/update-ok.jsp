<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String bi_num= request.getParameter("bi_num");
	String bi_title= request.getParameter("bi_title");
	String bi_type= request.getParameter("bi_type");
	String bi_star= request.getParameter("bi_star");
	String bi_desc= request.getParameter("bi_desc");
	
		String sql = "update books_info ";
		sql+=" set bi_title=?,bi_type=?,bi_star=?,bi_desc=?";
		sql+=" where bi_num=?";
		
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1,bi_title);
		ps.setString(2,bi_type);
		ps.setString(3,bi_star);
		ps.setString(4,bi_desc);
		ps.setString(5,bi_num);
		
		int result = ps.executeUpdate();

		if (result==1) {
			out.println("수정 완료");
			con.commit();
		}else{
			out.println("수정 실패");
		}
	%>
	<br><br>
	<a href="<%=rootPath%>/books/list.jsp"><button>리스트로 돌아가기</button></a>
</body>
</html>
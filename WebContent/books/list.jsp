<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" style="border: 1px solid red">
		<tr>
			<th>num</th>
			<th>image</th>
			<th>title</th>
			<th>type</th>
			<th>star</th>
			<th>credat</th>
			<th>desc</th>
		</tr>
	<%
		String sql = " select bi.bi_num, bi.bi_image, bi.bi_title, bi.bi_star,bi.bi_credat,bi.bi_desc, ";
			sql+="(select bt.bt_name from books_type bt where bt.bt_num= bi.bi_type) bi_type ";
			sql+="from books_info bi order by bi_num asc";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) { 
	%>
		<tr>
			<td><%=rs.getString("bi_num")%></td>
			<td><img src="<%=rootPath + rs.getString("bi_image")%>" width=150 height=120></td>
			<td><%=rs.getString("bi_title")%></td>
			<td><%=rs.getString("bi_type")%></td>
			<td><%=rs.getString("bi_star")%></td>
			<td><%=rs.getString("bi_credat")%></td>
			<td><%=rs.getString("bi_desc")%></td>
			<td><a
				href="<%=rootPath%>/books/update.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>수정</button></a>
			<td><a
				href="<%=rootPath%>/books/delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>삭제</button></a>
		</tr>
		<%
			}
		%>
	</table>
	<br>
		<a href="<%=rootPath%>/books/insert.jsp"><button>등록하기</button></a>
</body>
</html>
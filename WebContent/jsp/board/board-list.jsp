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
<form>
	<select name="search">
		<option value="1">제목</option>
		<option value="2">작성자</option>
		<option value="3">내용</option>
		<option value="4">제목+작성자</option>
		<option value="5">제목+작성자+내용</option>
	</select>
	<input type="text" name="searchStr"><button>검색</button>
</form>
<table border="1" style="border:1px solid green">
<tr>
<th>num</th>
<th>title</th>
<th>user</th>
<th>content</th>
<th>credat</th>
<th>cretime</th>
<th>moddat</th>
<th>modtim</th>
</tr>

<%
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

String sql="select* from board_info ";
if(search!=null){
	if("1".equals(search)){
		sql += " where bi_title like ? ";
	}else if("2".equals(search)){
		sql += " where bi_user like ? ";
	}else if("3".equals(search)){
		sql += " where bi_content like ? ";
	}else if("4".equals(search)){
		sql += " where bi_title like ? or bi_user like ? ";
	}else if("5".equals(search)){
		sql += " where bi_title like ? or bi_user like ?  or bi_content like ?  ";
	}
}
sql+="order by bi_num desc";

Connection con = DBCon.getCon();
PreparedStatement ps= con.prepareStatement(sql);

if(search!=null){
	if("1".equals(search) || "2".equals(search) || "3".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
	}else if("4".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
		ps.setString(2,"%" + searchStr + "%");
	}else if("5".equals(search)){
		ps.setString(1,"%" + searchStr + "%");
		ps.setString(2,"%" + searchStr + "%");
		ps.setString(3,"%" + searchStr + "%");
	}
}

ResultSet rs = ps.executeQuery();
while(rs.next()){

%>
<tr>
<td><%=rs.getString("bi_num") %></td>
<td><a href="/bdi-web/jsp/board/board-update.jsp?bi_num=<%=rs.getString("bi_num") %>"><%=rs.getString("bi_title") %></a></td>
<td><%=rs.getString("bi_user") %></td>
<td><%=rs.getString("bi_content") %></td>
<td><%=rs.getString("bi_credat") %></td>
<td><%=rs.getString("bi_cretime") %></td>
<td><%=rs.getString("bi_moddat") %></td>
<td><%=rs.getString("bi_modtim") %></td>
<td><a href="/bdi-web/jsp/board/board-delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button>삭제</button></a></td>
</tr>
<%
}
%>
</table>
<button><a href="/bdi-web/jsp/board/board-insert.jsp">글쓰기</a></button>
</body>
</html>
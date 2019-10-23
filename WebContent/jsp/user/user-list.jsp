<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
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
<option value="ui_name">이름</option>
<option value="ui_id">ID</option>
<option value="ui_age">나이</option>
</select> : <input type = "text" name="searchStr"><button>검색</button>
</form>
<table border="1" style="border:1px solid red">
<tr>
<th>num</th>
<th>id</th>
<th>pwd</th>
<th>name</th>
<th>age</th>
<th>etc</th>
<th>hobby</th>
</tr>
<%
String search=request.getParameter("search");
String searchStr=request.getParameter("searchStr");

String uiId=request.getParameter("id");
String sql="select* from user_info ";
if(search!=null){
	if("ui_name".equals(search)){
		sql+= " where ui_name like ? ";
	}
	else if("ui_id".equals(search)){
		sql+= " where ui_id like ? ";
	}
	else if("ui_age".equals(search)){
		sql+= " where ui_age like ? ";
	}
}
sql+=" order by ui_num desc";

Connection con = DBCon.getCon();
PreparedStatement ps= con.prepareStatement(sql);

if(search!=null){
	ps.setString(1,"%"+searchStr+"%");
}

ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString("ui_num") %></td>
<td><a href="/bdi-web/jsp/user/user-update.jsp?ui_num=<%=rs.getString("ui_num")%>"><%=rs.getString("ui_id") %></a></td>
<td><%=rs.getString("ui_pwd") %></td>
<td><%=rs.getString("ui_name") %></td>
<td><%=rs.getString("ui_age") %></td>
<td><%=rs.getString("ui_etc") %></td>
<td><%=rs.getString("hobby") %></td>
</tr>
<%
}
%>
</table>
</body>
</html>
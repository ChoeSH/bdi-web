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
아이디 : <input type = "text" name="ui_id"><button>검색</button>
</form>
<table border="1" style="border:1px solid red">
<tr>
<th>num</th>
<th>id</th>
<th>pwd</th>
<th>name</th>
<th>age</th>
<th>etc</th>
</tr>

<%
String uiId=request.getParameter("ui_id");
String sql="select* from user_info "; 
if(uiId!=null){
	sql +=" where ui_id like ? ";
}
sql+=" order by ui_num desc";
Connection con = DBCon.getCon();
PreparedStatement ps= con.prepareStatement(sql);
if(uiId!=null){
	ps.setString(1,"%"+uiId+"%");
}
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString("ui_num") %></td>
<td><%=rs.getString("ui_id") %></td>
<td><%=rs.getString("ui_pwd") %></td>
<td><%=rs.getString("ui_name") %></td>
<td><%=rs.getString("ui_age") %></td>
<td><%=rs.getString("ui_etc") %></td>
</tr>
<%
}
%>
</table>

</body>
</html>
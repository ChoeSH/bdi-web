<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method=post action="/bdi-web/jsp/user/user-signup-ok.jsp">
	ID:<input type="text"name="id"><br>
	Password:<input type="password"name="pwd"><br>
	Name:<input type="text"name="name"><br>
	Age:<input type="text"name="age"><br>
	Etc:<input type="text" name="etc"><br>
	hobby: <td><input type="checkbox" name="hobby"value="study">공부
	<input type="checkbox" name="hobby"value="game">게임
	<input type="checkbox" name="hobby"value="movie">영화
	<input type="checkbox" name="hobby"value="music">음악
	</td>
	<br>
	<button>가입하기</button></a>
</form>
</body>
</html>
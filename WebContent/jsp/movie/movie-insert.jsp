<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/bdi-web/jsp/movie/movie-insert_ok.jsp">
	num:<input type="number"name="num"><br>
	name:<input type="text"name="name"><br>
	price:<input type="number"name="price"><br>
	date:<input type="date"name="date"><br>
	desc:<input type="text" name="desc"><br>
	age:<input type="number"name="age"><br>
	star_rate:<input type="text"name="star_rate"><br>
	
	<button>입력하기</button>
</form>
</body>
</html>
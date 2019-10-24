
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="/bdi-web/jsp/board/board-insert-ok.jsp">

	title:<input type="text"name="bi_title"><br>
	user:<input type="text"name="bi_user"><br>
	content:<br><textarea name="bi_content" cols="40" rows="8" ></textarea>
	
	<button>입력하기</button>
	
</form>
<br>
<a href="/bdi-web/jsp/board/board-list.jsp">리스트로 돌아가기</a>
</body>

</html>
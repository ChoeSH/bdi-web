
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/bdi/jsp/test01/login.jsp" id="loginForm">			<%--post방식은 url이 바뀌지 않는다.--%>
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="pwd" id="pwd"><br>
<button type="button" onclick="login()">로그인</button>
</form>
<br>
<a href="/bdi/jsp/test01/join.jsp"><button>회원가입</button></a>
<script>
function login(){	//function을 사용해서 선언시 메소드는 윈도우에 귀속 window.login()으로 다른 영역에서 사용가능
	alert("로그인 버튼을 누름");
	var idObj = document.getElementById("id");
	var id=idObj.value
	var pwdObj = document.getElementById("pwd");
	var pwd = pwdObj.value
	
	//alert(id.length);	id의 길이는 메소드가 아니고 속성이므로 ()를 사용하지 않는다.
	
	if(id.length < 3){
		alert('id는 3글자 이상 입력해야 합니다.');
		idObj.value = '';
		idObj.focus();
		return;
	}
	if(pwd.length < 5){
		alert('비밀번호는 5글자 이상 입력해야 합니다.');
		pwdObj.value = '';
		pwdObj.focus();
		return;
	}
	var loginForm = document.getElementById("loginForm");
	loginForm.submit();		//form개체를 가져온다.
}


</script>
</body>
</html>
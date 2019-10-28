<%@ page language="java" contentType="text/html; charset=UTF-8"	
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!						//<%@는 자바의 import 같은 역할/	<%!는 메소드를 선언하는 역할
public void test(){		
System.out.println("ㅎ하하하하하");		//이 println문은 console에서만 출력된다.
}
%>
<%
String op=request.getParameter("op");		//class를 선언한 후 메소드를 선언하는것은 가능하다.
String num1 = request.getParameter("num1");
String num2 = request.getParameter("num2");

int result=0;
if(num1 !=null){
	int n1=Integer.parseInt(num1);
	int n2=Integer.parseInt(num2);
	
	if("+".equals(op)){
	out.println(n1+n2);
	result=n1+n2;
	}
	else if("-".equals(op)){
	out.println(n1-n2);
	result=n1-n2;
	}
	else if("*".equals(op)){
	out.println(n1*n2);
	result=n1*n2;
	}
	else if("/".equals(op)){
	out.println(n1/n2);
	result=n1/n2;
	}
	else{
	}
}
%>
<form>
	숫자1:<input type="number"name="num1">
	<select name="op">
	<option value="">선택</option>
	<option value="+">더하기</option>
	<option value="-">빼기</option> 
	<option value="*">곱하기</option> 
	<option value="/">나누기</option> 
	</select>
	숫자2:<input type="number"name="num2">
	=
	<input type="number"name="result"value="<%=result%>">
	<button onclick="calc();">계산하기</button>
</form>

<script>
function calc(){
	var n1 = document.getElementById("num1");
	var n2 = document.getElementById("num2");
	alert(parseInt(n1.value)+parseInt(n2.value));
	
	n1=parseInt(n1.value);
	n2=parseInt(n2.value);
	
	alert(result);
}
</script>
 
</body>
</html>
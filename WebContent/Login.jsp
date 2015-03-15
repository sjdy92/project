<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="jquery-1.11.1.min.js "></script>



<title>Insert title here</title>
<style>
	a{text-decoration : none;}
	body{
		text-align:center;
	}
</style>

</head>

<body>
	<br/>
	<br/>
	
	<div id="login">
		<form name="loginForm" method="post" id="loginPage" action="loginSuccess.do">
			<table align ='center'> 
				<tr><td></td></tr>
				<tr><td><input id="loginId" type="textbox" placeholder="      E - M a i l" style="width:300px;height:30px; "name="id"></td></tr>
				<tr><td><input id="loginPassword" type="password"placeholder="    P a s s w o r d"style="width:300px;height:30px;margin-bottom:10px;" name="pass"></td></tr>
				<tr><td><input id="loginSubmit" type="submit" value="로그인"style="width:300px;height:30px;"></td></tr>
			</table>
		</form>
	</div>
	
</body>
</html>
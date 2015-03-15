<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


<style>
	header {
		height:100px;
		align : center;
 		background-color : white;
		border-bottom : 1px solid gray;
	}
	
</style>
 <link rel="stylesheet" href="style/top.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/JavaScript" src="js/top.js"></script>


<script type="text/javascript">
$(document).ready(function(){
    $("#login").click(function(){
        $("#login_page").slideToggle("slow");
        $("#signin_page").slideUp();
    });
    $("#sign").click(function(){
        $("#signin_page").slideToggle("slow");
        $("#login_page").slideUp();
    });
    $("#logout").click(function(){
    	location.href="logout.do";
    })
     $("#mypage").click(function(){
    	location.href="mypage.do";
    })
});
</script>
</head>
<body>
	<header>
		<div>
			<a href="main.do"><img src="./images/common/logo.png" border="0" width="100" height="100"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"><img src="./images/common/product.png" border="0" width="80" height="80"></a>
			<a href="#"><img src="./images/common/reg.png" border="0" width="80" height="80"></a>
<%
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
%>
	<a href="#" id="logout"><img src="./images/common/logout.png" border="0" width="80" height="80"></a>
	<a href="#" id="mypage"><img src="./images/common/mypage.png" border="0" width="80" height="80"></a>
	
<%
	} else
	{
%>
	<a href="#" id="login"><img src="./images/common/login.png" border="0" width="80" height="80"></a>	
<%
	}
%>
			
			<a href="#" id="sign"><img src="./images/common/join.png" border="0" width="80" height="80"></a>
		</div>
	
	</header>
		<div id="login_page" style="display:none;">
			<jsp:include page="/Login.jsp" flush="true" />
		</div>
		<div id="signin_page" style="display:none;">
			<jsp:include page="/Join.jsp" flush="true" />
		</div>
</body>
</html>
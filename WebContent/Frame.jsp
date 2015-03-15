<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<script>
<% 
String mainUrl = "Main.do";
if(request.getAttribute("mainUrl") != null && ((String)request.getAttribute("mainUrl")).length() > 0)
{
	mainUrl = (String)request.getAttribute("mainUrl");
}
if(session.getAttribute("userState") != null && session.getAttribute("userState").equals("login")){
	%>alert("<%=session.getAttribute("userId")%>님 환영합니다.")<%
	session.setAttribute("userState", null);
}
if(session.getAttribute("userState") != null &&session.getAttribute("loginYn").equals("logout")){
	%>alert("로그아웃 되셨습니다 !");<%
	session.setAttribute("userState", null);
}
if(session.getAttribute("userState") != null &&session.getAttribute("loginYn").equals("No")){
	%>alert("로그인 실패");<%
	session.setAttribute("userState", null);
}

System.out.println(mainUrl);
%>
</script>
<HTML>
	<HEAD>
		<TITLE>DUMBOs</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="jquery-1.11.1.min.js"></script>
		<style>	
		</style>
	</HEAD>
	<BODY>
	
		<div>
			<div>
					<!-- 상단 화면 관련 시작 ------------------->
					<jsp:include page="/Top.jsp" flush="true" />
					<!-- 상단 화면 관련 끝 --------------------->
			</div>

			<div width=100% height="1000">
					<!-- Main 화면 관련 시작 ------------------->
					<jsp:include page="<%= mainUrl%>" flush="true" />
					<!-- Main 화면 관련 끝 --------------------->
			</div>
			
			
			<div>
					<!-- 밑 관련 시작 ------------------->
			<%if(mainUrl.equals("main.jsp")) %>		<jsp:include page="/Bottom.jsp" flush="true" />
					<!-- 밑 관련 끝 --------------------->
			</div>
		</div>
	</BODY>
</HTML>
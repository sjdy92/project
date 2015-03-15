<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="signIn" align ='center' >
			<form name="signInForm" id="signInPage" action="join.do">

				<INPUT type="hidden" name="idCheckYn" value="N"> <INPUT
					type="hidden" name="checkId" value=""> <INPUT type="hidden"
					name="func" value="">
				<TABLE>
					<!-- 아이디 -->
					<tr>
						<td align=center class="txt_pro" nowrap width="150" height="40">E-mail</td>
						<td><input type="text" size=10 name="id"
							style="width: 200px; height: 20px; cursor: hand"> &nbsp;<a
							href="#">중복확인</a> &nbsp;</td>
					</tr>
					<!-- 비밀번호 -->
					<tr>
						<td align="center" height="40">비밀번호</td>
						<td colspan="2"><input type="password" size=10 name="pass"
							maxlength="16" style="width: 200px; height: 20px;"></td>
					</tr>

					<!-- 비밀번호 확인 -->
					<tr>
						<td align="center" height="40">비밀번호 확인</td>
						<td bgcolor="#FFFFFF"><input type="password" size=10
							name="pass2" class="input01" maxlength="16"
							style="width: 200px; height: 20px;"></td>
					</tr>

					<!-- 휴대전화 -->
					<tr>
						<td align="center" class="txt_pro" height="40">휴대전화</td>
						<td>
						<input type=text size=5 name="phone" value="010-"class="input01" maxlength=12> 
							</td>
					</tr>

					<!-- SMS수신여부 -->
					<tr>
						<td align="center" class="txt_pro" height="30">SMS 수신여부</td>
						<td><input type='radio' name='smsyn' value='T' checked>
							예 <input type='radio' name='smsyn' value='F'> 아니오</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="2"><input
							id="loginSubmit" type="submit" value="회원 가입"
							style="width: 300px; height: 30px; margin-top: 20px;"></td>
					</tr>


				</table>
			</FORM>
	</div>
</body>
</html>
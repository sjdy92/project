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
					<!-- ���̵� -->
					<tr>
						<td align=center class="txt_pro" nowrap width="150" height="40">E-mail</td>
						<td><input type="text" size=10 name="id"
							style="width: 200px; height: 20px; cursor: hand"> &nbsp;<a
							href="#">�ߺ�Ȯ��</a> &nbsp;</td>
					</tr>
					<!-- ��й�ȣ -->
					<tr>
						<td align="center" height="40">��й�ȣ</td>
						<td colspan="2"><input type="password" size=10 name="pass"
							maxlength="16" style="width: 200px; height: 20px;"></td>
					</tr>

					<!-- ��й�ȣ Ȯ�� -->
					<tr>
						<td align="center" height="40">��й�ȣ Ȯ��</td>
						<td bgcolor="#FFFFFF"><input type="password" size=10
							name="pass2" class="input01" maxlength="16"
							style="width: 200px; height: 20px;"></td>
					</tr>

					<!-- �޴���ȭ -->
					<tr>
						<td align="center" class="txt_pro" height="40">�޴���ȭ</td>
						<td>
						<input type=text size=5 name="phone" value="010-"class="input01" maxlength=12> 
							</td>
					</tr>

					<!-- SMS���ſ��� -->
					<tr>
						<td align="center" class="txt_pro" height="30">SMS ���ſ���</td>
						<td><input type='radio' name='smsyn' value='T' checked>
							�� <input type='radio' name='smsyn' value='F'> �ƴϿ�</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="2"><input
							id="loginSubmit" type="submit" value="ȸ�� ����"
							style="width: 300px; height: 30px; margin-top: 20px;"></td>
					</tr>


				</table>
			</FORM>
	</div>
</body>
</html>
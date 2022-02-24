<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	
	window.onload = function()
	{
		document.login.uid.focus();
	}
	
	//로그인 폼 검사
	function FormCheck()
	{
		if( document.login.uid.value == "" )
		{
			alert("아이디를 입력하세요.");
			document.login.uid.focus();
			return false;
		}
		if( document.login.upw.value == "" )
		{
			alert("암호를 입력하세요.");
			document.login.upw.focus();
			return false;
		}	
		return true;
	}
	
</script>
<table border="0" style="width:50%;" align="center">
	<tr>
		<td style="text-align:center;width:120px;" >
			<span><h2>login</h2></span>
		</td>
	</tr>
</table>		
<form name="login" method="post" action="/gyu/member/loginok.jsp" onsubmit="return FormCheck();">
<table border="1" style="width:20%;" align="center">
	<tr>
		<td style="text-align:center;width:120px;">아이디 (*) </td>
		<td><input type="text" name="uid" placeholder="아이디"></td>
	</tr>
	<tr>
		<td style="text-align:center;width:120px;">비밀번호 (*) </td>
		<td><input type="password" name="upw" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="submit" value="로그인하기">
		</td>
	</tr>					
</table>
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/tall.jsp" %>
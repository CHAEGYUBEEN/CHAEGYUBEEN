<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<script>
	
	window.onload = function()
	{
		document.login.uid.focus();
	}
	
	//�α��� �� �˻�
	function FormCheck()
	{
		if( document.login.uid.value == "" )
		{
			alert("���̵� �Է��ϼ���.");
			document.login.uid.focus();
			return false;
		}
		if( document.login.upw.value == "" )
		{
			alert("��ȣ�� �Է��ϼ���.");
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
		<td style="text-align:center;width:120px;">���̵� (*) </td>
		<td><input type="text" name="uid" placeholder="���̵�"></td>
	</tr>
	<tr>
		<td style="text-align:center;width:120px;">��й�ȣ (*) </td>
		<td><input type="password" name="upw" placeholder="��й�ȣ"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="submit" value="�α����ϱ�">
		</td>
	</tr>					
</table>
</form>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/tall.jsp" %>
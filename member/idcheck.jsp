<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>   
<%
String  uid = request.getParameter("id");
boolean isdup = false;
//�ߺ����Կ��� üũ
String sql = "select uid from user where uid = '" + uid + "' ";
dbms.OpenQuery(sql);
if(dbms.GetNext() == true)
{
	//ID�� �ߺ���
	isdup = true;	
}else
{
	isdup = false;
}
dbms.CloseQuery();
%>    
<%@ include file="../config/dbclose.jsp" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���̵� �ߺ� �˻�</title>
	</head>
	<body>
		<script>
			function SetIDCheckDone(value)
			{
				opener.IsDupCheck = value;
				window.close();
			}			
		</script>
		<%
		if(isdup == true)
		{
			%>
			"<%= uid %>"�� <u>��� �� �� ����</u> ID�Դϴ�.
			<br>			
			<input type="button" value="�ݱ�" onclick="SetIDCheckDone(2);">
			<%			
		}else
		{
			%>
			"<%= uid %>"�� ��� �� �� �ִ� ID�Դϴ�.
			<br>			
			<input type="button" value="ID����ϱ�" onclick="SetIDCheckDone(1);">
			<%
		}
		%>
	</body>
</html>
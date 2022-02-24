<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>   
<%
String  uid = request.getParameter("id");
boolean isdup = false;
//중복가입여부 체크
String sql = "select uid from user where uid = '" + uid + "' ";
dbms.OpenQuery(sql);
if(dbms.GetNext() == true)
{
	//ID가 중복됨
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
		<title>아이디 중복 검사</title>
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
			"<%= uid %>"는 <u>사용 할 수 없는</u> ID입니다.
			<br>			
			<input type="button" value="닫기" onclick="SetIDCheckDone(2);">
			<%			
		}else
		{
			%>
			"<%= uid %>"는 사용 할 수 있는 ID입니다.
			<br>			
			<input type="button" value="ID사용하기" onclick="SetIDCheckDone(1);">
			<%
		}
		%>
	</body>
</html>
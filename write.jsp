<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>   
<%
String kind = request.getParameter("kind");
if(kind == null) kind = "T";
if( login == null )
{
	//response.sendRedirect("index.jsp");
	%>
	<script>
		alert("�۾��� ������ �����ϴ�.");
		document.location = "/gyu/index.jsp";
	</script>		
	<%
	return;
}
%> 
<!-- ������ ��ºκ�------------------------------------------ -->
<script>
	
	window.onload = function()
	{
		document.write.btitle.focus();
	}
	
	//�Է� �� �˻�
	function FormCheck()
	{
		if( document.write.btitle.value == "" )
		{
			alert("������ �Է��ϼ���.");
			document.write.btitle.focus();
			return false;
		}
		if( document.write.bnote.value == "" )
		{
			alert("������ �Է��ϼ���.");
			document.write.bnote.focus();
			return false;
		}
		if(confirm("�ۼ��� �Խù��� �����Ͻðڽ��ϱ�?") !=1 )
		{
			return false;	
		}
		return true;
	}
	
</script>
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px" align="center">
			<span style="font-weight:bold;">�۾���</span>
		</td>
	</tr>
</table>		
<form name="write" enctype="multipart/form-data" method="post" enctype="multipart/form-data" action="/gyu/writeok.jsp" onsubmit="return FormCheck();" >
<table border="0" style="width:50%;" align="center" border: 1px;>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">����</td>
		<td><input type="text" name="btitle" style="width:95%"></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">�ۼ���</td>
		<td><%= login.getName() %></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">����</td>
		<td>
		<%
		if(kind.equals("T"))
		{
			%>
				<input type="radio" id="bkindT" name="bkind" value="T" checked>��Ʈ
			<%	
		}else if(kind.equals("CP"))
		{
			%>
				<input type="radio" id="bkindCP" name="bkind" value="CP" checked>ķ�ε���
			<%	
		}else if(kind.equals("CK"))
		{
			%>
				<input type="radio" id="bkindCK" name="bkind" value="CK" checked>����ǰ
			<%	
		}else
		{
			%>
				<input type="radio" id="bkindL" name="bkind" value="L" checked>����/����
			<%	
		}
		%>
			
		</td>
	</tr>						
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">����</td>
		<td><textarea name="bnote" style="width:95%; height:200px;"></textarea></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">÷������</td>
		<td><input name="attach" type="file" style="width:95%"></td>
	</tr>
	<tr>
		<td colspan="2" style="height:1px;background-color:#cccccc"></td>
	</tr>
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="hidden" name="kind" value="<%= kind %>">
			<input type="submit" value="�۾��� �Ϸ�">
			<a href="/gyu/board/boardT.jsp?kind=<%= kind %>"><input type="button" value="���"></a>
		</td>
	</tr>
</table>					
</form>
<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
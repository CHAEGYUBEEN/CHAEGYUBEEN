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
		alert("글쓰기 권한이 없습니다.");
		document.location = "/gyu/index.jsp";
	</script>		
	<%
	return;
}
%> 
<!-- 컨텐츠 출력부분------------------------------------------ -->
<script>
	
	window.onload = function()
	{
		document.write.btitle.focus();
	}
	
	//입력 폼 검사
	function FormCheck()
	{
		if( document.write.btitle.value == "" )
		{
			alert("제목을 입력하세요.");
			document.write.btitle.focus();
			return false;
		}
		if( document.write.bnote.value == "" )
		{
			alert("내용을 입력하세요.");
			document.write.bnote.focus();
			return false;
		}
		if(confirm("작성된 게시물을 저장하시겠습니까?") !=1 )
		{
			return false;	
		}
		return true;
	}
	
</script>
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px" align="center">
			<span style="font-weight:bold;">글쓰기</span>
		</td>
	</tr>
</table>		
<form name="write" enctype="multipart/form-data" method="post" enctype="multipart/form-data" action="/gyu/writeok.jsp" onsubmit="return FormCheck();" >
<table border="0" style="width:50%;" align="center" border: 1px;>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
		<td><input type="text" name="btitle" style="width:95%"></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">작성자</td>
		<td><%= login.getName() %></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
		<td>
		<%
		if(kind.equals("T"))
		{
			%>
				<input type="radio" id="bkindT" name="bkind" value="T" checked>텐트
			<%	
		}else if(kind.equals("CP"))
		{
			%>
				<input type="radio" id="bkindCP" name="bkind" value="CP" checked>캠핑도구
			<%	
		}else if(kind.equals("CK"))
		{
			%>
				<input type="radio" id="bkindCK" name="bkind" value="CK" checked>취사용품
			<%	
		}else
		{
			%>
				<input type="radio" id="bkindL" name="bkind" value="L" checked>랜턴/램프
			<%	
		}
		%>
			
		</td>
	</tr>						
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">내용</td>
		<td><textarea name="bnote" style="width:95%; height:200px;"></textarea></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">첨부파일</td>
		<td><input name="attach" type="file" style="width:95%"></td>
	</tr>
	<tr>
		<td colspan="2" style="height:1px;background-color:#cccccc"></td>
	</tr>
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="hidden" name="kind" value="<%= kind %>">
			<input type="submit" value="글쓰기 완료">
			<a href="/gyu/board/boardT.jsp?kind=<%= kind %>"><input type="button" value="취소"></a>
		</td>
	</tr>
</table>					
</form>
<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
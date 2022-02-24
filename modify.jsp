<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
if( login == null )
{
	%>
	<script>
		alert("변경 권한이 없습니다.");
		document.location = "/gyu/index.jsp";
	</script>		
	<%
	return;
}
String bno  = request.getParameter("no");
String kind = request.getParameter("kind");
String curpage = request.getParameter("page");
//검색 키워드
String key = request.getParameter("key");
if(key == null) key = "";
key = URLEncoder.encode(key);

if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}

//게시물의 정보를 얻는다.
String sql = "";
sql  = "select bno,uno,btitle,bkind,bnote,bwdate,bhit,";
sql += "(select uname from user where uno = board.uno) as uname ";
sql += "from board ";
sql += "where bno = '" + bno + "' ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
if(dbms.GetNext() == false)
{
	dbms.CloseQuery();
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}
String uno     = dbms.GetValue("uno");
String btitle  = dbms.GetValue("btitle");
String bkind   = dbms.GetValue("bkind");
String bnote   = dbms.GetValue("bnote");
String bwdate  = dbms.GetValue("bwdate");
String bhit    = dbms.GetValue("bhit");
String uname   = dbms.GetValue("uname");
dbms.CloseQuery();

//첨부파일을 얻는다.
sql  = "select ano,fname ";
sql += "from attach ";
sql += "where bno = '" + bno + "' ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
String ano   = "";
String fname = "";
if(dbms.GetNext() == true)
{	
	ano   = dbms.GetValue("ano");
	fname = dbms.GetValue("fname");
}
dbms.CloseQuery();

//소유자 여부를 검사한다.
if(login.getNo().equals(uno) == false)
{
	%>
	<script>
		alert("해당 게시물에 대한 변경 권한이 없습니다.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%	
	return;
}
%>    
<!-- 컨텐츠 출력부분------------------------------------------ -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;">글수정</span>
		</td>
	</tr>
</table>
<script>
	
	window.onload = function()
	{
		document.modify.btitle.focus();
	}
	
	//입력 폼 검사
	function FormCheck()
	{
		if( document.modify.btitle.value == "" )
		{
			alert("제목을 입력하세요.");
			document.modify.btitle.focus();
			return false;
		}
		if( document.modify.bnote.value == "" )
		{
			alert("내용을 입력하세요.");
			document.modify.bnote.focus();
			return false;
		}
		if(confirm("변경된 게시물을 저장하시겠습니까?") !=1 )
		{
			return false;	
		}
		return true;
	}
	
</script>		
<form name="modify" enctype="multipart/form-data" method="post" action="/gyu/modifyok.jsp" onsubmit="return FormCheck();">
<input type="hidden" name="kind" value="<%= kind %>">
<input type="hidden" name="page" value="<%= curpage %>">
<input type="hidden" name="no" value="<%= bno %>">
<input type="hidden" name="key" value="<%= key %>">
<table border="0" style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
		<td><input type="text" name="btitle" style="width:95%" value="<%= btitle %>"></td>
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
		<td><textarea name="bnote" style="width:95%; height:200px;"><%= bnote %></textarea></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">첨부파일</td>
		<td><input name="attach" type="file" style="width:95%"></td>
	</tr>
	<tr>
		<td style="width:120px; text-align:center; background-color:#f4f4f4">기존 첨부파일</td>
		<td>
		<%
		if(ano.equals(""))
		{
			%>첨부파일 없음<%
		}else
		{
			%><a href="/gyu/download.jsp?fno=<%= ano %>"><%= fname %></a><%
		}
		%>		
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:1px;background-color:#cccccc"></td>
	</tr>
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="submit" value="글쓰기 완료">
			<a href="/gyu/view.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>">글수정 취소</a>
		</td>
	</tr>
</table>					
</form>
<!-- 컨텐츠 출력부분------------------------------------------ -->			
<%@ include file="../include/tall.jsp" %>
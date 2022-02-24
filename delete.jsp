<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
if( login == null )
{
	%>
	<script>
		alert("삭제 권한이 없습니다.");
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

String sql = "";

//게시물의 소유주 정보를 가져온다.
sql  = "select uno ";
sql += "from board ";
sql += "where bno = '" + bno + "' ";
dbms.OpenQuery(sql);
if( dbms.GetNext() == false)
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
String uno = dbms.GetValue("uno");
dbms.CloseQuery();

//소유자 여부를 검사한다.
if(login.getNo().equals(uno) == false)
{
	%>
	<script>
		alert("해당 게시물에 대한 삭제 권한이 없습니다.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%	
	return;
}

//첨부파일을 삭제한다.
sql = "delete from attach ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);

//게시물을 삭제한다.
sql  = "delete from board ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);

%>
<!-- 컨텐츠 출력부분------------------------------------------ -->
<center>글이 삭제되었습니다.</center>
<br>
<center>
<%
	if(kind.equals("T"))
	{
		%>
		<a href="/gyu/board/boardT.jsp?kind=<%= kind %>">목록으로 돌아가기</a>
		<%
	}else if(kind.equals("CP"))
	{
		%>
		<a href="/gyu/board/boardCP.jsp?kind=<%= kind %>">목록으로 돌아가기</a>
		<%
	}
	else if(kind.equals("Ck"))
	{
		%>
		<a href="/gyu/board/boardCk.jsp?kind=<%= kind %>">목록으로 돌아가기</a>
		<%
	}
	else
	{
		%>
		<a href="/gyu/board/boardL.jsp?kind=<%= kind %>">목록으로 돌아가기</a>
		<%
	}
%>
</center>
<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>    
<!-- 컨텐츠 출력부분------------------------------------------ -->
<%
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

//조회수를 증가시킨다.
String sql  = "update board set bhit = bhit + 1 where bno = " + bno;
System.out.println("SQL:" + sql);
dbms.RunSQL(sql);

//게시물의 정보를 얻는다.
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
%>
<script>
	window.onload = function()
	{
		GetReplyList();
	}
	
	function GetReplyList()
	{
		$.ajax({
			type : "get",
			url: "/gyu/reply/replylist.jsp?no=<%= bno %>",
			dataType: "html",
			success : function(data) 
			{
				$("#replylist").html(data);
			}
		});		
	}	
	
	function AddReply()
	{
		if( $("#rpnote").val() == "" )
		{
			alert("댓글 내용을 입력하세요.");
			$("#rpnote").focus();
			return;
		}
		var param = "";
		param  = "no=<%= bno %>";
		param += "&rpnote=" + $("#rpnote").val();

		$.ajax({
			type : "post",
			url: "/gyu/reply/reply.jsp",
			data: param,
			dataType: "html",
			success : function(data) 
			{
				alert("댓글이 등록되었습니다.");
				GetReplyList();
			}
		});
		//document.reply.submit();
	}
	
	function ReplyDelete(urladdr)
	{
		alert(urladdr);
		$.ajax({
			type : "get",
			url: urladdr,
			dataType: "html",
			success : function(data) 
			{
				alert("댓글이 삭제되었습니다.");
				GetReplyList();
			}
		});		
	}
</script>
<table border="0" style="width:50%;" align="center">
	<tr>
		<th style="height:40px" align="center">
			 글보기
		</th>
	</tr>
</table>
<table border="1" style="width:50%;"align="center" >
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">제목</td>
		<td><%= btitle %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">구분</td>
		<td><%= bkind %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성자</td>
		<td><%= uname %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성일</td>
		<td><%= bwdate %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">조회수</td>
		<td><%= bhit %>회</td>
	</tr>
	<tr>
		<%
		bnote = bnote.replace("<","&lt;");
		bnote = bnote.replace(">","&gt;");
		bnote = bnote.replace("\n","<br>");		
		%>
		<td colspan="2"><%= bnote %></td>
	</tr>	
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">첨부파일</td>
		<td><%
		if(ano.equals(""))
		{
			%>첨부파일 없음<%
		}else
		{
			%>
			<a href="/gyu/download.jsp?fno=<%= ano %>"><%= fname %></a>
			<a href="javascript:ViewImage(<%= ano %>)";><img src="/gyu/download.jsp?fno=<%= ano %>" style="width:50%;"></a>
			<%
		}
		%></td>
	</tr>	
	<tr>
		<td colspan="2" align="center" style="height:40px;">
		<%
		if(kind.equals("T"))
		{
			%>
			<a href="/gyu/board/boardT.jsp?kind=<%= kind %>">글목록</a>
			<%
		}else if(kind.equals("CP"))
		{
			%>
			<a href="/gyu/board/boardCP.jsp?kind=<%= kind %>">글목록</a>
			<%
		}
		else if(kind.equals("Ck"))
		{
			%>
			<a href="/gyu/board/boardCk.jsp?kind=<%= kind %>">글목록</a>
			<%
		}
		else
		{
			%>
			<a href="/gyu/board/boardL.jsp?kind=<%= kind %>">글목록</a>
			<%
		}
		%>
		&nbsp;|&nbsp;
		<%
		if( login != null && login.getNo().equals(uno) )
		{
			//게시글 작성자 인 경우에만 글수정/삭제를 보이도록 처리한다.
			%>
			<a href="/gyu/modify.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>">글수정</a>
			&nbsp;|&nbsp;
			<a href="/gyu/delete.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>">글삭제</a>
			<%
		}
		%>
		</td>
	</tr>
</table><br><br><br>
<!--  댓글 목록 표시 시작 부분 ---------------------------->
<span id="replylist">이곳에 댓글 목록이 표시됩니다.</span>
<!--  댓글 목록 표시 종료 부분 ---------------------------->
<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
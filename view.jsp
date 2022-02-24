<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>    
<!-- ������ ��ºκ�------------------------------------------ -->
<%
String bno  = request.getParameter("no");
String kind = request.getParameter("kind");
String curpage = request.getParameter("page");
//�˻� Ű����
String key = request.getParameter("key");
if(key == null) key = "";
key = URLEncoder.encode(key);

if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("�߸� ȣ��� �Խù� ��ȣ�Դϴ�.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}

//��ȸ���� ������Ų��.
String sql  = "update board set bhit = bhit + 1 where bno = " + bno;
System.out.println("SQL:" + sql);
dbms.RunSQL(sql);

//�Խù��� ������ ��´�.
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
		alert("�߸� ȣ��� �Խù� ��ȣ�Դϴ�.");
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

//÷�������� ��´�.
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
			alert("��� ������ �Է��ϼ���.");
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
				alert("����� ��ϵǾ����ϴ�.");
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
				alert("����� �����Ǿ����ϴ�.");
				GetReplyList();
			}
		});		
	}
</script>
<table border="0" style="width:50%;" align="center">
	<tr>
		<th style="height:40px" align="center">
			 �ۺ���
		</th>
	</tr>
</table>
<table border="1" style="width:50%;"align="center" >
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">����</td>
		<td><%= btitle %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">����</td>
		<td><%= bkind %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">�ۼ���</td>
		<td><%= uname %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">�ۼ���</td>
		<td><%= bwdate %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">��ȸ��</td>
		<td><%= bhit %>ȸ</td>
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
		<td style="background-color:#f4f4f4; width:120px;">÷������</td>
		<td><%
		if(ano.equals(""))
		{
			%>÷������ ����<%
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
			<a href="/gyu/board/boardT.jsp?kind=<%= kind %>">�۸��</a>
			<%
		}else if(kind.equals("CP"))
		{
			%>
			<a href="/gyu/board/boardCP.jsp?kind=<%= kind %>">�۸��</a>
			<%
		}
		else if(kind.equals("Ck"))
		{
			%>
			<a href="/gyu/board/boardCk.jsp?kind=<%= kind %>">�۸��</a>
			<%
		}
		else
		{
			%>
			<a href="/gyu/board/boardL.jsp?kind=<%= kind %>">�۸��</a>
			<%
		}
		%>
		&nbsp;|&nbsp;
		<%
		if( login != null && login.getNo().equals(uno) )
		{
			//�Խñ� �ۼ��� �� ��쿡�� �ۼ���/������ ���̵��� ó���Ѵ�.
			%>
			<a href="/gyu/modify.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>">�ۼ���</a>
			&nbsp;|&nbsp;
			<a href="/gyu/delete.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>">�ۻ���</a>
			<%
		}
		%>
		</td>
	</tr>
</table><br><br><br>
<!--  ��� ��� ǥ�� ���� �κ� ---------------------------->
<span id="replylist">�̰��� ��� ����� ǥ�õ˴ϴ�.</span>
<!--  ��� ��� ǥ�� ���� �κ� ---------------------------->
<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
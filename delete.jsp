<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
if( login == null )
{
	%>
	<script>
		alert("���� ������ �����ϴ�.");
		document.location = "/gyu/index.jsp";
	</script>		
	<%
	return;
}
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

String sql = "";

//�Խù��� ������ ������ �����´�.
sql  = "select uno ";
sql += "from board ";
sql += "where bno = '" + bno + "' ";
dbms.OpenQuery(sql);
if( dbms.GetNext() == false)
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
String uno = dbms.GetValue("uno");
dbms.CloseQuery();

//������ ���θ� �˻��Ѵ�.
if(login.getNo().equals(uno) == false)
{
	%>
	<script>
		alert("�ش� �Խù��� ���� ���� ������ �����ϴ�.");
		document.location = "/gyu/index.jsp?kind=<%= kind %>";
	</script>
	<%	
	return;
}

//÷�������� �����Ѵ�.
sql = "delete from attach ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);

//�Խù��� �����Ѵ�.
sql  = "delete from board ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);

%>
<!-- ������ ��ºκ�------------------------------------------ -->
<center>���� �����Ǿ����ϴ�.</center>
<br>
<center>
<%
	if(kind.equals("T"))
	{
		%>
		<a href="/gyu/board/boardT.jsp?kind=<%= kind %>">������� ���ư���</a>
		<%
	}else if(kind.equals("CP"))
	{
		%>
		<a href="/gyu/board/boardCP.jsp?kind=<%= kind %>">������� ���ư���</a>
		<%
	}
	else if(kind.equals("Ck"))
	{
		%>
		<a href="/gyu/board/boardCk.jsp?kind=<%= kind %>">������� ���ư���</a>
		<%
	}
	else
	{
		%>
		<a href="/gyu/board/boardL.jsp?kind=<%= kind %>">������� ���ư���</a>
		<%
	}
%>
</center>
<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
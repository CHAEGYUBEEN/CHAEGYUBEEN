<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>
<%
LoginVO login = (LoginVO)session.getAttribute("login");

String bno = request.getParameter("no");
%>    
<table border="1" width="50%" align="center">
	<tr>
		<td width="100px" align="center">작성자</td>
		<td align="center">댓글내용</td>
		<td width="100px" align="center">작성일</td>
	</tr>
	<%
	if(login != null)
	{
		%>
		<form id="reply" name="reply" method="post" action="/gyu/reply/reply.jsp">
		<tr>
			<td><%= login.getName() %></td>
			<td>
			<input type="hidden" id="no" name="no" value="<%= bno %>">
			<input type="text" id="rpnote" name="rpnote" style="width:95%">
			</td>
			<td align="center"><input type="button" onclick="AddReply();" value="작성완료"></td>
		</tr>
		</form>	
		<%
	}
	String sql = "";
	sql  = "select rpno,bno,rpuno,rpnote,";
	sql += "date(rpdate) as rpdate, ";
	sql += "(select uname from user where uno = reply.rpuno) as runame ";	
	sql += "from reply ";
	sql += "where bno = " + bno + " ";
	sql += "order by rpno desc ";
	dbms.OpenQuery(sql);
	while(dbms.GetNext() == true)
	{
		String rpno  = dbms.GetValue("rpno");
		String rpuno  = dbms.GetValue("rpuno");
		String rpnote = dbms.GetValue("rpnote");
		String rpdate = dbms.GetValue("rpdate");
		String runame = dbms.GetValue("runame");
		%>
		<tr>
			<td><%= runame %></td>
			<td><%= rpnote %>
			<%
			if( login != null && login.getNo().equals(rpuno) )
			{
				%>
				[ <a href="javascript:ReplyDelete('/gyu/reply/redelete.jsp?no=<%= bno %>&rpno=<%= rpno %>');">삭제</a> ]
				<%
			}
			%>
			</td>
			<td align="center"><%= rpdate %></td>
		</tr>
		<%
	}
	dbms.CloseQuery();
	%>
	
</table>
<%@ include file="../config/dbclose.jsp" %>
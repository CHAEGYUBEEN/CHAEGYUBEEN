<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/dbopen.jsp" %> 
<%
//request.setCharacterEncoding("euc-kr");

LoginVO login = (LoginVO)session.getAttribute("login");

String bno  = request.getParameter("no");
String rpnote = request.getParameter("rpnote");

String sql = "";
sql  = "insert into reply ";
sql += "(bno,rpuno,rpnote) ";
sql += "values('" + bno + "','" + login.getNo() + "','" + rpnote + "')";
dbms.RunSQL(sql);

//response.sendRedirect("view.jsp?no=" + bno);
%>
<%@ include file="../../config/dbclose.jsp" %>
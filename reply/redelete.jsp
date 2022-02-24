<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/dbopen.jsp" %> 
<%
String bno  = request.getParameter("no");
String rpno = request.getParameter("rpno");

String sql = "";
sql  = "delete from reply ";
sql += "where bno = " + bno + " and rpno = " + rpno;
dbms.RunSQL(sql);

//response.sendRedirect("view.jsp?no=" + bno);
%>
<%@ include file="../../config/dbclose.jsp" %>



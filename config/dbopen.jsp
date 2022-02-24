<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="gyu.*" %>
<%@ page import="java.sql.*" %>   
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
String uploadPath = "D:\\gyubeen\\ws\\gyu\\WebContent\\upload";

DBManager dbms = new DBManager();
dbms.DBOpen();
%> 
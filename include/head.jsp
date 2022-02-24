<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>
<%
LoginVO login = (LoginVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>BaenStar</title>
		<link rel="stylesheet" href="/gyu/css/style.css">
		 <script src="/gyu/js/board.js"></script>
		 <script src="/gyu/js/jquery-3.6.0.js"></script>
	</head>
	<body>
		<table border="0" style="background-color:#f4f4f4; width:100%; height:60px;">
			<tr>
				<td>
					<a href="/gyu/index.jsp">
					<span style="color:black; font-size:15pt;">BaenStar</span>	
					</a>
				</td>
				<td align="right">
					<%
						if( login == null )
						{
							//로그인이 안되었을 경우..
							%>
							<a href="/gyu/member/login.jsp">로그인</a>
							&nbsp;&nbsp;
							<a href="/gyu/member/join.jsp">회원가입</a>
							&nbsp;
							<%
						}else
						{
							%>
							[ <%= login.getName() %> ]님이 로그인 되었습니다.
							<a href="/gyu/member/logout.jsp">로그아웃</a>
							&nbsp;
							<%									
						}
					%>
				</td>
			</tr>
		</table>
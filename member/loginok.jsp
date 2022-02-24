<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>    
<%
request.setCharacterEncoding("euc-kr");

String uid  = request.getParameter("uid");     //아이디
String upw  = request.getParameter("upw");     //비번

System.out.println("아이디:" + uid);
System.out.println("비번:" + upw);

//로그인 체크
String sql = "";
sql  = "select uno,uname ";
sql += "from user ";
sql += "where uid = '" + uid + "' ";
sql += "and upw = md5('" + upw + "') ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
if( dbms.GetNext() == false)
{
	dbms.CloseQuery();
	%>
	 <script>
	 	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	 	document.location = "/gyu/member/login.jsp";
	 </script>	
	<%
}else
{	
	String uno   = dbms.GetValue("uno");
	String uname = dbms.GetValue("uname");

	dbms.CloseQuery();
	
	LoginVO vo = new LoginVO(uno,uid,uname);
	
	session.setAttribute("login",vo);	
	%>
	 <script>
	 	document.location = "/gyu/index.jsp";
	 </script>	
	<%
}
%>
<!-- 컨텐츠 출력부분------------------------------------------ -->

<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../config/dbclose.jsp" %>  
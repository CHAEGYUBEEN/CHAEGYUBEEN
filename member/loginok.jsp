<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>    
<%
request.setCharacterEncoding("euc-kr");

String uid  = request.getParameter("uid");     //���̵�
String upw  = request.getParameter("upw");     //���

System.out.println("���̵�:" + uid);
System.out.println("���:" + upw);

//�α��� üũ
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
	 	alert("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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
<!-- ������ ��ºκ�------------------------------------------ -->

<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../config/dbclose.jsp" %>  
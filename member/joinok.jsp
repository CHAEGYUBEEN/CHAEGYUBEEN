<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>  
<!-- �������κ�----------------------------------- -->  
<%
request.setCharacterEncoding("euc-kr");

String uid      = request.getParameter("uid");		//���̵�
String upw      = request.getParameter("upw");		//���
String uname    = request.getParameter("uname");	//�̸�
String ugender  = request.getParameter("ugender");	//����
String uemail   = request.getParameter("uemail");	//�̸���
String uadd   	= request.getParameter("uadd");		//�ּ�
String ucell    = request.getParameter("ucell");  	//�ڵ�����ȣ
System.out.println("���̵�:" + uid);
System.out.println("���:" + upw);
System.out.println("�̸�:" + uname);
System.out.println("����:" + ugender);
System.out.println("�̸���:" + uemail);
System.out.println("�ּ�:" + uadd);
System.out.println("�ڵ�����ȣ:" + ucell);


//�ߺ����Կ��� üũ
String sql = "";
sql = "select uid from user where uid = '" + uid + "' ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
if( dbms.GetNext() == true)
{
	dbms.CloseQuery();
	%>�ߺ��� ���̵� �����մϴ�.<%	
}else
{
	dbms.CloseQuery();
	
	//Insert ó��
	sql  = "";
	sql += "insert into user (uid,upw,uname,ugender,uemail,uadd,ucell) ";
	sql += "values (";
	sql += "'" + uid + "',";
	sql += "md5('" + upw + "'),";
	sql += "'" + uname + "',";
	sql += "'" + ugender + "',";
	sql += "'" + uemail + "',";
	sql += "'" + uadd + "',";
	sql += "'" + ucell + "')";
	System.out.println("SQL:" + sql);
	dbms.RunSQL(sql);	
	
	//��ϵ� ���̵��� ��ȣ�� ��´�.
	sql = "select last_insert_id() as no ";
	dbms.OpenQuery(sql);
	dbms.GetNext();
	String uno = dbms.GetValue("no");
	dbms.CloseQuery();
	
	
	%><center>ȸ�������� �Ϸ�Ǿ����ϴ�.</center><%
}
%>
<br>
<center><a href="/gyu/member/login.jsp">�α��� ȭ������ ���ư���</a></center>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/tall.jsp" %>
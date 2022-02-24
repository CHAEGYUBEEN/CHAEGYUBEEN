<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>  
<!-- 컨텐츠부분----------------------------------- -->  
<%
request.setCharacterEncoding("euc-kr");

String uid      = request.getParameter("uid");		//아이디
String upw      = request.getParameter("upw");		//비번
String uname    = request.getParameter("uname");	//이름
String ugender  = request.getParameter("ugender");	//성별
String uemail   = request.getParameter("uemail");	//이메일
String uadd   	= request.getParameter("uadd");		//주소
String ucell    = request.getParameter("ucell");  	//핸드폰번호
System.out.println("아이디:" + uid);
System.out.println("비번:" + upw);
System.out.println("이름:" + uname);
System.out.println("성별:" + ugender);
System.out.println("이메일:" + uemail);
System.out.println("주소:" + uadd);
System.out.println("핸드폰번호:" + ucell);


//중복가입여부 체크
String sql = "";
sql = "select uid from user where uid = '" + uid + "' ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
if( dbms.GetNext() == true)
{
	dbms.CloseQuery();
	%>중복된 아이디가 존재합니다.<%	
}else
{
	dbms.CloseQuery();
	
	//Insert 처리
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
	
	//등록된 아이디의 번호를 얻는다.
	sql = "select last_insert_id() as no ";
	dbms.OpenQuery(sql);
	dbms.GetNext();
	String uno = dbms.GetValue("no");
	dbms.CloseQuery();
	
	
	%><center>회원가입이 완료되었습니다.</center><%
}
%>
<br>
<center><a href="/gyu/member/login.jsp">로그인 화면으로 돌아가기</a></center>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/tall.jsp" %>
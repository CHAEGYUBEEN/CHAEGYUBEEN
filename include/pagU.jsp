<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="head.jsp" %>
    
<%
request.setCharacterEncoding("euc-kr");

//����¡�� ���� ���� ����
int total   = 0;  //��ü �Խù� ����
int maxpage = 0;  //�ִ� ������ ����
int curpage = 0;  //���� ������ ��ȣ
int startno = 0;  //SQL limit ���� ��ȣ
int startBlock = 0; //����¡ ���� �� ��ȣ
int endBlock   = 0; //����¡ �� �� ��ȣ

//kind=T,CP,CK,L

String kind = request.getParameter("kind");
if(kind == null)kind = "";

//�˻� Ű����
String key = request.getParameter("key");
if(key == null) key = "";

//(5) "index.jsp?page=1" ���� �Ѿ�� page�� �м��Ѵ�.
if( request.getParameter("page") != null)
{
	//�Ѿ�� page ���� ������ curpage �� ��ȯ�Ѵ�. 
	curpage = Integer.parseInt(request.getParameter("page"));
}else
{
	//�Ѿ�� page ���� �����Ƿ� ���� ������ ��ȣ�� 1�� �����Ѵ�. 
	curpage = 1;
}

String sql = "";

//(1)�Խù��� ������ ��´�.
sql  = "select count(*) as count ";
sql += "from board ";
sql += "where bkind = '" + kind + "' ";
if(!key.equals(""))
{
	sql += "and btitle like '%" + key + "%' ";
}
dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInt("count");
dbms.CloseQuery();

//(2)�ִ� ������ ������ ����Ѵ�.
maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//(6) SQL��  limit ���� ��ȣ�� ����Ѵ�.
startno = (curpage - 1) * 10;

//�Խù� ����� ��ȸ�Ѵ�.
sql  = "select bno,uno,btitle,bkind,date(bwdate) as bwdate,bhit,";
sql += "(select uname from user where uno = board.uno) as uname,";
sql += "(select count(*) from reply where bno = board.bno) as rpno ";
sql += "from board ";
sql += "where bkind = '" + kind + "' ";
if(!key.equals(""))
{
	sql += "and btitle like '%" + key + "%' ";
}
sql += "order by bno desc ";
//(7,8) �������� 10���� ���������� limit �� ó���Ѵ�.
sql += "limit " + startno + ",10";
dbms.OpenQuery(sql);

//(9)����¡ ���ۺ���ȣ�� ���� ��ȣ�� ����Ѵ�.
startBlock = ( (curpage - 1)  / 10) * 10 + 1;
endBlock   = startBlock + 10 - 1; 
//(10)endBlock �� �ִ� ������ ��ȣ���� ũ�� �ȵ�.
if( endBlock > maxpage)
{
	//��: maxpage�� 22�ε�, endBlock�� 30�̸� endBlock�� 22�� ����
	endBlock = maxpage;
}
%>
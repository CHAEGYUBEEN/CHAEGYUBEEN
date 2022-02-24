<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%
request.setCharacterEncoding("euc-kr");

//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,
	"EUC-KR",new DefaultFileRenamePolicy());

String btitle = multi.getParameter("btitle");  //����
String bkind  = multi.getParameter("bkind");   //����
String bnote  = multi.getParameter("bnote");   //����
String uno    = login.getNo();

System.out.println("����:" + btitle);
System.out.println("����:" + bkind);
System.out.println("����:" + bnote);
System.out.println("ȸ����ȣ:" + uno);

//Insert ó��
String sql  = "";
sql += "insert into board (uno,btitle,bkind,bnote) ";
sql += "values (";
sql += "'" + uno + "',";
sql += "'" + btitle.replace("'","''") + "',";
sql += "'" + bkind + "',";
sql += "'" + bnote.replace("'","''") + "')";
System.out.println("SQL:" + sql);
dbms.RunSQL(sql);

//��ϵ� ���̵��� ��ȣ�� ��´�.
sql = "select last_insert_id() as no ";
dbms.OpenQuery(sql);
dbms.GetNext();
String bno = dbms.GetValue("no");
dbms.CloseQuery();

//÷�������� ������ �߰��Ѵ�.
//���ε�� ���ϸ��� ��´�.
Enumeration files = multi.getFileNames();
if(files != null)
{
	String fileid = (String) files.nextElement();
	String filename = (String) multi.getFilesystemName("attach");
	if(filename != null)
	{
		System.out.println("���ϸ� : " + filename + "<br>");
		
		String phyname = UUID.randomUUID().toString();
		String srcName    = uploadPath + "/" + filename;
		String targetName = uploadPath + "/" + phyname;
		File srcFile    = new File(srcName);
		File targetFile = new File(targetName);
		srcFile.renameTo(targetFile);
		
		sql  = "insert into attach (bno,uno,pname,fname) ";
		sql += "values (";
		sql += "'" + bno + "',";
		sql += "'" + uno + "',";
		sql += "'" + phyname + "',";
		sql += "'" + filename + "')";
		System.out.println("SQL:" + sql);
		dbms.RunSQL(sql);
	}
}
%>
<script>
	document.location = "/gyu/view.jsp?no=<%= bno %>&kind=<%= bkind %>";
</script>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/tall.jsp" %>
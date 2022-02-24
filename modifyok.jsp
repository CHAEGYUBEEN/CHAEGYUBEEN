<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
request.setCharacterEncoding("euc-kr");

//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,
	"EUC-KR",new DefaultFileRenamePolicy());

String bno  = multi.getParameter("no");
String kind = multi.getParameter("kind");
String curpage = multi.getParameter("page");
//�˻� Ű����
String key = multi.getParameter("key");
if(key == null) key = "";

String btitle = multi.getParameter("btitle");  //����
String bkind  = multi.getParameter("bkind");   //����
String bnote  = multi.getParameter("bnote");   //����

System.out.println("����:" + btitle);
System.out.println("����:" + bkind);
System.out.println("����:" + bnote);

String sql = "";
sql  = "update board ";
sql += "set btitle = '" + btitle.replace("'","''") + "' , ";
sql += "bkind = '" + bkind + "' , ";
sql += "bnote = '" + bnote.replace("'","''") + "' ";
sql += "where bno = " + bno;
dbms.RunSQL(sql);

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
		
		//Ȯ���ڸ� ��´�.
		//String filename = "dog.Jpg";
		String extension = "";				
		int i = filename.lastIndexOf('.');
		if (i > 0) 
		{
			extension = filename.substring(i+1);
		}
		extension = extension.toLowerCase();
		
		String phyname = UUID.randomUUID().toString() + "." + extension;
		
		String srcName    = uploadPath + "/" + filename;
		String targetName = uploadPath + "/" + phyname;
		File srcFile    = new File(srcName);
		File targetFile = new File(targetName);
		srcFile.renameTo(targetFile);
		
		sql = "delete from attach where bno = " + bno + " ";
		dbms.RunSQL(sql);
		
		sql  = "insert into attach (bno,uno,pname,fname) ";
		sql += "values (";
		sql += "'" + bno + "',";
		sql += "'" + login.getName() + "',";
		sql += "'" + phyname + "',";
		sql += "'" + filename + "')";
		System.out.println("SQL:" + sql);
		dbms.RunSQL(sql);
	}
}
%>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<script>
	alert("������ �Ϸ�Ǿ����ϴ�.");
	document.location = "/gyu/view.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>";
</script>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/tall.jsp" %>
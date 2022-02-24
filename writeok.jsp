<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%
request.setCharacterEncoding("euc-kr");

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,
	"EUC-KR",new DefaultFileRenamePolicy());

String btitle = multi.getParameter("btitle");  //제목
String bkind  = multi.getParameter("bkind");   //구분
String bnote  = multi.getParameter("bnote");   //내용
String uno    = login.getNo();

System.out.println("제목:" + btitle);
System.out.println("구분:" + bkind);
System.out.println("내용:" + bnote);
System.out.println("회원번호:" + uno);

//Insert 처리
String sql  = "";
sql += "insert into board (uno,btitle,bkind,bnote) ";
sql += "values (";
sql += "'" + uno + "',";
sql += "'" + btitle.replace("'","''") + "',";
sql += "'" + bkind + "',";
sql += "'" + bnote.replace("'","''") + "')";
System.out.println("SQL:" + sql);
dbms.RunSQL(sql);

//등록된 아이디의 번호를 얻는다.
sql = "select last_insert_id() as no ";
dbms.OpenQuery(sql);
dbms.GetNext();
String bno = dbms.GetValue("no");
dbms.CloseQuery();

//첨부파일이 있으면 추가한다.
//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
if(files != null)
{
	String fileid = (String) files.nextElement();
	String filename = (String) multi.getFilesystemName("attach");
	if(filename != null)
	{
		System.out.println("파일명 : " + filename + "<br>");
		
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
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/tall.jsp" %>
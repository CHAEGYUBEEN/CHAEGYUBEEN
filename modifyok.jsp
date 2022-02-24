<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
<%
request.setCharacterEncoding("euc-kr");

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,
	"EUC-KR",new DefaultFileRenamePolicy());

String bno  = multi.getParameter("no");
String kind = multi.getParameter("kind");
String curpage = multi.getParameter("page");
//검색 키워드
String key = multi.getParameter("key");
if(key == null) key = "";

String btitle = multi.getParameter("btitle");  //제목
String bkind  = multi.getParameter("bkind");   //구분
String bnote  = multi.getParameter("bnote");   //내용

System.out.println("제목:" + btitle);
System.out.println("구분:" + bkind);
System.out.println("내용:" + bnote);

String sql = "";
sql  = "update board ";
sql += "set btitle = '" + btitle.replace("'","''") + "' , ";
sql += "bkind = '" + bkind + "' , ";
sql += "bnote = '" + bnote.replace("'","''") + "' ";
sql += "where bno = " + bno;
dbms.RunSQL(sql);

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
		
		//확장자를 얻는다.
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
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	alert("변경이 완료되었습니다.");
	document.location = "/gyu/view.jsp?kind=<%= kind %>&page=<%= curpage %>&no=<%= bno %>&key=<%= key %>";
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/tall.jsp" %>
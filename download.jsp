<%@ page language="java" pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>
<%
String ano = request.getParameter("fno");
if( ano == null)
{
	response.sendRedirect("/gyu/index.jsp");
	return;
}
//첨부파일을 얻는다.
String sql = "";
sql  = "select pname,fname ";
sql += "from attach ";
sql += "where ano = '" + ano + "' ";
dbms.OpenQuery(sql);
if(dbms.GetNext() == false)
{
	response.sendRedirect("/gyu/index.jsp");
	return;	
}
String pname = dbms.GetValue("pname");
String fname = dbms.GetValue("fname");
dbms.CloseQuery();

String fullname = uploadPath + "\\" + pname;

fname = URLEncoder.encode(fname, "utf-8");
response.setContentType("application/binary");  
response.setHeader("Content-Transper-Encoding", "binary");
response.setHeader("Content-Disposition","attachment; filename=" + fname + "");   

File file = new File(fullname);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>
<%@ include file="../config/dbclose.jsp" %>

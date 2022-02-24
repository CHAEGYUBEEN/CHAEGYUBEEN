<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="head.jsp" %>
    
<%
request.setCharacterEncoding("euc-kr");

//페이징을 위한 변수 선언
int total   = 0;  //전체 게시물 갯수
int maxpage = 0;  //최대 페이지 갯수
int curpage = 0;  //현재 페이지 번호
int startno = 0;  //SQL limit 시작 번호
int startBlock = 0; //페이징 시작 블럭 번호
int endBlock   = 0; //페이징 끝 블럭 번호

//kind=T,CP,CK,L

String kind = request.getParameter("kind");
if(kind == null)kind = "";

//검색 키워드
String key = request.getParameter("key");
if(key == null) key = "";

//(5) "index.jsp?page=1" 에서 넘어온 page를 분석한다.
if( request.getParameter("page") != null)
{
	//넘어온 page 값을 정수형 curpage 로 변환한다. 
	curpage = Integer.parseInt(request.getParameter("page"));
}else
{
	//넘어온 page 값이 없으므로 현재 페이지 번호를 1로 설정한다. 
	curpage = 1;
}

String sql = "";

//(1)게시물의 갯수를 얻는다.
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

//(2)최대 페이지 갯수를 계산한다.
maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//(6) SQL의  limit 시작 번호를 계산한다.
startno = (curpage - 1) * 10;

//게시물 목록을 조회한다.
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
//(7,8) 페이지당 10개씩 가져오도록 limit 를 처리한다.
sql += "limit " + startno + ",10";
dbms.OpenQuery(sql);

//(9)페이징 시작블럭번호와 끝블럭 번호를 계산한다.
startBlock = ( (curpage - 1)  / 10) * 10 + 1;
endBlock   = startBlock + 10 - 1; 
//(10)endBlock 이 최대 페이지 번호보다 크면 안됨.
if( endBlock > maxpage)
{
	//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
	endBlock = maxpage;
}
%>
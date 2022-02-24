<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/pagU.jsp" %>
			<table border="0" style="width:100%;">
				<tr>
					<td style="height:40px" align="left">
						<h3>캠핑용품</h3>
					</td>
				</tr>
				<tr>
					<td style="height:25px; text-align:right;">
						<form name="search" method="get" action="/gyu/board/boardCP.jsp">
							<input type="hidden" name="kind" value="<%= kind %>">
							<input name="key" type="text" size="10" value="<%= key %>">
							<input type="submit" value="검색">
						</form>
						<%
						if( login == null )
						{
							%><a href="javascript:alert('로그인 하세요.');" class="btn sfn">글쓰기</a><%
						}else
						{
							%><a href="/gyu/write.jsp?kind=<%= kind %>" class="btn sfn">글쓰기</a><%
						}
						%>
					</td>
				</tr>						
				<tr>
					<td>
						<table border="0" style="width:100%;">
							<tr>
								<td style="text-align:center; background-color:#f2f2f2; width: 60px;">번호</td>
								<td style="text-align:center; background-color:#f2f2f2;">제목</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 100px;">작성일</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 80px;">작성자</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 70px;">조회수</td>						
							</tr>
<%@ include file="../include/pagD.jsp" %>							
					<tr>
						<td style="text-align:center;">
						<!-- 
						◀ 1 2 3 4 5 6 7 8 9  ▶
						-->
						<%
						//(13) 이전 블럭을 출력한다.
						if( startBlock >= 10 )
						{
							%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>&key=<%= key %>">이전 페이지</a> | <%
						}		
						//(3, 4, 11)최대 페이지 갯수 만큼 페이지를 표시한다.
						for(int pageno = startBlock; pageno <= endBlock; pageno++)
						{
							if(curpage == pageno)
							{
								//현재 페이지와 같은 경우 빨간색으로 표시
								%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= pageno %>&key=<%= key %>" style="color:red"><%= pageno %></a> | <%
							}else
							{
								%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= pageno %>&key=<%= key %>"><%= pageno %></a> | <%
							}
						}	
						//(12) 다음 블럭을 출력한다.
						if( endBlock < maxpage)
						{
							%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= endBlock + 1 %>&key=<%= key %>">다음 페이지</a><%
						}		
						%>
					</td>
				</tr>												
			</table>	
			<br><br><br><br><br><br>
			<table border="0" align="center">
			<!-- 
					<tr>	
						<td>
							<a href="tent.jsp">텐트</a> |
							<a href="compingg.jsp">캠핑도구</a> |
							<a href="cookware.jsp">취사용품</a> |
							<a href="light.jsp">랜턴/램프</a>  
						</td>
					</tr>
			 -->		
					<tr>
						<td align="center">
							<br><br><a href="/gyu/index.jsp">뒤로가기</a>
						</td>
					</tr>
				</table>
		<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
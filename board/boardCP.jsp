<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/pagU.jsp" %>
			<table border="0" style="width:100%;">
				<tr>
					<td style="height:40px" align="left">
						<h3>ķ�ο�ǰ</h3>
					</td>
				</tr>
				<tr>
					<td style="height:25px; text-align:right;">
						<form name="search" method="get" action="/gyu/board/boardCP.jsp">
							<input type="hidden" name="kind" value="<%= kind %>">
							<input name="key" type="text" size="10" value="<%= key %>">
							<input type="submit" value="�˻�">
						</form>
						<%
						if( login == null )
						{
							%><a href="javascript:alert('�α��� �ϼ���.');" class="btn sfn">�۾���</a><%
						}else
						{
							%><a href="/gyu/write.jsp?kind=<%= kind %>" class="btn sfn">�۾���</a><%
						}
						%>
					</td>
				</tr>						
				<tr>
					<td>
						<table border="0" style="width:100%;">
							<tr>
								<td style="text-align:center; background-color:#f2f2f2; width: 60px;">��ȣ</td>
								<td style="text-align:center; background-color:#f2f2f2;">����</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 100px;">�ۼ���</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 80px;">�ۼ���</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 70px;">��ȸ��</td>						
							</tr>
<%@ include file="../include/pagD.jsp" %>							
					<tr>
						<td style="text-align:center;">
						<!-- 
						�� 1 2 3 4 5 6 7 8 9  ��
						-->
						<%
						//(13) ���� ���� ����Ѵ�.
						if( startBlock >= 10 )
						{
							%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>&key=<%= key %>">���� ������</a> | <%
						}		
						//(3, 4, 11)�ִ� ������ ���� ��ŭ �������� ǥ���Ѵ�.
						for(int pageno = startBlock; pageno <= endBlock; pageno++)
						{
							if(curpage == pageno)
							{
								//���� �������� ���� ��� ���������� ǥ��
								%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= pageno %>&key=<%= key %>" style="color:red"><%= pageno %></a> | <%
							}else
							{
								%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= pageno %>&key=<%= key %>"><%= pageno %></a> | <%
							}
						}	
						//(12) ���� ���� ����Ѵ�.
						if( endBlock < maxpage)
						{
							%><a href="/gyu/board/boardCP.jsp?kind=<%= kind %>&page=<%= endBlock + 1 %>&key=<%= key %>">���� ������</a><%
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
							<a href="tent.jsp">��Ʈ</a> |
							<a href="compingg.jsp">ķ�ε���</a> |
							<a href="cookware.jsp">����ǰ</a> |
							<a href="light.jsp">����/����</a>  
						</td>
					</tr>
			 -->		
					<tr>
						<td align="center">
							<br><br><a href="/gyu/index.jsp">�ڷΰ���</a>
						</td>
					</tr>
				</table>
		<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
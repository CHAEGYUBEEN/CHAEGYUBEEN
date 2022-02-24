<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%		
			int seqno = total - ((curpage - 1) * 10);
			key = URLEncoder.encode(key);
			while(dbms.GetNext() == true)
			{
				String bno     = dbms.GetValue("bno");
				String uno     = dbms.GetValue("uno");
				String btitle  = dbms.GetValue("btitle");
				String bkind   = dbms.GetValue("bkind");
				String bwdate  = dbms.GetValue("bwdate");
				String bhit    = dbms.GetValue("bhit");
				String uname   = dbms.GetValue("uname");
				String rflag   = dbms.GetValue("rflag");
				String rpno    = dbms.GetValue("rpno");					
				%>
				<tr>
					<td style="text-align:center;"><%= seqno-- %></td>
					<td><a href="/gyu/view.jsp?no=<%= bno %>&kind=<%= kind %>&page=<%= curpage %>&key=<%= key %>"><%= btitle %> </a>
					<%
					if(!rpno.equals("0"))
					{
						%>
						<span style="color:#ff6600">(<%= rpno %>)</span>
						<%
					}
					%>						
					</td>
					<td style="text-align:center;"><%= bwdate %></td>
					<td style="text-align:center;"><%= uname %></td>
					<td style="text-align:center;"><%= bhit %></td>
				</tr>
				<%
			}
			%>				
		</table>							
	</td>
</tr>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>    
<!-- 컨텐츠 출력부분------------------------------------------ -->
			<table border="0" style="width:100%;">
				<tr>
					<td style="height:40px" align="right">
						<h3>게시판</h3>
					</td>
				</tr>
				<tr>
					<td style="height:25px; text-align:right;">
						<a href="/gyu/write.jsp">글쓰기</a>
					</td>
				</tr>						
				<tr>
					<td>
						<table border="0" style="width:100%;">
							<tr>
								<td style="text-align:center; background-color:#f2f2f2; width: 60px;">번호</td>
								<td style="text-align:center; background-color:#f2f2f2;">제목</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 80px;">작성일</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 80px;">작성자</td>
								<td style="text-align:center; background-color:#f2f2f2;width: 70px;">조회수</td>						
							</tr>
							<tr>
								<td style="text-align:center;">1</td>
								<td><a href="/gyu/view.jsp">취사용품 후기</a> <span style="color:#ff6600">(12)</span></td>
								<td style="text-align:center;">2021.11.10</td>
								<td style="text-align:center;">홍길동</td>
								<td style="text-align:center;">10</td>
							</tr>
							<tr>
								<td style="text-align:center;">2</td>
								<td><a href="/gyu/view.jsp">캠핑용품 후기</a> <span style="color:#ff6600">(12)</span></td>
								<td style="text-align:center;">2021.11.10</td>
								<td style="text-align:center;">홍길동</td>
								<td style="text-align:center;">10</td>
							</tr>
							</table>							
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
					◀ 1 2 3 4 5 6 7 8 9  ▶
					</td>
				</tr>												
			</table>	
			<br><br><br><br><br><br>
			<table border="0" align="center">
					<tr>	
						<td>
							<a href="/gyu/tent.jsp">텐트</a> |
							<a href="/gyu/compingg.jsp">캠핑도구</a> |
							<a href="/gyu/cookware.jsp">취사용품</a> |
							<a href="/gyu/light.jsp">랜턴/램프</a>  
						</td>
					</tr>
					<tr>
						<td align="center">
							<br><br><a href="/gyu/index.jsp">뒤로가기</a>
						</td>
					</tr>
				</table>
		<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
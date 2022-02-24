<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>    
<!-- 컨텐츠 출력부분------------------------------------------ -->
<table border="0" width=40% height=300px align="center">
	<form name="cpA" method="past" action="/gyu/purchase.jsp">
		<tr>
			<td>
				<img src="https://img.funn.co.kr/goods/jnjcorp1/LOCAL/F0001776183_01.jpg"
					 style="margin-left: auto; margin-right: auto; width:90%; height:300px; display: block;"/>
			</td>
		</tr>
		<table border="1" width=40% height=100px align="center">
			<tr>
				<th style="width:100px;">
					상품명
				</th>
				<td>
					삼품명
				</td>
			</tr>
			<tr>
				<th style="width:100px;">
					수량
				</th>
				<td>
					1개
				</td>
			</tr>
			<tr>
				<th style="width:100px;">
					가격
				</th>
				<td>
					10,000원
				</td>
			</tr>
			<tr>
				<th style="width:100px;">
					사이즈
				</th>
				<td>
					<input type="radio" name="tentsize" checked>2인용
					<input type="radio" name="tentsize">4인용
				</td>
			</tr>
			<tr>
				<th colspan="2" style="width:100px;" align="center">
				<input type="submit" value="구매">
				</th>
			</tr>				
		</table>
	</form>
	<br><br>
	<table align="center">
		<tr>
			<td>
				<a href="/gyu/Camping/compingg.jsp">뒤로가기</a>
			</td>
		</tr>
	</table>
	<!-- 컨텐츠 출력부분------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>	
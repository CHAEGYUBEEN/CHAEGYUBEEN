<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>    
<!-- ������ ��ºκ�------------------------------------------ -->
<table border="0" width=40% height=300px align="center">
	<form name="tentC" method="past" action="/gyu/purchase.jsp">
		<tr>
			<td>
				<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMFkf6X6CTxs3WhFKGH3cSRbGhe9TJN41eEA&usqp=CAU"
					 style="margin-left: auto; margin-right: auto; width:90%; height:300px; display: block;"/>
		</td>
	</tr>
	<table border="1" width=40% height=100px align="center">
		<tr>
			<th style="width:100px;">
				��ǰ��
			</th>
			<td>
				��ǰ��
			</td>
		</tr>
		<tr>
			<th style="width:100px;">
				����
			</th>
			<td>
				1��
			</td>
		</tr>
		<tr>
			<th style="width:100px;">
				����
			</th>
			<td>
				10,000��
			</td>
		</tr>
		<tr>
			<th style="width:100px;">
				������
			</th>
			<td>
				<input type="radio" name="tentsize" checked>2�ο�
				<input type="radio" name="tentsize">4�ο�
			</td>
		</tr>
		<tr>
			<th colspan="2" style="width:100px;" align="center">
			<input type="submit" value="����">
			</th>
		</tr>				
	</table>
</form>
<br><br>
<table align="center">
	<tr>
		<td>
			<a href="/gyu/tent/tent.jsp">�ڷΰ���</a>
		</td>
	</tr>
</table>
<!-- ������ ��ºκ�------------------------------------------ -->
<%@ include file="../include/tall.jsp" %>
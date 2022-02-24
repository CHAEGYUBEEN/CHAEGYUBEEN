<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/dbopen.jsp" %>
<%
LoginVO login = (LoginVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>BaenStar</title>
		<link rel="stylesheet" href="/gyu/css/style.css">
		<script src="/gyu/js/board.js"></script>
		 <script src="/gyu/js/jquery-3.6.0.js"></script>
	</head>
	<body>
		<table border="0" style="background-color:#f4f4f4; width:100%; height:60px;">
			<tr>
				<td>
					<a href="/gyu/index.jsp">
					<span style="color:black; font-size:15pt;">BaenStar</span>	
					</a>
				</td>
				<td align="right">
					<%
						if( login == null )
						{
							//�α����� �ȵǾ��� ���..
							%>
							<a href="/gyu/member/login.jsp">�α���</a>
							&nbsp;&nbsp;
							<a href="/gyu/member/join.jsp">ȸ������</a>
							&nbsp;
							<%
						}else
						{
							%>
							[ <%= login.getName() %> ]���� �α��� �Ǿ����ϴ�.
							<a href="/gyu/member/logout.jsp">�α׾ƿ�</a>
							&nbsp;
							<%									
						}
					%>
				</td>
			</tr>
		</table>
	<!-- �������κ�----------------------------------- -->
		<section class="et-hero-tabs">
		<div class="image-box">
			<img src="https://image.koveashop.co.kr/image/image-view?type=THEME&path=2021/12/01&id1=1638319946697"></div>
		    <div class="et-hero-tabs-container">
		      <a class="et-hero-tab" href="#tab-es6">��Ʈ</a>
		      <a class="et-hero-tab" href="#tab-flexbox">ķ�ο�ǰ</a>
		      <a class="et-hero-tab" href="#tab-react">����ǰ</a>
		      <a class="et-hero-tab" href="#tab-other">����/����</a>
		      <a class="et-hero-tab" href="#tab-angular">�Խ���</a>
		      <span class="et-hero-tab-slider"></span>
	    	</div>
  		</section>
		<main class="et-main">
		    <section class="et-slide" id="tab-es6">
		      <a href="/gyu/tent/tent.jsp"><img src="https://image.koveashop.co.kr/image/editor-image-view?id=20200910_538974724fc2ffff5f5e94309a4ca07482959bcbab27c033d65d10f64b9a40a8" style="width:100%;">
		     	 <h1>��Ʈ</h1></a> 
		    </section>
		    <section class="et-slide" id="tab-flexbox">
		      <h1><a href="/gyu/Camping/compingg.jsp"><img src="https://image.koveashop.co.kr/image/editor-image-view?id=20210107_63362970fbded671f84b75eb9fef28f104e513af503b5dd24fed19ae956ee0e5" style="width:100%;">
		     	 ķ�ο�ǰ</a></h1>
		    </section>
		    <section class="et-slide" id="tab-react">
		      <h1><a href="/gyu/cook/cookware.jsp"><img src="https://image.koveashop.co.kr/image/editor-image-view?id=20200910_bf4b7ad1b57b2703370dc0acc07b29efc62d2a6cd1a05c2babb347d0bcda5cb0" style="width:100%;">
		    	  ����ǰ</a></h1>
		    </section>
		    <section class="et-slide" id="tab-other">
		      <h1><a href="/gyu/light/light.jsp"><img src="https://image.koveashop.co.kr/image/image-view?type=THEME&path=2021/11/09&id1=1636416346197" style="width:100%; height:50%">
		     	 ����/����</a></h1>
		    </section>
		    <section class="et-sli" id="tab-angular">
		     <h1>�Խ���</h1>
				<h3><a href="/gyu/board/boardT.jsp?kind=T">��Ʈ</a></h3>
				<h3><a href="/gyu/board/boardCP.jsp?kind=CP">ķ�ο�ǰ</a></h3>
				<h3><a href="/gyu/board/boardCK.jsp?kind=CK">����ǰ</a></h3>
				<h3><a href="/gyu/board/boardL.jsp?kind=L">����/����</a></h3>
		     </section>
		</main>	
	<!-- �������κ�----------------------------------- -->	
	</body>
</html>
<%@ include file="../config/dbclose.jsp" %>  
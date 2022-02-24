<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
 
<script>
	//로그인 아이디 중복 여부 플래그
	//0-ID중복체크안함,1-ID중복안됨,2-아이디중복됨
	var IsDupCheck = 0; 
	
	window.onload = function()
	{
		document.join.uid.focus();
	}
		
	//가입폼 검사
	function FormCheck()
	{
		if( document.join.uid.value == "" )
		{
			alert("아이디를 입력하세요.");
			document.join.uid.focus();
			return false;
		}
		if( document.join.upw.value == "" )
		{
			alert("암호를 입력하세요.");
			document.join.upw.focus();
			return false;
		}	
		if( document.join.upw.value != document.join.upwcheck.value)
		{
			alert("암호가 일치하지 않습니다.");
			document.join.upw.focus();
			return false;			
		}
		if( document.join.uname.value == "" )
		{
			alert("이름을 입력하세요.");
			document.join.uname.focus();
			return false;
		}
		
		if(IsDupCheck == 0)
		{
			alert("아이디 중복 체크를 진행하세요.");
			return false;
		}
		if(IsDupCheck == 2)
		{
			alert("중복된 아이디입니다.");
			return false;
		}		
		
		if( confirm("회원가입을 진행하시겠습니까?") != 1)
		{
			return false;	
		}
		return true;
	}
	
	//취소를 클릭하면 index.jsp 페이지로 이동한다.
	function GoIndex()
	{
		if( confirm("회원가입을 취소하시겠습니까?") != 1)
		{
			return;	
		}		
		document.location = "/gyu/index.jsp";
	}
	
	//아이디 중복 여부를 검사한다.
	function CheckIDDup()
	{
		var userid = document.join.uid.value;
		if(userid == "")
		{
			alert("아이디를 입력하세요.");
			document.join.uid.focus();
			return;
		}
		window.open("/gyu/member/idcheck.jsp?id=" + userid,"_idcheck",
			"width=400,height=400");
	}
	
</script>

<!-- 컨텐츠 출력 되는곳 -------------------------- -->    
<table border="0" style="width:50%;" align="center">
	<form name="join" method="post" action="/gyu/member/joinok.jsp" onsubmit="return FormCheck();">
		<tr>
			<td style="text-align:center;width:120px;" >
				<span><h2>회원가입</h2></span>
			</td>
		</tr>
		<table border="1" style="width:40%;" align="center">
			<tr>
				<th style="width:130px;">아이디 (*)</th>
				<td>
					<input type="text" required name="uid" style="width:70%">
					<input type="button" value="아이디 중복체크" onclick="CheckIDDup();">
				</td>
			</tr>
			<tr>
				<th>비밀번호 (*)</th>
				<td><input type="password" required name="upw"  style="width:99%"></td>
			</tr>
			<tr>
				<th>비밀번호 확인 (*)</th>
				<td><input type="password" required name="upwcheck" style="width:99%"></td>
			</tr>			
			<tr>
				<th>이름 (*)</th>
				<td><input type="text" required name="uname"  style="width:99%"></td>
			</tr>
			<tr>
				<th>성별 (*)</th>
				<td>
					<input type="radio" name="ugender" value="M" checked>남자
					<input type="radio" name="ugender" value="F">여자
				</td>
			</tr>
			<tr>
	         <th>이메일 (*)</th>
	          <td>
	           <input type='text' required name="uemail" style="width:99%;">
	          </td>
	        </tr>
	        <tr>
	          <th>주소 (*)</th>
	          <td>
	            <input type="text" style="width:99%;" required name="uadd">
	          </td>
	        </tr>
	        <tr>
		      <th>핸드폰 번호 (*)</th>
		        <td>
		          <input type="text" required name="ucell" style="width:40%;">
		        </td>
	        </tr>						
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="가입완료">
				<a href="/gyu/index.jsp"><input type="button" value="취소" onclick="GoIndex();"></a>
				</td>							
			</tr>																															
		</table>
	</form>
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/tall.jsp" %>
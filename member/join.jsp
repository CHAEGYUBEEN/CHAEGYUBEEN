<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/head.jsp" %>
 
<script>
	//�α��� ���̵� �ߺ� ���� �÷���
	//0-ID�ߺ�üũ����,1-ID�ߺ��ȵ�,2-���̵��ߺ���
	var IsDupCheck = 0; 
	
	window.onload = function()
	{
		document.join.uid.focus();
	}
		
	//������ �˻�
	function FormCheck()
	{
		if( document.join.uid.value == "" )
		{
			alert("���̵� �Է��ϼ���.");
			document.join.uid.focus();
			return false;
		}
		if( document.join.upw.value == "" )
		{
			alert("��ȣ�� �Է��ϼ���.");
			document.join.upw.focus();
			return false;
		}	
		if( document.join.upw.value != document.join.upwcheck.value)
		{
			alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
			document.join.upw.focus();
			return false;			
		}
		if( document.join.uname.value == "" )
		{
			alert("�̸��� �Է��ϼ���.");
			document.join.uname.focus();
			return false;
		}
		
		if(IsDupCheck == 0)
		{
			alert("���̵� �ߺ� üũ�� �����ϼ���.");
			return false;
		}
		if(IsDupCheck == 2)
		{
			alert("�ߺ��� ���̵��Դϴ�.");
			return false;
		}		
		
		if( confirm("ȸ�������� �����Ͻðڽ��ϱ�?") != 1)
		{
			return false;	
		}
		return true;
	}
	
	//��Ҹ� Ŭ���ϸ� index.jsp �������� �̵��Ѵ�.
	function GoIndex()
	{
		if( confirm("ȸ�������� ����Ͻðڽ��ϱ�?") != 1)
		{
			return;	
		}		
		document.location = "/gyu/index.jsp";
	}
	
	//���̵� �ߺ� ���θ� �˻��Ѵ�.
	function CheckIDDup()
	{
		var userid = document.join.uid.value;
		if(userid == "")
		{
			alert("���̵� �Է��ϼ���.");
			document.join.uid.focus();
			return;
		}
		window.open("/gyu/member/idcheck.jsp?id=" + userid,"_idcheck",
			"width=400,height=400");
	}
	
</script>

<!-- ������ ��� �Ǵ°� -------------------------- -->    
<table border="0" style="width:50%;" align="center">
	<form name="join" method="post" action="/gyu/member/joinok.jsp" onsubmit="return FormCheck();">
		<tr>
			<td style="text-align:center;width:120px;" >
				<span><h2>ȸ������</h2></span>
			</td>
		</tr>
		<table border="1" style="width:40%;" align="center">
			<tr>
				<th style="width:130px;">���̵� (*)</th>
				<td>
					<input type="text" required name="uid" style="width:70%">
					<input type="button" value="���̵� �ߺ�üũ" onclick="CheckIDDup();">
				</td>
			</tr>
			<tr>
				<th>��й�ȣ (*)</th>
				<td><input type="password" required name="upw"  style="width:99%"></td>
			</tr>
			<tr>
				<th>��й�ȣ Ȯ�� (*)</th>
				<td><input type="password" required name="upwcheck" style="width:99%"></td>
			</tr>			
			<tr>
				<th>�̸� (*)</th>
				<td><input type="text" required name="uname"  style="width:99%"></td>
			</tr>
			<tr>
				<th>���� (*)</th>
				<td>
					<input type="radio" name="ugender" value="M" checked>����
					<input type="radio" name="ugender" value="F">����
				</td>
			</tr>
			<tr>
	         <th>�̸��� (*)</th>
	          <td>
	           <input type='text' required name="uemail" style="width:99%;">
	          </td>
	        </tr>
	        <tr>
	          <th>�ּ� (*)</th>
	          <td>
	            <input type="text" style="width:99%;" required name="uadd">
	          </td>
	        </tr>
	        <tr>
		      <th>�ڵ��� ��ȣ (*)</th>
		        <td>
		          <input type="text" required name="ucell" style="width:40%;">
		        </td>
	        </tr>						
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="���ԿϷ�">
				<a href="/gyu/index.jsp"><input type="button" value="���" onclick="GoIndex();"></a>
				</td>							
			</tr>																															
		</table>
	</form>
</table>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/tall.jsp" %>
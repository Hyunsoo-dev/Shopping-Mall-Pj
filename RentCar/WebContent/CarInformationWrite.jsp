<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInformationWrite.jsp</title>
</head>
<body>
<%

/* �����Ϳ��� �� �ۼ� ��ư Ŭ�� �� ��µǴ� ������ �Դϴ�.
 *
 *
 *
 */
 
	String id = (String)session.getAttribute("id");

	if(id == null){
%>		
	<script>
		alert("�α��� �� �̿��ϼ���.")
		lcation.href ="RentcarMain.jsp?center=Login.jsp";
	</script>
<%		
		
	}
		
	
	
%>
	
	<form action="CarInformationWriteProc.jsp" method = "post">
		<table width = "700" border = "1">
			<tr height = "40">
				<td width = "200">�ۼ���</td>
				<td width = "500"><%= id %></td>
			</tr>
			<tr height = "40">
				<td width = "200">�� ��</td>
				<td width = "500"><input type = "text" name = "subject" size = "68"></td>
			</tr>
			<tr>
				<td width = "200">�� ����</td>
				<td width = "500"><textarea rows="20" cols="70" name = "content"></textarea></td>
			</tr>
			<tr height = "40">
				<td colspan = "2">
					<input type = "hidden" name = "id" value = "<%=id %>">
					<input type = "submit" value = "�ۼ�">
					<input type = "reset" value = "���">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>
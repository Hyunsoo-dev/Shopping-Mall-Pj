<%@page import="info.InformationBean"%>
<%@page import="java.util.Vector"%>
<%@page import="info.InformationDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarInfomation.jsp</title>
</head>
<body>
<%

/* �� ����Ʈ �� ������ ������ �Դϴ�.  
 *
 *
 *
 */
 
	String id = (String)session.getAttribute("id");

	if(id == null){
%>		
	<script>
		alert("�α��� �� �̿��ϼ���.")
		lcation.href ="RentcarMain.jsp?center=Lojin.jsp";
	</script>
<%		
		
	}
		
%>

	<table width = "1000">
		<tr height = "40">
			<th>�� ��ȣ</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>����</th>	
		</tr>
<%		
		
		InformationDAO ndao = new InformationDAO();
		Vector<InformationBean> v = ndao.getAllInformation(); 
		
		for(int i = 0; i < v.size(); i++){
			InformationBean nbean = v.get(i);
%>
		<tr height = "40">
			<td><%= nbean.getNum() %></td>
			<td><%= nbean.getReg_date() %></td>
			<td><%= nbean.getId() %></td>
			
			<td>
				<a href="RentcarMain.jsp?center=CarInformationInfo.jsp?num=<%= nbean.getNum() %>" style = "text-decoration : none; color : powderblue;">
					<%= nbean.getSubject() %>
				</a>
			</td>	
			
			
		</tr>		
<%
		}
%>		
		<!--  �۾��� ��ư �κ� -->
		<tr height = "40">
			
			<td colspan = "4" align = "right">
			<button  onclick ="location.href='RentcarMain.jsp?center=CarInformationWrite.jsp'">�۾���</button>
			</td>
		</tr>
	</table>
</body>
</html>
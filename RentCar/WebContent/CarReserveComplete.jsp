<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveComplete.jsp</title>
</head>
<body>


<jsp:useBean id = "rbean" class = "db.CarReserveBean">
	<jsp:setProperty name = "rbean" property = "*" />
</jsp:useBean>


<%
	request.setCharacterEncoding("euc-kr");

	String id = (String)session.getAttribute("id");	
	if(id==null){
%>		

		<script>
			alert("�α��� �� ������ �����մϴ�.");
			location.href = "RentcarMain.jsp?center=Login.jsp";
		</script>
<%
		
	}else{
		
		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//getRentDate() �� ���� String Ÿ�� �����͸� �̿��Ͽ� date ��ü ����
		d1 = sdf.parse(rbean.getRentDate());//�뿩 ��¥ 
		d2 = sdf.parse(sdf.format(d2));//Date �� "yyyy-MM-dd" ���·� ��������.
		
		int compare = d1.compareTo(d2);//d1�� ������ -1, d2�� ������ 1��ȯ
		if(compare == -1){
			
%>			

			<script>
				alert("���� �ý��� ��¥���� ���� ��¥�� ������ �� ����.");
				history.go(-1);
			</script>
			
<%
		}
	}
%>


</body>
</html>
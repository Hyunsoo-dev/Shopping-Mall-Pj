<%@page import="db.CarReserveBean"%>
<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CarReserveComplete.jsp</title>

<style>
	table{
		text-align : center;
		
		height : 80%;
		margin : auto;
	}
</style>
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
		
	}
		
		Date d1 = new Date();
		Date d2 = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//parse method --> getRentDate() �� ���� String Ÿ�� �����͸� �̿��Ͽ� date ��ü ����
		d1 = sdf.parse(rbean.getRentDate());//�뿩 ��¥ 
		d2 = sdf.parse(sdf.format(d2));//format method --> Date �� "yyyy-MM-dd" ���·� ��������.
		
		int compare = d1.compareTo(d2);//d1�� ������ -1, d2�� ������ 1��ȯ
		if(compare == -1){
			
%>			

			<script>
				alert("���� �ý��� ��¥���� ���� ��¥�� ������ �� ����.");
				history.go(-1);
			</script>
			
<%
		}
		
		//��������� �ƹ� ������ ���ٸ� ������ ���� �� ��� ������ �����ֱ�
		//���̵� ���� ��Ŭ������ ���⿡ 
		rbean.setId(id);
		
		RentcarDAO rdao = new RentcarDAO();
		rdao.setReserve(rbean); 
		
		
		
		CarListBean bean = rdao.getOneCar(rbean.getNo());
		String img = bean.getImg();
		
		
		//���� �� ����ݾ� 
		int totalReservePrice = 0;
		totalReservePrice = bean.getPrice() * rbean.getQuantity();
		
		/* �ɼ� ������ �����Ѵٸ� �����ͺ��̽��� "1" ���� ���Ƿ� "1"�� ��
		10000 ���� ���� ������ ������ش�. */
		
		
		int insurance = 0;
		if(rbean.getInsurance() == 1) insurance = 10000;
		
		
		int Navigation = 0; 
		if(rbean.getNavigation() == 1) Navigation = 10000;
		
		int BabySheet = 0;
		if(rbean.getBabySheet() == 1) BabySheet = 10000;
		
		//���� �ɼ� �� �ݾ� 
		int totalOptionPrice = 0;
		totalOptionPrice = rbean.getRentDuration() * rbean.getQuantity() * (insurance + Navigation + BabySheet);
		
		//���� �� �ݾ� 
		int totalPrice = totalReservePrice + totalOptionPrice;
%>
<table width = "1000">
	<tr height = "30">
		<td colspan = "2"> ���� ���� �Ϸ� ȭ�� </td>
	</tr>
	<tr height = "200">
		<td colspan = "2"><img src = "img/<%=img %>" width = "600" height = "400"></td>
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">���� �� ���� �ݾ� :&nbsp;&nbsp; </td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalReservePrice %></td>
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">���� �� �ɼ� �ݾ� :&nbsp;&nbsp;</td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalOptionPrice %></td>
		
	</tr>
	<tr height = "30">
		<td width = "500" align = "right">���� �� �ݾ� :&nbsp;&nbsp;</td>
		<td width = "500" align = "left"> &nbsp;&nbsp;<%= totalPrice %></td>
		
	</tr>
</table>


</body>
</html>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerPro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="memberDTO" class="rentcar.dto.MemberDTO">
		<jsp:setProperty name="memberDTO" property="*" />
	</jsp:useBean>
	
	<% 
		RentcarDAO.getInstance().joinMember(memberDTO);
	%>
		
	<script>
		alert("회원가입 되었습니다.");
		location.href = "login.jsp";
	</script>

</body>
</html>
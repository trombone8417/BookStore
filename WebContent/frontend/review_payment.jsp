<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Checkout - Online Book Store</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <jsp:directive.include file="header.jsp" />
        <div align="center">
        	<h3><i>Please carefully review the following information before making payment</i></h3>
			<h2>Payer Information</h2>
			<table>
				<tr>
					<td><b>First Name:</b></td>
					<td>${payer.firstName}</td>
				</tr>
				<tr>
					<td><b>Last Name:</b></td>
					<td>${payer.lastName}</td>
				</tr>
				<tr>
					<td><b>E-mail:</b></td>
					<td>${payer.email}</td>
				</tr>
			</table>
			<h2>Recipient Information</h2>
			<table>
				<tr>
					<td><b>Recipient Name:</b></td>
					<td>${recipient.recipientName}</td>
				</tr>
				<tr>
					<td><b>Address Line 1:</b></td>
					<td>${recipient.line1}</td>
				</tr>
				<tr>
					<td><b>Address Line 2:</b></td>
					<td>${recipient.line2}</td>
				</tr>
				<tr>
					<td><b>City:</b></td>
					<td>${recipient.city}</td>
				</tr>
				<tr>
					<td><b>State:</b></td>
					<td>${recipient.state}</td>
				</tr>
				<tr>
					<td><b>Country Code:</b></td>
					<td>${recipient.countryCode}</td>
				</tr>
				<tr>
					<td><b>Postal Code:</b></td>
					<td>${recipient.postalCode}</td>
				</tr>
			</table>
		</div>
</body>
</html>
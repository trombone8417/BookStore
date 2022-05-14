<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Payment Receipt - Online Book Store</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <jsp:directive.include file="header.jsp" />
        <div align="center">
			<h2>You have made payment successfully. Thank you for purchasing!</h2>
        	<h3>Your Payment Receipt</h3>
			<h2>Seller Information</h2>
			<table>
				<tr>
					<td><b>E-mail:</b></td>
					<td>sales@evergreenbooks.com</td>
				</tr>
				<tr>
					<td><b>Phone:</b></td>
					<td>+1 123 456 789</td>
				</tr>
			</table>
			<h2>Buyer Information:</h2>
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
			<h2>Order Details</h2>
			<table>
				<tr>
					<td><b>Order ID:</b></td>
					<td>${orderId}</td>
				</tr>
				<tr>
					<td><b>Ordered by:</b></td>
					<td>${loggedCustomer.fullname}</td>
				</tr>
				<tr>
					<td><b>Transaction Description:</b></td>
					<td>${transaction.description}</td>
				</tr>
				<tr>
					<td colspan="2"><b>Items:</b></td>
				</tr>
				<tr>
				<td colspan="2">
					<table border="1">
						<tr>
							<th>No.</th>
							<th>Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
						</tr>
						<c:forEach items="${transaction.itemList.items}" var="item" varStatus="var">
						<tr>
							<td>${var.index + 1}</td>
							<td>${item.name}</td>
							<td>${item.quantity}</td>
							<td><fmt:formatNumber value="${item.price}" type="currency" /></td>
							<td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" /></td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">
								<p>Subtotal: <fmt:formatNumber value="${transaction.amount.details.subtotal}" type="currency" /></p>
								<p>Tax: <fmt:formatNumber value="${transaction.amount.details.tax}" type="currency" /></p>
								<p>Shipping Fee: <fmt:formatNumber value="${transaction.amount.details.shipping}" type="currency" /></p>
								<p>TOTAL: <fmt:formatNumber value="${transaction.amount.total}" type="currency" /></p>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
		</div>
</body>
</html>








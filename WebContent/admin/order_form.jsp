<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Edit Details - Evergreen Bookstore Administration </title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    <div align="center">
        <h2 class="pageheading">Edit Order ID: ${order.orderId}</h2>
    </div>

	<c:if test="${message != null}">
	<div align="center">
		<h4 class="message"><i>${message}</i></h4>
	</div>
	</c:if>

	<form action="update_order" method="post" id="orderForm">
    <div align="center">
      <h2>Order Overview:</h2>
      <table>
      	<tr>
      		<td><b>Ordered By: </b></td>
      		<td>${order.customer.fullname}</td>
      	</tr>
      	<tr>
      		<td><b>Order Date: </b></td>
      		<td>${order.orderDate}</td>
      	</tr>
      	<tr>
      		<td><b>Recipient Name: </b></td>
      		<td><input type="text" name="recipientName" value="${order.recipientName}" size="45" /></td>
      	</tr>
      	<tr>
      		<td><b>Recipient Phone: </b></td>
      		<td><input type="text" name="recipientPhone" value="${order.recipientPhone}" size="45" /></td>
      	</tr>
      	<tr>
      		<td><b>Ship To: </b></td>
      		<td><input type="text" name="shippingAddress" value="${order.shippingAddress}" size="45" /></td>
      	</tr>
      	<tr>
      		<td><b>Payment Method: </b></td>
      		<td>
      			<select name="paymentMethod">
      				<option value="Cash On Delivery">Cash On Delivery</option>
      			</select>
      		</td>
      	</tr>
      	<tr>
      		<td><b>Order Status: </b></td>
      		<td>
      			<select name="orderStatus">
      				<option value="Processing">Processing</option>
      				<option value="Shipping">Shipping</option>
      				<option value="Delivered">Delivered</option>
      				<option value="Completed">Completed</option>
      				<option value="Cancelled">Cancelled</option>
      			</select>
     		</td>
      	</tr>
      </table>
    </div>
	<div align="center">
		<h2>Ordered Books</h2>
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Book Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</th>
				<th></th>
			</tr>
			<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${orderDetail.book.title}</td>
					<td>${orderDetail.book.author}</td>
					<td><fmt:formatNumber value="${orderDetail.book.price}" type="currency" /></td>
					<td>
						<input type="text" name="quantity" value="${orderDetail.quantity}" size="5" />
					</td>
					<td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency" /></td>
					<td><a href="">Remove</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>
				<td>
					<b><fmt:formatNumber value="${order.total}" type="currency" /></b>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
	<div align="center">
		<br/>
		<a href="javascript:showAddBookPopup()">Add Books</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Save" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Cancel" />
	</div>
	</form>
    <jsp:directive.include file="footer.jsp" />
</body>
</html>

<script>

	function showAddBookPopup(){
		var width = 600;
		var height = 250;
		var left = (screen.width - width) / 2;
		var top = (screen.height - height) / 2;
		window.open('add_book_form', '_blank', 
				'width=' + width + ', height=' + height +', top='+ top +', left=' + left);
	}

</script>



<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Your Shopping Cart</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    </head>

    <body>
        <jsp:directive.include file="header.jsp" />
        <div align="center">
            <h2>Your Cart Details</h2>
            
           	<c:if test="${message != null}">
			<div align="center">
				<h4 class="message"><i>${message}</i></h4>
			</div>
			</c:if>
			
			<c:set var="cart" value="${sessionScope['cart']}" />
			
			<c:if test="${cart.totalItems == 0}">
				<h2>There's no items in your cart</h2>
			</c:if>
			
			<c:if test="${cart.totalItems > 0}">
				<div>
					<form>
						<table border="1">
							<tr>
								<th>No</th>
								<th colspan="2">Book</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Subtotal</th>
								<th>
									<a href=""><b>Clear Cart</b></a>
								</th>
							</tr>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>
									<img class="book-small"
	                                	src="data:image/jpg;base64,${item.key.base64Image}">
								</td>
								<td>
									<span id="book-title">${item.key.title}</span>
								</td>
								<td>${item.value}</td>
								<td><fmt:formatNumber value="${item.key.price}" type="currency" /></td>
								<td><fmt:formatNumber value="${item.value * item.key.price}" type="currency" /></td>
								<td><a href="remove_from_cart?book_id=${item.key.bookId}">Remove</a></td>
							</tr>
							</c:forEach>
							
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><b>${cart.totalQuantity} book(s)</b></td>
								<td>Total:</td>
								<td colspan="2"><b><fmt:formatNumber value="${cart.totalAmount}" type="currency" /></b></td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>
			
        </div>
        
        <jsp:directive.include file="footer.jsp" />
    </body>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginForm").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: "required"
                },

                messages: {
                    email: {
                        required: "Please enter email",
                        email: "Please enter an valid email address"
                    },
                    password: "Please enter password"
                }
            })
        })
    </script>

    </html>
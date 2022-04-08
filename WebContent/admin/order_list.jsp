<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Manage Orders - Evergreen Bookstore Administration </title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    <div align="center">
        <h2 class="pageheading">Book Orders Management</h2>
    </div>

	<c:if test="${message != null}">
	<div align="center">
		<h4 class="message"><i>${message}</i></h4>
	</div>
	</c:if>

    <div align="center">
       <table border="1" cellpadding="5">
            <tr>
                <th>Index</th>
                <th>Order ID</th>
                <th>Ordered By</th>
                <th>Book Copies</th>
                <th>Total</th>
                <th>Payment method</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="order" items="${listOrder}" varStatus="status">
            <tr>
	            <td>${status.index + 1}</td>
	            <td>${order.orderId}</td>
	            <td>${order.customer.fullname}</td>
	            <td>${order.bookCopies}</td>
	            <td><fmt:formatNumber value="${order.total}" type="currency" /></td>
	            <td>${order.paymentMethod}</td>
	            <td>${order.status}</td>
	            <td>${order.orderDate}</td>
	            <td>
	            	<a href="edit_review?id=${review.reviewId}">Details</a> &nbsp;
	            	<a href="edit_review?id=${review.reviewId}">Edit</a> &nbsp;
	            	<a href="javascript:void(0);" class="deleteLink" id="${review.reviewId}">Delete</a>
	            </td>
            </tr>
            </c:forEach>
       </table>
    </div>

    <jsp:directive.include file="footer.jsp" />
</body>
</html>

<script>
$(document).ready(function(){
	$(".deleteLink").each(function(){
		$(this).on("click", function(){
			reviewId = $(this).attr("id");
			if (confirm('Are You sure you want to delete the review with ID ' + reviewId + ' ?')){
				window.location = 'delete_review?id=' + reviewId;
			}
		})
	})
})

</script>


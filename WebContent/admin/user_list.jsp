<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Manage Users - Evergreen Bookstore Administration </title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    <div align="center">
        <h2 class="pageheading">Users Management</h2>
        <h3><a href="user_form.jsp">Create new User</a></h3>
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
                <th>ID</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUsers}" varStatus="status">
            <tr>
	            <td>${status.index + 1}</td>
	            <td>${user.userId}</td>
	            <td>${user.email}</td>
	            <td>${user.fullName}</td>
	            <td>
	            	<a href="edit_user?id=${user.userId}">Edit</a> &nbsp;
	            	<a href="javascript:confirmDelete(${user.userId})">Delete</a>
	            </td>
            </tr>
            </c:forEach>
       </table>
    </div>

    <jsp:directive.include file="footer.jsp" />
</body>
</html>

<script>

	function confirmDelete(userId) {
		if (confirm('Are You sure you want to delete the user with ID ' + userId + ' ?')){
			window.location = 'delete_user?id=' + userId;
		}
	}

</script>



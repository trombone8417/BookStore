<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Create New User</title>
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    
    <div align="center">
        <h2>
        	<c:if test="${user != null}">
        		Edit User
        	</c:if>
        	<c:if test="${user == null}">
        		Create New User
        	</c:if>
        </h2>
    </div>

    <div align="center">
    <form action="create_user" method="post" onsubmit="return validateFormInput()">
        <table>
        	<tr>
        		<td align="right">Email:</td>
        		<td align="left"><input type="text" id="email" name="email" size="20" value="${user.email}" /></td>
        	</tr>
        	<tr>
        		<td align="right">Full name:</td>
        		<td align="left"><input type="text" id="fullname" name="fullname" size="20" value="${user.fullName}" /></td>
        	</tr>
        	<tr>
        		<td align="right">Password:</td>
        		<td align="left"><input type="password" id="password" name="password" size="20" value="${user.password}" /></td>
        	</tr>
        	<tr>
        		<td>&nbsp;</td>
        	</tr>
        	<tr>
        		<td colspan="2" align="center">
        			<input type="submit" value="Save" />
        			<input type="button" value="Cancel" onclick="javascript:history.go(-1)" />
        		</td>
        	</tr>
        </table>
    </div>
	</form>
    <jsp:directive.include file="footer.jsp" />
</body>

<script type="text/javascript">
	function validateFormInput() {
		var fieldEmail = document.getElementById("email");
		var fieldFullName = document.getElementById("fullname");
		var fieldPassword = document.getElementById("password");

		if (fieldEmail.value.length == 0) {
			alert("Email is required!");
			fieldEmail.focus();
			return false;
		}
		
		if (fieldFullName.value.length == 0) {
			alert("Full name is required!");
			fieldFullName.focus();
			return false;
		}
		
		if (fieldPassword.value.length == 0) {
			alert("Password is required!");
			fieldPassword.focus();
			return false;
		}

		return true;
	}
</script>

</html>




<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Login</title>
</head>
<body>
	<jsp:directive.include file="header.jsp" />

    <div align="center">
        <h2>Please login:</h2>
        <form>
        	Email: <input type="text" size="10"><br/>
            Password: <input type="password" size="10">
            <input type="submit" value="Login">
        </form>
    </div>
    
	<jsp:directive.include file="footer.jsp" />
</body>
</html>
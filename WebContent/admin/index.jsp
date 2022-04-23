<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Evergreen Bookstore Administration </title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <jsp:directive.include file="header.jsp" />
    <div align="center">
        <h2 class="pageheading">Administrative Dashboard</h2>
    </div>

    <div align="center">
        <hr width="60%" />
        <h2 class="pageheading">Quick Actions:</h2>
        <b>
            <a href="new_book">New Book</a> &nbsp;
            <a href="user_form.jsp">New User</a> &nbsp;
            <a href="category_form.jsp">New Category</a> &nbsp;
            <a href="customer_form.jsp">New Customer</a>
        </b>
    </div>

    <div align="center">
        <hr width="60%" />
        <h2 class="pageheading">Recent Sales:</h2>
    </div>

    <div align="center">
        <hr width="60%" />
        <h2 class="pageheading">Recent Reviews:</h2>
    </div>

    <div align="center">
        <hr width="60%" />
        <h2 class="pageheading">Statistics:</h2>
        <hr width="60%" />
    </div>

    <jsp:directive.include file="footer.jsp" />
</body>
</html>
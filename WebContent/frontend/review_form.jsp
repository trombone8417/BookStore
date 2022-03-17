<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Write a Review - Online Book Store</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    </head>

    <body>
        <jsp:directive.include file="header.jsp" />
        <div align="center">
            <form>
                <table class="normal">
	                <tr>
	                    <td><h2>Your Reviews</h2></td>
	                    <td><h2>${loggedCustomer.fullname}</h2></td>
	                </tr>
                </table>
            </form>
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
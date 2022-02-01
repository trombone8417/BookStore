<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Admin Login</title>
        <link rel="stylesheet" href="../css/style.css">
        <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    </head>

    <body>
        <div align="center">
            <h1>Book Store Administration</h1>
            <h2>Admin Login</h2>

            <form id="loginForm" action="login" method="post">
                <table>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" id="email" size="20"></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <input type="password" name="password" id="password" size="20 "></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit">Login</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
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
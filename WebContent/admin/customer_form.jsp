<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
            <title>Create New Customer</title>
            <link rel="stylesheet" href="../css/style.css">
            <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
            <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
        </head>

        <body>
            <jsp:directive.include file="header.jsp" />

            <div align="center">
                <h2 class="pageheading">
                    <c:if test="${customer != null}">
                        Edit Customer
                    </c:if>
                    <c:if test="${customer == null}">
                        Create New Customer
                    </c:if>
                </h2>
            </div>

            <div align="center">
                <c:if test="${customer != null}">
                    <form action="update_customer" method="post" id="customerForm">
                        <input type="hidden" name="customerId" value="${customer.customerId}" />
                </c:if>
                <c:if test="${customer == null}">
                    <form action="create_customer" method="post" id="customerForm">
                </c:if>

                <table class="form">
                    <tr>
                        <td align="right">E-mail:</td>
                        <td align="left"><input type="text" id="email" name="email" size="45" value="${customer.email}" /></td>
                    </tr>
                    <tr>
                        <td align="right">First Name:</td>
                        <td align="left"><input type="text" id="firstname" name="firstname" size="45" value="${customer.firstname}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Last Name:</td>
                        <td align="left"><input type="text" id="lastname" name="lastname" size="45" value="${customer.lastname}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Password:</td>
                        <td align="left"><input type="password" id="password" name="password" size="45" value="${customer.password}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Confirm Password:</td>
                        <td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="45" value="${customer.password}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Phone Number:</td>
                        <td align="left"><input type="text" id="phone" name="phone" size="45" value="${customer.phone}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Address Line 1:</td>
                        <td align="left"><input type="text" id="address1" name="address1" size="45" value="${customer.addressLine1}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Address Line 2:</td>
                        <td align="left"><input type="text" id="address2" name="address2" size="45" value="${customer.addressLine2}" /></td>
                    </tr>
                    <tr>
                        <td align="right">City:</td>
                        <td align="left"><input type="text" id="city" name="city" size="45" value="${customer.city}" /></td>
                    </tr>
                    <tr>
                        <td align="right">State:</td>
                        <td align="left"><input type="text" id="state" name="state" size="45" value="${customer.state}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Zip Code:</td>
                        <td align="left"><input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}" /></td>
                    </tr>
                    <tr>
                        <td align="right">Country:</td>
                        <td align="left">
                        	<select name="country" id="country">
                        		<c:forEach items="${mapCountries}" var="country">
                        			<option value="${country.value}">${country.key}</option>
                        		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
                            <button id="buttonCancel">Cancel</button>
                        </td>
                    </tr>
                </table>
                </form>
            </div>
            <jsp:directive.include file="footer.jsp" />
        </body>

        <script type="text/javascript">
            $(document).ready(function() {

                $("#customerForm").validate({
                    rules: {
                        email: {
                        	required: true,
                        	email: true
                        },
                        firstname: "required",
                        lastname: "required",
                        password: "required",
                        confirmPassword: {
                        	required: true,
                        	equalTo: '#password'
                        },
                        phone: "required",
                        address1: "required",
                        address2: "required",
                        city: "required",
                        state: "required",
                        zipCode: "required",
                        country: "required"
                    },

                    messages: {
                    	email: {
                        	required: "Please enter e-mail address",
                        	email: "Please enter a valid e-mail address"
                        },
                        firstname: "Please enter first name",
                        lastname: "Please enter last name",
                        password: "Please enter password",
                        confirmPassword: {
                        	required: "Please enter confirm password",
                        	equalTo: "Confirm password does not match password"
                        },
                        phone: "Please enter phone",
                        address1: "Please enter address line 1",
                        address2: "Please enter address line 2",
                        city: "Please enter city",
                        state: "Please enter state",
                        zipCode: "Please enter zip code",
                        country: "Please enter country"
                    }
                })

                $("#buttonCancel").click(function() {
                    history.go(-1);
                })
            })

        </script>

        </html>
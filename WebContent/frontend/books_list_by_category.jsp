<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
            <title>Books in ${category.name} - Online Books Store</title>
            <link rel="stylesheet" href="css/style.css">
        </head>

        <body>
            <jsp:directive.include file="header.jsp" />

            <div align="center">
                <h2>${category.name}</h2>
            </div>

            <div align="center" style="width: 80%; margin: 0 auto;">
                <c:forEach items="${listBooks}" var="book">
                    <div style="float: left; display: inline block; margin: 20px">
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <img src="data:image/jpg;base64,${book.base64Image}" width="128" height="164">
                            </a>
                        </div>
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <b>${book.title}</b>
                            </a>
                        </div>
                        <div>Rating *****</div>
                        <div><i>by ${book.author}</i></div>
                        <div><b>$${book.price}</b></div>
                    </div>
                </c:forEach>
            </div>

            <jsp:directive.include file="footer.jsp" />
        </body>

        </html>
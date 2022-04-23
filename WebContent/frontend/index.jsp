<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=BIG5">
        <title>Everygreen Books</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <jsp:directive.include file="header.jsp" />

        <div class="center">
            <div class="book">
            <h2>New Books:</h2>
                <c:forEach items="${listNewBooks}" var="book">
                    <div style="float: left; display: inline block; margin: 20px">
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <img class="book-small" 
                                	src="data:image/jpg;base64,${book.base64Image}">
                            </a>
                        </div>
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <b>${book.title}</b>
                            </a>
                        </div>
                        <div>
                        	<jsp:directive.include file="book_rating.jsp" />
                        </div>
                        <div><i>by ${book.author}</i></div>
                        <div><b>$${book.price}</b></div>
                    </div>
                </c:forEach>
            </div>
            <div class="next-row">
            	<h2>Best-Selling Books:</h2>
            	<c:forEach items="${listBestSellingBooks}" var="book">
                    <div style="float: left; display: inline block; margin: 20px">
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <img class="book-small" 
                                	src="data:image/jpg;base64,${book.base64Image}">
                            </a>
                        </div>
                        <div>
                            <a href="view_book?id=${book.bookId}">
                                <b>${book.title}</b>
                            </a>
                        </div>
                        <div>
                        	<jsp:directive.include file="book_rating.jsp" />
                        </div>
                        <div><i>by ${book.author}</i></div>
                        <div><b>$${book.price}</b></div>
                    </div>
                </c:forEach>
            </div>
            <div class="next-row">
            	<h2>Most-favored Books:</h2>
            </div>
            <br/><br/>
        </div>

        <jsp:directive.include file="footer.jsp" />
    </body>

    </html>
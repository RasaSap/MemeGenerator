<%-- 
    Document   : memes
    Created on : Nov 9, 2019, 11:34:00 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Memes</title>
        <style>
            body,
            body * {
                margin: 0;
                padding: 0;
                vertical-align: top;
                box-sizing: border-box;
            }

            body{
                font-family: Verdana, Geneva, Tahoma, sans-serif;
            }
            .content-background{
                min-height: 100vh;
                background-color: #90ACD1;
            }
            .content {
                display: inline-block;
                width: 1100px;
                margin: 40px calc((100% - 1100px) / 2) 20px;
                text-align: center;    
            }
            .content > .item {        
                display: inline-block; 
                margin-right: 30px;
                margin-bottom: 30px;
            }
            @media ( max-width: 750px ) {
                .content {
                    width:100%;
                    margin: 20px 20px;
                    padding: 0 20px;
                }
                .content > .item {        

                    display: inline-block;
                    margin-right: 20px;
                    margin-bottom: 20px;
                } 
            }
            @media ( max-width: 480px ) {
                .content {
                    width: 50%;
                    margin-top: 40px;
                }
            } 
        </style>
    </head>
    <body>
        <div class="content-background">
            <div class="content">
                <c:forEach var="meme" items="${memeList}">
                    <div class="item">
                        <div><img width="250" height="150" src="data:image/jpg;base64, ${meme.getEncodedMeme()} " /></div>                                
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>

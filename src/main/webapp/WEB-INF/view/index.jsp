<%-- 
    Document   : index
    Created on : Nov 9, 2019, 6:13:10 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
       <!-- <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet"> -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meme Generator</title>
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
                width: 1000px;
                margin: 40px calc((100% - 1000px) / 2) 20px;
                text-align: center;    
            }
            .content h2{

                margin: 40px 0 20px;
                font-size: 30px; 
                line-height: 40px;    
            }
            .content > .item {        
                display: inline-block; 
                margin-right: 30px;
                margin-bottom: 30px;
            }
            @media ( max-width: 750px ) {
                .content {
                    width: 100%;
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
                <h2>Meme Generator</h2>      
                <c:forEach var="photo" items="${list}">
                    <div class="item">                        
                        <button >
                            <a  href="edit?id=${photo.id}"><img width="250" height="150" src="data:image/jpg;base64, ${photo.getEncodedPhoto()} " /></a>
                        </button>                          
                    </div>
                </c:forEach>         
            </div>
        </div>
    </body>
</html>

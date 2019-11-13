<%-- 
    Document   : showMeme
    Created on : Nov 9, 2019, 7:28:30 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .content > .item{
                width: 100%;
                margin-bottom: 30px;
            }
            .btn{

                display: inline-block;
                padding: 10px 30px;
                background-color: #EA1E63;
                color:#FFF;
                box-shadow: -1px 2px 4px rgba(0,0,0,0.3);
                border-radius: 4px;
                text-decoration: none;
            }
            .btn:hover{
                background-color: #ad0e44;
                cursor: pointer;
            }
            @media ( max-width: 640px ) {
                .content {
                    width: 100%;
                    margin: 40px 0 20px;
                    padding: 0 20px;
                }
            }
            @media ( max-width: 480px ) {
                .content {
                    margin-left: 10px;
                    margin-top: 40px;
                }
            }
        </style>
    </head>
    <body>
        <div class="content-background">
            <div class="content">
                <h2>Your Meme</h2>
                <div class="item">
                    <img width="250" height="150" src="data:image/jpg;base64, ${meme.getEncodedMeme()} " />
                </div>
                <a class="btn" href="memes" role="button" >All Memes</a>
            </div>
        </div>
    </body>            
</html>

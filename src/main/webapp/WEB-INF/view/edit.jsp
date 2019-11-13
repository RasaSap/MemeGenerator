<%-- 
    Document   : edit
    Created on : Nov 9, 2019, 6:38:26 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meme form</title>
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
            .form{
                margin:30px 0 30px 0; 
            }
            .photo{
                margin:30px 0 30px 0; 
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
                button{
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="content-background">
            <div class="content">    
                <form method="POST" action="save">  
                    <input type="hidden" name="id" value="${photo.id}">

                    <div class="photo"><img width="250" height="150" src="data:image/jpg;base64, ${photo.getEncodedPhoto()} " /></div>
                    <div class="form">

                        <label for="topText" > Top Text</label><br>
                        <input name ="topText" value=""><br>

                        <label for="botText" > Bottom Text</label><br>
                        <input name ="botText" value=""><br>
                    </div>

                    <button><input class="btn" type="submit" value="Make Meme"></button>

                    <a class="btn" href="./" role="button" >Back</a>
                </form>
            </div>
        </div>        
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta http-equiv="Pragma" content="no-cache">
</head>
<style>
@import url("https://fonts.googleapis.com/css?family=VT323");
    body {
    	width:100%;
    	height:100%;
        background-image: url("./frontend_pict/change_password.jpg");
        background-size: 100%;
        text-align: center;
        justify-content: center;
        overflow: hidden;
        background-repeat:no-repeat;
    }


    .msg {
        list-style: none;
        transition: 0.5s;
        margin: 55px 0 0 10px;
    }

    .msg p {
        left: 15%;
        font-family: "Comic Sans MS";
        position: relative;
        font-weight: bold;
        font-size: 100px;
        color: transparent;
    }

    .msg p::before {
        content: attr(data-text);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        -webkit-text-stroke: 1px #eee;
        transition: 0.5s;
        pointer-events: none;
    }

    .msg p:hover::before {
        transform: translateX(500px);
        opacity: 0;
    }

    .msg p::after {
        content: attr(data-text);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        transition: 0.5s;
        transform: translateX(-500px);
        pointer-events: none;
        opacity: 0;
        color: #ffca08;
        -webkit-text-stroke: 5px #3568ac;
        text-shadow: -7px 7px 10px #264b7a,
            -7px 0px #264b7a,
            -7px 3px#264b7a;
        ;
    }

    .msg p:hover::after {
        transform: translateX(0);
        opacity: 1;
    }

    .name {
        width: 100%;
        height: 100%;
        border-radius: 20px;
        background: white;
        border: white;
        padding: 0 10px;
        color: #a485c1;
    }

    .name:focus {
        transition: 0.3s;
        box-shadow: 0 0 50px #f3e7fd;
    }

    .passwd {
        width: 100%;
        height: 100%;
        border-radius: 20px;
        background: white;
        border: white;
        padding: 0 10px;
        color: #94c16c;
    }

    .passwd:focus {
        transition: 0.3s;
        box-shadow: 0 0 50px #e8ffd5;
    }

    input {
        padding: 0 10px;
        font-size: 20px;
        font-weight: bold;
        outline: none;
    }

    .cpasswd {
        width: 100%;
        height: 100%;
        border-radius: 20px;
        background: white;
        border: white;
        padding: 0 10px;
        color: #ebb842;
    }


    .cpasswd:focus {
        transition: 0.3s;
        box-shadow: 0 0 50px #f8ecce;
    }

    .inputName {
        position: absolute;
        top: 53%;
        left: 7.5%;
        width: 12%;
        height: 40px;
        padding: 4px;
        border-radius: 25px;
        background-image: -webkit-linear-gradient(right, #f3e7fd, #a485c1);
    }

    .inputPass {
        position: absolute;
        top: 61%;
        left: 7.5%;
        width: 12%;
        height: 40px;
        padding: 4px;
        border-radius: 25px;
        background-image: -webkit-linear-gradient(right, #94c16c, #e8ffd5);
    }

    .inputCpass {
        position: absolute;
        top: 70%;
        left: 7.5%;
        width: 12%;
        height: 40px;
        padding: 4px;
        border-radius: 25px;
        background-image: -webkit-linear-gradient(right, #f8ecce, #ebb842);
    }

    ::placeholder {
        color: rgba(48, 47, 47, 0.5)
    }

    input[type="submit"] {
        box-sizing: border-box;
        height: 40px;
        width: 180px;
        position: absolute;
        top: 79%;
        left: 8%;
        border: 2px #bee1ff solid;
        background-image: url("./frontend_pict/sky.png");
        cursor: pointer;
        color: white;
        border-radius: 20px;
        box-shadow: 0 0 10px #80c2ff,
                    0 0 5px #a2d0ff;
    }

    .container {
        position: absolute;
        top: 49%;
        left: 4%;
        width: 300px;
        height: 300px;
        background-color: rgba(255, 255, 255, 0.459);
        border-radius: 10px;
    }
    
     .error{
     	position:absolute;
     	top:50%;
     	left:50%;
        margin: 0;
        width: 400px;
      	height: 150px;
        background-color: rgb(255, 73, 49, 0.7);
        border: white 2px solid;
        border-radius: 20px;
        padding: 10px;
        box-sizing: border-box;
        color:black;
    }
    .error .title{
    	position:relative;
        font-family: "VT323";
        padding: 0;
        margin: 0;
        font-size: 25px;
        text-align: center;
        color:white;
    }

    .error .discription{
        font-family: "VT323";
        padding: 0;
        margin: 0;
        font-size: 20px;
        text-align: justify;
        color:white;
    }
</style>

<body>
    <div class="msg">
        <p class="text" data-text="NEW PASSWORD">NEW PASSWORD</p>
        <form method='post' action='forget'>
            <div class="container"></div>
            <div class="inputName"><input class="name" type="text" name="username" placeholder="Name" autocomplete="off">
            </div>
            <div class="inputPass"><input class="passwd" type="password" name="password" placeholder="Password">
            </div>
            <div class="inputCpass"><input class="cpasswd" type="password" name="password2" placeholder="Chk Passwd">
            </div>
            <input type="submit" value="change">
        </form>
    </div>
    

		<% List<String> error = (List<String>) request.getAttribute("error");
			if(error != null) { %>
				<div class="error">
		        <p class="title">ERROR : Change password fail</p>
				 <% for (String err : error) { %>
					 <p class="discription"><%= err %></p>
					 
		 <%}}%>
		 </div>
    

</body>

</html>
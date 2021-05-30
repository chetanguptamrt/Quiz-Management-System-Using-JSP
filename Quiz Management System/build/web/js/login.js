/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $("#loginForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserLoginServlet",
            method: "post",
            data: f,
            success: function(data){
                console.log(data);
                if(data.trim()==="done"){
                    location.href = "./index.jsp";
                } else if(data.trim()==="invalid"){
                    $("#status").show();
                    $("#status").html("Please provide valid credentials.");
                } else {
                    $("#status").show();
                    $("#status").html("Something went wrong!");
                }
            },
            error: function(){
                $("#status").show();
                $("#status").html("Something went wrong!");
            }
        });
    });
});
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#registerForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./UserRegistrationServlet",
            method: "post",
            data: f,
            success: function(data){
                if(data.trim()==="done"){
                    location.href = "./index.jsp";
                } else if(data.trim()==="alreadyUser"){
                    $("#status").show();
                    $("#status").html("User Already Exist!");
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
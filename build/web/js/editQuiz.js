/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#editQuiz").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        if($("#s1").is(":checked") || $("#s2").is(":checked") || $("#s3").is(":checked") || $("#s4").is(":checked") || $("#s5").is(":checked") || $("#s6").is(":checked")){
            $.ajax({
                url : "./EditQuizSevlet",
                data: f,
                method: "post",
                success: function(data){
                    if(data.trim()==="done"){
                        location.href = "./viewQuiz.jsp";
                    } else{
                        alert("Something went wrong!");
                    }
                },
                error: function(){
                    alert("Something went wrong!");
                }
            });
        } else{
            alert("Please write at east one in Student Detail");
        }
    });
});
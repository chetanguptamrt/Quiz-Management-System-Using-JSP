/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onbeforeunload = confirmExit;
function confirmExit() {
    if($("#title").val()!=="")
        return "You have attempted to leave this page. Are you sure?";
    else
        return null;
}
var i=1;
var q=1;
function add(event) {
    let j = i+1;
    if($("#question"+i).val()!=="" && q===1){
        q=0;
        console.log("question"+j+" qrite");
        let html = "<div id='set"+j+"' class='mt-3'>"+
                        "<div style='display: flex'>"+
                            "<h6 class='align-self-center'>Q"+j+".</h6>&nbsp;&nbsp;&nbsp;"+
                            "<input type='text' id='question"+j+"' name='question"+j+"' class='form-control' placeholder='Question "+j+"'/>"+
                        "</div>"+
                        "<table cellpadding='2' style='width: 100%' class='mt-2'>"+
                            "<tr>"+
                                "<td>"+
                                    "<input type='text' id='qa"+j+"' name='qa"+j+"' class='form-control' placeholder='Answer A'/>"+
                                "</td>"+
                                "<td>"+
                                    "<input type='text' id='qb"+j+"' name='qb"+j+"' class='form-control' placeholder='Answer B'/>"+
                                "</td>"+
                            "</tr>"+
                            "<tr>"+
                                "<td>"+
                                    "<input type='text' id='qc"+j+"' name='qc"+j+"' class='form-control' placeholder='Answer C'/>"+
                                "</td>"+
                                "<td>"+
                                    "<input type='text' id='qd"+j+"' name='qd"+j+"' class='form-control' placeholder='Answer D'/>"+
                                "</td>"+
                            "</tr>"+
                        "</table>"+
                        "<div style='display: flex'>"+
                            "<h6 class='mt-2 align-self-center'>Correct Answer: </h6>&nbsp;&nbsp;&nbsp;"+
                            "<select class='pl-3 pr-3 pt-0 pb-0' name='ans"+j+"'>"+
                                "<option selected value='1'>A</option>"+
                                "<option value='2'>B</option>"+
                                "<option value='3'>C</option>"+
                                "<option value='4'>D</option>"+
                            "</select>"+
                        "</div>"+
                    "</div>";
        $("#questionset").append(html);
    } else if(q===0 && $("#question"+i).val()===""){
        $("#set"+j).remove();
        q=1;
    }
}
function exit() {
    if($("#question"+i).val()!=="" && q===0){
        q=1;
        i+=1;
        $("#total").val(i);
        $("#question"+(i-1)).off("input");
        $("#question"+i).on("input",add);
        $("#question"+i).on("change", exit);
        console.log(i);
    }
}
$("#question"+i).on("input",add);
$("#question"+i).on("change", exit);

$(document).ready(function(){
    $("#quiz").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        if($("#s1").is(":checked") || $("#s2").is(":checked") || $("#s3").is(":checked") || $("#s4").is(":checked") || $("#s5").is(":checked") || $("#s6").is(":checked")){
            if(parseInt($("#total").val())<2){
                alert("Please enter at least one question");
                return;
            }
            for(var c = 1; c <= parseInt($("#total").val()); c++ ){
                if($("#question"+c).val().trim()!==""){
                    if($("#qa"+c).val().trim()==="" || $("#qb"+c).val().trim()==="" || $("#qc"+c).val().trim()==="" || $("#qd"+c).val().trim()==="") {
                        alert("Please write Question No. "+c+" option");
                        return;
                    }
                }
            }
            $.ajax({
                url : "./CreateQuizSevlet",
                data: f,
                method: "post",
                success: function(data){
                    if(data.trim()==="done"){
                        $("#title").val("");
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
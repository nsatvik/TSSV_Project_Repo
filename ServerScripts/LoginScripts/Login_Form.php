<?php
    //Import necessary header files here
    //include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    
?>

<script type="text/javascript">

    $("#button_userLogin").button().click(function(){                
                $("#div_loginStatus").load("./ServerScripts/LoginScripts/Verify_Login_Details.php", 
                {
                    "username" : $("#email_username").val(),
                    "password" : $("#password_username").val()
                });
                $("#div_loginStatus").change();                        
    });
    
    $("#div_loginDialog").dialog();
    $("#div_loginStatus").change(function(){
        $("#div_loginStatus").dialog();
        $("#div_loginStatus").fadeIn(1000);
        $("#div_loginDialog").remove();
        
        
    });
    
</script>

<div id="div_loginDialog" style="text-align: center;">   
    <label>Username</label><input type="email" id="email_username"/><br />
    <label>Password</label><input type="password" id="password_username"/><br />
    <input type="button" id="button_userLogin" value="Enter The Dragon"/>    
    <br /><br />       
</div>

<div id="div_loginStatus"></div>   


<?php	
    	
?>


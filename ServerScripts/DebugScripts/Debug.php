<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {
        
        
        function __construct()
        {        
        }
        
        function displayValues()
        {
                     
        }
    }
?>


<?php	
	$form = new FormValues();    
    $form->displayValues();        
    
	//echo json_encode($jsonObject);
?>

<style>
    #feedback { font-size: 1.4em; }
    #selectable .ui-selecting { background: #FECA40; }
    #selectable .ui-selected { background: #F39814; color: white; }
    #selectable { list-style-type: lower-alpha; margin: 0; padding: 0; width: 30%; text-align: center;}
    #selectable li { margin: 3px; padding: 0.5em; font-size: 1.0em; text-align: left;}
</style>

<script type="text/javascript">
    $("#tabs").tabs();
    
    $( "#selectable" ).selectable({
            stop: function() {
                var result = $("#feedback").empty();
                result.append("Options selected --> ");
                $( ".ui-selected", this ).each(function() {
                    var index = $( "#selectable li" ).index( this );
                    result.append( "#" + ( index + 1 ) );
                });
            }
        });    
</script>

<br />
<br />

<div id="tabs">
     <ul>
        <li><a href="#div_question">Question</a></li>
        <li><a href="#div_forum">Forum</a></li>        
    </ul>

<div id="div_question" style="">
    Who are you?
    <ol id="selectable" style="text-align: center;">
        <li class="ui-widget-content">Me...yeah ME!</li>
        <li class="ui-widget-content">You...yeah YOU!</li>
        <li class="ui-widget-content">We...yeah WE!</li>
        <li class="ui-widget-content">Talk to the Hand</li>
    </ol>
    
    
    <div id="feedback">
    </div>
</div>

<div id="div_forum">
    HAHA
</div>


</div>
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
        
        function constructTable()
        {
            //mysql_fetch_array
            $row[0] = array(12, 'IIT', 'HAHA', '1');
            $row[1] = array(23, 'AIEEE', 'HEHE', '2');
            $row[2] = array(34, 'CET', 'HUHU', '3');
            
            $rowCopy = $row;
            $numRows = 3;           //mysql_num_rows
            
            echo "<div id=\"tabs\">" .
                 "<ul>";
                 for($i = 0; $i < $numRows; $i++)
                 {
                    echo "<li><a href=\"#tabs-" . $i . "\">" . $row[$i][1] . "</a></li>";
                 }               
                 
            echo "</ul>";            
                for($i = 0; $i < $numRows; $i++)
                {
                    echo "<div id=\"tabs-" . $i . "\">" . "<p>" . $rowCopy[$i][1] . "\t" . $rowCopy[$i][2] . "\t" . $rowCopy[$i][3] . "</div>";
                    echo "<input type=\"hidden\" id=\"tabID$i\" value=\"{$rowCopy[$i][0]}\" />";
                }
                
                echo "<div id=\"div_subjectAjaxFiller\" style=\"float: left; width=75%\">
                        Placeholder for Subjects
                    </div>";
                
                $this->addBreaks(30);
            echo "</div>";
        }
        
        function addBreaks($num)
        {
            for($i = 0; $i < $num; $i++)
                echo "<br/>";
        }
    }
?>

<br /><br /><br />

<?php	
	$form = new FormValues();    
    $form->displayValues();        
    $form->constructTable();
    
	//echo json_encode($jsonObject);
?>

<script type="text/javascript">    
    function handleSelect(event, tab) {
        $("#div_subjectAjaxFiller").text("The tab at index " + tab.index + " was selected")                  
        
        $("#div_subjectAjaxFiller").load("./ServerScripts/StatisticsScripts/RetrieveSubjectScript.php", 
            {
                "courseID" : $("#tabID" + tab.index).val()            
            });      
        
    }  
    var tabOpts = {
        select:handleSelect
    };
    $("#tabs").tabs(tabOpts);
    $('#tabs').tabs('select', 1);

</script>




<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {        
        private $conn;
        
        function __construct()
        {        
            $this->conn = new SQL("localhost", "root", "");
            $this->conn->setDatabase("questions_db");
        }
        
        function __destruct()
        {
            //$this->conn->close();
        }
        
        function displayValues()
        {            
        }
        
        
        private function getCourseTuples()
        {
            $query = "select C.id, C.name
                      from RegisteredCourse R, Course C
                      where (R.studentId = 'BASE12S1015' or R.studentId = 'BASE12S1019') and R.courseId = C.id;";
            $result = $this->conn->query($query);
            return $result; 
        }
                        
        function constructTable()
        {            
            $result = $this->getCourseTuples();        
            $numRows = mysql_num_rows($result);           //mysql_num_rows
            
            echo "<div id=\"tabs\">" .
                 "<ul>";
                 for($i = 0; $i < $numRows; $i++)                                  
                 {
                    $row = mysql_fetch_array($result);
                    echo "<li><a href=\"#tabs-" . $i . "\">" . $row[1] . "</a></li>";
                 }               
                 
                 mysql_data_seek($result, 0);           //Resetting Pointer
                 
            echo "</ul>";            
                for($i = 0; $i < $numRows; $i++)
                {
                    $row = mysql_fetch_array($result);
                    echo "<div id=\"tabs-" . $i . "\">" . "<p id=\"p_feedback\"> Course Selected ---> " . $row[1] . "</div>";
                    echo "<input type=\"hidden\" id=\"hidden_courseID$i\" value=\"{$row[0]}\" />";
                }
                
                echo "<div id=\"div_subjectAjaxFiller\" style=\"float: left; width=75%\">
                        Placeholder for Subjects
                    </div>";
                    
                $this->initHiddenElements();
                
                $this->addBreaks(30);
            echo "</div>";
        }
        
        function addBreaks($num)
        {
            for($i = 0; $i < $num; $i++)
                echo "<br/>";
        }
        
        function initHiddenElements()
        {
            echo "<input type=\"hidden\" id=\"hidden_subjectID\" value=\"null\" />";
            echo "<input type=\"hidden\" id=\"hidden_unitID\" value=\"null\" />";
            echo "<input type=\"hidden\" id=\"hidden_chapterID\" value=\"null\" />";
        }
    }
?>

<br /><br /><br />

<?php	
	$form = new FormValues();    
    $form->displayValues();   
    $form->constructTable();
    
?>

<script type="text/javascript">    
    function handleSelect(event, tab) {
        $("#div_subjectAjaxFiller").text("The tab at index " + tab.index + " was selected")                  
        
        $("#div_subjectAjaxFiller").load("./ServerScripts/StatisticsScripts/RetrieveSubjectScript.php", 
            {
                "courseID" : $("#hidden_courseID" + tab.index).val()            
            });     
        
    }  
    var tabOpts = {
        select:handleSelect
    };
    $("#tabs").tabs(tabOpts);
    $('#tabs').tabs('select', 0);
    
    //To load the first tab
    $("#div_subjectAjaxFiller").load("./ServerScripts/StatisticsScripts/RetrieveSubjectScript.php", 
            {
                "courseID" : $("#hidden_courseID" + 0).val()            
            }); 

</script>




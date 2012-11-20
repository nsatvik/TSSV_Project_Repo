<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {        
        private $chapterID;
        private $conn;
        
        function __construct()
        {        
            $this->chapterID = $_POST['chapterID'];
            
            $this->conn = new SQL("localhost", "root", "");
            $this->conn->setDatabase("questions_db");
        }
        
        function displayValues()
        {
            echo "Chapter ID = " . $this->chapterID;
        }
                        
        private function getChapterStatisticsTuples()
        {
            $query = "select C.id, count(QS.id) as numberOfQuestions,
        				sum(QS.count_total) as numberOfStudents, 
        				sum(QS.count_correct) as c_numberStudents,
        				sum(QS.count_incorrect) as ic_numberStudents,
        				round(avg(QS.count_correct/QS.count_total) * 100) as c_fraction, 
        				round(avg(QS.count_incorrect/QS.count_total) * 100) as ic_fraction, 
        				round(avg(QS.suggestedTime)) as avgSuggestedTime, 
        				round(avg(QS.c_avgTime)) as c_avgTime, 
        				round(avg(QS.a_avgTime)) as a_avgTime
        				
                        from QuestionStatistics QS, Question Q, Chapter C
                        where QS.id = Q.id and Q.chapterId = C.id
                        group by C.id;";
            $result = $this->conn->query($query);
            return $result;
        }
        
        function displayStatistics()
        {
            $result = $this->getChapterStatisticsTuples();                   
            $numRows = mysql_num_rows($result);           //mysql_num_rows
            
            $attributes = array("id", "numQuestions", "numStudents", "c_numStudents", "ic_numStudents", "c_fraction", "ic_fraction", "avgSuggestedTime", "c_avgTime", "a_avgTime");
            
            
            echo "<div id=\"div_unitsAjaxFiller\" style=\"float: right; position:relative; left:0px; white-space:pre;overflow:auto;width:50%;padding:10px;\">
                        Placeholder for Units Table";                  
            echo "<table id=\"table_chapterStatistics\" border='1' style=\"\">";
            echo "<thead>";
            echo "<tr>";
            for($i = 0; $i < count($attributes); $i++)
                echo "<th>" . $attributes[$i] . "</th>";
            echo "</tr>";
            echo "</thead>";
            
            echo "<tbody>";            
            for($j = 0; $j < $numRows; $j++)
            {
              $row = mysql_fetch_array($result);                                
              echo "<tr style=\"width: 100%; text-align: center;\">";
              if(is_null($attributes) || count($attributes) == 0)
              {
                foreach($row as $key => $value)
                    echo "<td>" . $value . "</td>";
              }
              else
              {
                for($i = 0; $i < count($attributes); $i++)
                {
                     echo "<td>" . $row[$i]. "</td>";                     
                }
              }          
              echo "</tr>";
            }
            echo "</table>";
            echo "</tbody>";
            
            echo "</div>";            
            echo "</div>";
        }
        
        
    }
?>


<?php	
	$form = new FormValues();    
    //$form->displayValues(); 
    $form->displayStatistics();       
    //$form->constructTable();
    
	
?>

<style>
    #table_chapterStatistics {
        table-layout:fixed;
    }
    #table_chapterStatistics td{
        overflow:hidden;
        text-overflow: elipsis;
    }
</style>


<script type="text/javascript">        
    $("#table_chapterStatistics").dataTable({
        "sScrollX": "50%",
		"sScrollXInner": "110%",
		"bScrollCollapse": true       
    });   
    $("#table_chapterStatistics_previous").button();
    $("#table_chapterStatistics_next").button();   
</script>




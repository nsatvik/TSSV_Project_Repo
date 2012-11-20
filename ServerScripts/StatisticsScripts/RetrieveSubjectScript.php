<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {        
        private $courseID;
        private $conn;
        
        function __construct()
        {        
            $this->courseID = $_POST['courseID'];
            
            $this->conn = new SQL("localhost", "root", "");
            $this->conn->setDatabase("questions_db");
        }
        
        function displayValues()
        {
            echo "Course ID = " . $this->courseID;
        }
        
        function getSubjectTuples()
        {   
            $query = "select S.id, S.name
                      from RegisteredCourse R, Subject S
                      where R.studentId = 'BASE12S1015' and R.courseId = S.courseId and R.courseId = '{$this->courseID}'";
            $result = $this->conn->query($query);
            return $result;
        }
        
        function constructTable()
        {            
            $result = $this->getSubjectTuples();
            $numRows = mysql_num_rows($result);         
            
            $attributes = array("Subject_ID", "Subject_Name");
            
            
            echo "<div style=\"float: left;\">";
            echo "<table id=\"table_subjects\" border='1' style=\"text-align: center;\">";
            echo "<thead>";
            echo "<tr>";
            for($i = 0; $i < count($attributes); $i++)
                echo "<th>" . $attributes[$i] . "</th>";
            echo "<th>Click Me!</th>";                      //To be removed later
            echo "</tr>";
            echo "</thead>";
            
            echo "<tbody>";            
            for($j = 0; $j < $numRows; $j++)
            {
              $row = mysql_fetch_array($result);                                
              echo "<tr class=\"rowButton\" style=\"width: 100%; text-align: center;\">";
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
                echo "<td><input type=\"button\" id=\"button_{$row[0]}\" value=\"Select\"/></td>";
                echo "<script type=\"text/javascript\">  
                        $(\"#button_{$row[0]}\").button().click(function(){
                                $(\"#p_feedback\").text(\"Subject Selected --> \" + this.id.substring(7));
                            
                                $(\"#div_unitsAjaxFiller\").text(this.id);
                                $(\"#hidden_subjectID\").val(this.id.substring(7));
                                                                
                                $(\"#div_subjectAjaxFiller\").empty();
                                $(\"#div_subjectAjaxFiller\").load(\"./ServerScripts/StatisticsScripts/RetrieveUnitScript.php\", 
                                    {
                                        \"subjectID\" : $(\"#hidden_subjectID\").val()            
                                    });   
                            });; 
                      </script>";
              }          
              echo "</tr>";
            }
            echo "</table>";
            echo "</tbody>";
            
            echo "</div>";           
        }
        
        private function getCourseStatisticsTuples()
        {
            $query = "select Course.id, count(QS.id) as numberOfQuestions,
        				sum(QS.count_total) as numberOfStudents, 
        				sum(QS.count_correct) as c_numberStudents,
        				sum(QS.count_incorrect) as ic_numberStudents,
        				round(avg(QS.count_correct/QS.count_total) * 100) as c_fraction, 
        				round(avg(QS.count_incorrect/QS.count_total) * 100) as ic_fraction, 
        				round(avg(QS.suggestedTime)) as avgSuggestedTime, 
        				round(avg(QS.c_avgTime)) as c_avgTime, 
        				round(avg(QS.a_avgTime)) as a_avgTime
        				
                        from QuestionStatistics QS, Question Q, Chapter, Unit U, Subject S, Course
                        where QS.id = Q.id and Q.chapterId = Chapter.id and Chapter.unitId = U.id and U.subjectId = S.id and S.courseId = Course.id
                                and Course.id = '{$this->courseID}'
                        group by Course.id";
            $result = $this->conn->query($query);
            return $result;
        }
        
        function displayStatistics()
        {
            $result = $this->getCourseStatisticsTuples();                   
            $numRows = mysql_num_rows($result);           //mysql_num_rows
            
            $attributes = array("id", "numQuestions", "numStudents", "c_numStudents", "ic_numStudents", "c_fraction", "ic_fraction", "avgSuggestedTime", "c_avgTime", "a_avgTime");
            
            
            echo "<div id=\"div_unitsAjaxFiller\" style=\"float: right; position:relative; left:0px; white-space:pre;overflow:auto;width:50%;padding:10px;\">
                        Placeholder for Units Table";                  
            echo "<table id=\"table_courseStatistics\" border='1' style=\"\">";
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
    $form->constructTable();
    
	
?>

<style>
    #table_courseStatistics {
        table-layout:fixed;
    }
    #table_courseStatistics td{
        overflow:hidden;
        text-overflow: elipsis;
    }
</style>


<script type="text/javascript">    
    $("#table_subjects").dataTable();
    $("#table_subjects_previous").button();
    $("#table_subjects_next").button();
    
    $("#table_courseStatistics").dataTable({
        "sScrollX": "50%",
		"sScrollXInner": "110%",
		"bScrollCollapse": true       
    });   
    $("#table_courseStatistics_previous").button();
    $("#table_courseStatistics_next").button();   
</script>




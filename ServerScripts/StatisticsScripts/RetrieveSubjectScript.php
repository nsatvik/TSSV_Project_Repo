<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {        
        private $courseID;
        
        function __construct()
        {        
            $this->courseID = $_POST['courseID'];
        }
        
        function displayValues()
        {
            echo "Course ID = " . $this->courseID;
        }
        
        function constructTable()
        {
            $row[0] = array("100", "Physics", "HAHA", 7);
            $row[1] = array("200", "Chemistry", "HEHE", 8);
            $row[2] = array("300", "Mathematics", "HUHU", 9);
            $row[3] = array("400", "Physics", "HAHA", 7);
            $row[4] = array("500", "Chemistry", "HEHE", 8);
            $row[5] = array("600", "Mathematics", "HUHU", 9);
            $row[6] = array("700", "Physics", "HAHA", 7);
            $row[7] = array("800", "Chemistry", "HEHE", 8);
            $row[8] = array("900", "Mathematics", "HUHU", 9);
            $row[9] = array("1000", "Physics", "HAHA", 7);
            $row[10] = array("1100", "Chemistry", "HEHE", 8);
            $row[11] = array("1200", "Mathematics", "HUHU", 9);
            
            $numRows = count($row);
            $attributes = array("Subject_Name", "H", "Num");
            
            
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
            //while($row = mysql_fetch_array($result))
            for($j = 0; $j < $numRows; $j++)
            {
              echo "<tr>";
              /*if(is_null($attributes) || count($attributes) == 0)
              {
                foreach($row as $key => $value)
                    echo "<td>" . $value . "</td>";
              }
              else
              {*/
                for($i = 0; $i < count($attributes); $i++)
                {
                     echo "<td>" . $row[$j][$i + 1] . "</td>";                     
                }
                echo "<td><input type=\"button\" id=\"button_{$row[$j][0]}\" value=\"Select\"/></td>";
                echo "<script type=\"text/javascript\">  
                        $(\"#button_{$row[$j][0]}\").button().click(function(){
                                $(\"#div_unitsAjaxFiller\").text(this.id);
                            });; 
                      </script>";
              //}          
              echo "</tr>";
            }
            echo "</table>";
            echo "</tbody>";
            
            echo "</div>";
            
            echo "<div id=\"div_unitsAjaxFiller\" style=\"float:right; position:relative; left:500px;\">
                        Placeholder for Units Table
                  </div>";
        }
    }
?>


<?php	
	$form = new FormValues();    
    //$form->displayValues();        
    $form->constructTable();
    
	
?>

<script type="text/javascript">    
    $("#table_subjects").dataTable();    
    
    $("#table_subjects_previous").button();
    $("#table_subjects_next").button();
</script>




<?php
    //Import necessary header files here
    include_once("../../lib/sql_query_class.php");
?>



<?php
    //Define classes here
    class FormValues
    {
        public $username;
        public $password;
        
        function __construct()
        {
            $this->username = $_POST['username'];
            $this->password = $_POST['password'];
        }
        
        function displayValues()
        {
            echo "Username: " . $this->username . "<br/>";
            echo "Password: " . $this->password . "<br/>";            
        }
        
        function isValid()
        {
            //Use Sql Queries to verify ------------ Uncomment this when database is available
            /*$conn = new SQL("localhost", "root", "");
            $conn->setDatabase("timetable");
            
            $query = "SELECT count(*) AS Count 
                      FROM LoginTable
                      WHERE username = '{$this->username}'
                            AND password = '{$this->password}'";
            $result = $conn->query($query);
            
            $row = mysql_fetch_array($result);
            if($row["Count"] == 1)
                return true;
            else
                return false;*/    
          
            return true;
        }
    }
?>


<?php	
	$form = new FormValues();    
    $form->displayValues();        
    
	if($form->isValid())
		echo "Login Successful";
	else
		echo "Wrong username or password";
    
	//echo json_encode($jsonObject);
?>


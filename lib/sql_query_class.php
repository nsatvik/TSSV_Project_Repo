<html>
<link rel="stylesheet" type="text/css" href="Table_Style.css" />
<?php

/**
 * @author MESMERiZE
 * @copyright 2012
 */
class SQL
{
    private $connection;
    private $username;
    private $server;
    private $dbname;
    private $password;
    
    function __construct($serv, $user, $password)
    {
        if(!(is_string($serv) && is_string($user)))
            throw new Exception("Wrong Data Types");
        
        $this->username = $user;
        $this->server = $serv;
        $this->password = $password;
        $this->connection = mysql_connect($serv, $user, $password);
        
        if(!$this->connection)
        {
            die("Couldn't connect " . mysql_error());
        }
    }
    
    function setDatabase($name)
    {
        if(!is_string($name))
            throw new Exception("Wrong Data Type");
            
        $this->dbname = $name;
        mysql_select_db($name, $this->connection);
    }
    
    function query($query)
    {
        $result = mysql_query($query);
        return $result;
    }
    
    function getUsername()
    {
        return $this->username;
    }
    
    function getServerName()
    {
        return $this->server;
    }
    
    function getDbname()
    {
        return $this->dbname;
    }
    
    function setUsername($name)
    {
        $this->username = $name;
    }
    
    function setServerName($name)
    {
        $this->server = $name;
    }
    
    function resetConnection()
    {
        $this->connection = mysql_connect($serv, $user, $password);
        
        if(!$cxn)
        {
            die("Couldn't connect " . mysql_error());
        }
    }
    
    function closeConnection()
    {
        mysql_close($this->connection);
    }
    
     
    
    function drawResultTable($result, $attributes)
    {
        if(!$result)
        {   
            echo "Wrong Result Type";
            return;
        }
        
        echo "<table id=\"customers\"border='1'>";
        echo "<tr>";
        for($i = 0; $i < count($attributes); $i++)
            echo "<th>" . $attributes[$i] . "</th>";
        echo "</tr>";
        
        while($row = mysql_fetch_array($result))
        {
          echo "<tr>";
          if(is_null($attributes) || count($attributes) == 0)
          {
            foreach($row as $key => $value)
                echo "<td>" . $value . "</td>";
          }
          else
          {
            for($i = 0; $i < count($attributes); $i++)
                 echo "<td>" . $row["$i"] . "</td>";
          }          
          echo "</tr>";
        }
        echo "</table>";
    }
    
    
    
    
}


?>


</html>
//This script takes care of AJAX Requests and Responses

    var xmlhttp; 
    
    
    /**
     * Variant 1: Retrieves information from url, and displays it in the element specified by id,
     *      when an event (specified by readyState and status) is triggered.
     */
    
    function processRequest(url, readyState, status, id)
    {
        loadXMLDoc(url, "null", "null", function()
        {
            if (xmlhttp.readyState == readyState && xmlhttp.status == status)
            {
                document.getElementById(id).innerHTML=xmlhttp.responseText;
            }
        }, false);
    }  
    
    
    
    /**
     * Variant 2: Retrieves information from url (concatenated with a Query String, obtained from elements),
     *       and displays it in the element specified by id, when an event (specified by readyState and status)
     *       is triggered.
     */
       
    function processRequestWithQueryString(url, readyState, status, id, elements, values)
    {
        loadXMLDoc(url, elements, values, function()
        {
            if (xmlhttp.readyState == readyState && xmlhttp.status == status)
            {
                document.getElementById(id).innerHTML=xmlhttp.responseText;
            }
        }, true);
    }
    
    
    
    
    
    
    
    /**
     * This function creates an XMLHttpRequest Object to communicate and receive information
     *      from a file (php) specified by url.
     *      cfunc is a function that specifies what action to take when an event is triggered.
     *          if attachQuery == true, then
     *              the values stored in the form objects specified by their ids in elements
     *              are sent to the php script (url) using the GET method
     */
    
    
    function loadXMLDoc(url, elements, values, cfunc,  attachQuery)
    {
        /*$("#selectOperationFieldset").hide();
        $("#selectOperationFieldset").show(250);*/
        
        
        
        if (window.XMLHttpRequest)
        {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest(); 
        }
        else
        {
            // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        
        xmlhttp.onreadystatechange=cfunc;
        
        if(attachQuery == true)
        {
            var str = createQueryString(elements, values);
            url += str;
        }
        
        xmlhttp.open("GET",url,true);
        xmlhttp.send();       
    }


    /**
     * Creates and returns a query string... Eg., "?a=text&b=true"
     *      using elements and values.
     *          elements is an array that holds the ids of the form objects,
     *          and values is an array that holds the types of the corresponding form object in the elements array.
     */
    
    function createQueryString(elements, values)
    {
        //var str = "?" + elements[0] + "=" + document.getElementById(elements[0]).value;
        var str = "?" + elements[0] + "=" + getValueOfFormObject(elements[0], values[0]);
        for(i=1; i<elements.length; i++)
        {
            //str += "&" + elements[i] + "=" + document.getElementById(elements[i]).value;
            str += "&" + elements[i] + "=" + getValueOfFormObject(elements[i], values[i]);
        }
        
        return str;
    }
    
    
    /**
     * This returns the value (Input from the user) of a form object
     *      whose id is element and type is value
     */
    function getValueOfFormObject(element, value)
    { 
        switch(value)
        {
            case 'list' : 
                    selectedIndex = document.getElementById(element).selectedIndex;
                    return document.getElementById(element)[selectedIndex].text;
                     
            case 'text': return document.getElementById(element).value;
            case 'radio' : return document.getElementById(element).checked;
            case 'checkbox' : return document.getElementById(element).checked;
            case 'multiple' : var multipleValues = $("#" + element).val() || [];
                              return ("" + multipleValues.join(","));

            default: return "Invalid Form Object";
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

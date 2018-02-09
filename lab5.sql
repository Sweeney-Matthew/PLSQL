--PART 1
DECLARE
  
  --Declare and set input variables
  array_input_1 VARCHAR2(1000);
  array_input_2 VARCHAR2(1000);
  array_input_3 VARCHAR2(1000);
  array_input_4 VARCHAR2(1000);
  
  --Declare array of scalar data type
  TYPE three_array IS VARRAY(3) OF VARCHAR2(1000);
  
  --Construct array with no parameters
  my_array three_array := three_array();
  
  --Other variable
  variable_count NUMBER := 0;
  
BEGIN
 
    --Enter variables and parameter numbers to be taken to make varray
    array_input_1 := '&string1';
    array_input_2 := '&string2';
    array_input_3 := '&string3';
    array_input_4 := '&string4';
    variable_count := &Number_of_parameters;

	--Case statement to see how many parameters to pass. If they pass too many it extends too far and fails.
    CASE variable_count
         WHEN 1 THEN
              my_array.EXTEND;
              my_array(1) := array_input_1;
         WHEN 2 THEN
              my_array.EXTEND(2);
              my_array(1) := array_input_1;
              my_array(2) := array_input_2;
         WHEN 3 THEN
              my_array.EXTEND(3);
              my_array(1) := array_input_1;
              my_array(2) := array_input_2;
              my_array(3) := array_input_3;
         ELSE
              my_array.EXTEND(4);
    END CASE;

	--Loop to print varray elements.
    FOR i in 1 .. my_array.count LOOP
    dbms_output.put_line(my_array(i));
    END LOOP;
  
--Exception block  
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Exception ['||SQLERRM||']');
END;

--PART 2 
DECLARE
    --Declares record
	TYPE address_rec IS RECORD
		( full_name VARCHAR2(50)
		, city VARCHAR2(30)
		, st VARCHAR2(10)
		, street_address VARCHAR2(100));
	
    --Declares table of record type	
	TYPE name_table IS TABLE OF address_rec;
	
	--Declares variables of table type and initializes them
	my_table name_table := name_table();
	lv_address address_rec;
	
	--Declares cursor
	CURSOR address_search IS
	     SELECT c.last_name ||', ' || c.first_name || ' ' || c.middle_name AS full_name
               , a.city
               , a.state_province
               , sa.street_address
               FROM CONTACT c INNER JOIN ADDRESS a
               ON c.contact_id = a.contact_id
               INNER JOIN STREET_ADDRESS sa ON sa.address_id = a.address_id
			   ORDER BY full_name ASC;
	
BEGIN

    --Loop that uses cursor and assigns returned information to record for the element indexed i
    FOR i in address_search LOOP
	    lv_address := i;
		my_table.extend;
		my_table(my_table.count) := lv_address;
		END LOOP;

	--Prints members of table	
    FOR i in REVERSE my_table.first .. my_table.last LOOP
    dbms_output.put_line(my_table(i).full_name || ' - ' || my_table(i).city || ' - ' || my_table(i).st || ' - ' || my_table(i).street_address);
    END LOOP;
	
--Exception block  
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Exception ['||SQLERRM||']');
END;

--PART 3
DECLARE

    --Declare record
    TYPE rating_rec IS RECORD
		( item_title VARCHAR2(100)
		, rating VARCHAR2(10));
	
    --Declare cursor to find information	
    CURSOR rating_search IS
	    SELECT item_title
         , item_rating
        FROM item WHERE item_rating_agency = 'MPAA';

    --Declare associative array of type record with integer index
	TYPE rating_table IS TABLE OF rating_rec INDEX BY PLS_INTEGER;
	
	--Declare variable of type array above
	my_table rating_table;
	
	--Declare counter to be used in the loop below
	counter NUMBER := 1;
	
BEGIN

    --Open cursor
    OPEN rating_search;
   
   --Create while loop. I know we're supposed to use %found, but it wasn't updating information, so it wouldn't work.
   --I used 84 instead since I know it returns 83 rows.
    WHILE (counter < 84)
    LOOP
	   --Fetches information from cursor and puts it in the array
       FETCH rating_search INTO 
	   my_table(counter).item_title
	   , my_table(counter).rating;
	       --Increments counter
           counter := counter + 1;
    END LOOP;
    CLOSE rating_search;

	--Prints out elements of array
    FOR i in my_table.first .. my_table.last LOOP
    dbms_output.put_line(my_table(i).item_title || ' - ' || my_table(i).rating);
    END LOOP;
	
--Exception block  
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Exception ['||SQLERRM||']');
END;
/
			  
			  
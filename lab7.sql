--PART 1 (Insert into Contact, Address, Telephone)

/*Creates procedure that adds data to the contact, address, and telephone tables.
The parameters required for each table are separated by line breaks. 
Each table takes 3 variables, so there are 9 total parameters. */
CREATE or REPLACE PROCEDURE insert_1
( pv_first VARCHAR2, pv_middle VARCHAR2, pv_last VARCHAR2
, pv_city VARCHAR2, pv_state VARCHAR2, pv_zip VARCHAR2
, pv_country_code VARCHAR2, pv_area_code VARCHAR2, pv_telephone_number VARCHAR2) IS

BEGIN

--set savepoint
SAVEPOINT back_to_1;

--Inserts data into contact table
INSERT INTO CONTACT VALUES
( contact_s1.nextval
, 1010
, 1003
, pv_last
, pv_first
, pv_middle
, 1, SYSDATE, 1, SYSDATE);

--Inserts data into address table
INSERT INTO ADDRESS VALUES
( address_s1.nextval
, contact_s1.currval
, 1009
, pv_city
, pv_state
, pv_zip
, 1, SYSDATE, 1, SYSDATE);

--Inserts data into telephone table
INSERT INTO TELEPHONE VALUES
( telephone_s1.nextval
, contact_s1.currval
, address_s1.currval
, 1011
, pv_country_code
, pv_area_code
, pv_telephone_number
, 1, SYSDATE, 1, SYSDATE);

COMMIT; --Commits changes inside transaction scope

--Exception block
EXCEPTION

	--If any of the above fails then this will roll it back to the savepoint established earlier
	WHEN others THEN 
	ROLLBACK TO back_to_1;
	
END;

--PART 2 (Insert into Rental and Rental_item)

CREATE or REPLACE PROCEDURE insert_2
( pv_first VARCHAR2, pv_last VARCHAR2, pv_title VARCHAR2
, success_var OUT BOOLEAN) IS

PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN

success_var := FALSE;

SAVEPOINT back_to_2;

--Inserts data into rental table
INSERT INTO rental VALUES
( rental_s1.nextval
,(SELECT   contact_id
  FROM     contact
  WHERE    last_name = pv_last
  AND      first_name = pv_first)
, SYSDATE, SYSDATE + 5
, 3, SYSDATE, 3, SYSDATE);

--Inserts data into rental_item table
INSERT INTO rental_item
VALUES
( rental_item_s1.nextval
,(SELECT   r.rental_id
  FROM     rental r
  ,        contact c
  WHERE    r.customer_id = c.contact_id
  AND      c.last_name = pv_last
  AND      c.first_name = pv_first)
,(SELECT   d.item_id
  FROM     item d
  ,        common_lookup cl
  WHERE    d.item_title = pv_title
  AND      d.item_type = cl.common_lookup_id)
, 5
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_table = 'RENTAL_ITEM'
  AND      common_lookup_column = 'RENTAL_ITEM_TYPE'
  AND      common_lookup_type = '5-DAY RENTAL')
, 1, SYSDATE, 1, SYSDATE);

COMMIT; --Commits changes inside transaction scope

success_var := TRUE;

--Exception block
EXCEPTION

	--If any of the above fails then this will roll it back to the savepoint established earlier
	WHEN others THEN 
	ROLLBACK TO back_to_2;
	
END;
/

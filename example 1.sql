------------------------------------
--PART 1 
------------------------------------

--Base object type
------------------
   
CREATE OR REPLACE TYPE base_t IS OBJECT
( oid NUMBER
, oname VARCHAR2(30)
, CONSTRUCTOR FUNCTION base_t ( oid NUMBER, oname VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_oname RETURN VARCHAR2
, NOT INSTANTIABLE MEMBER FUNCTION get_name RETURN VARCHAR2;
, MEMBER PROCEDURE set_oname (oname VARCHAR2)
, MEMBER FUNCTION to_string RETURN VARCHAR2 )

INSTANTIABLE NOT FINAL;

/

--Base object type body specification
-------------------------------------

CREATE OR REPLACE TYPE BODY base_t IS

    CONSTRUCTOR FUNCTION base_t ( oid NUMBER, oname VARCHAR2 ) RETURN SELF AS RESULT IS
    BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances
        self.oname := oname;
		
    RETURN;

END;

--Logic for the get_oname function
MEMBER FUNCTION get_oname RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.oname;

END get_oname;

--Logic for the set_oname function
MEMBER PROCEDURE set_oname (oname VARCHAR2) IS
    
	BEGIN

    self.oname := oname;

END set_oname;

--Logic for the to_string function
MEMBER FUNCTION to_string RETURN VARCHAR2 IS         --This is the logic for the function

    BEGIN

    RETURN '[' || self.oid || ']' || '[' || self.oname || ']';

END to_string;

END;
/

------------------------------------
--PART 2 
------------------------------------

CREATE TABLE tolkien
( tolkien_oid             NUMBER        CONSTRAINT pk_tolkien  PRIMARY KEY
, character               base_t);

CREATE SEQUENCE tolkien_s1 START WITH 1001;

------------------------------------
--PART 3
------------------------------------


--Hobbit subtype
----------------

CREATE OR REPLACE TYPE hobbit UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION hobbit (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Hobbit subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY hobbit IS

--Hobbit subtype constructor
CONSTRUCTOR FUNCTION hobbit (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus function
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name function
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/



--Dwarf subtype
---------------

CREATE OR REPLACE TYPE dwarf UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION dwarf (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Dwarf subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY dwarf IS

--Dwarf subtype constructor
CONSTRUCTOR FUNCTION dwarf (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus function
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name function
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/


--Goblin subtype
----------------

CREATE OR REPLACE TYPE goblin UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION goblin (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Goblin subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY goblin IS

--Goblin subtype constructor
CONSTRUCTOR FUNCTION goblin (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus function
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name function
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/

--Maia subtype
--------------

CREATE OR REPLACE TYPE maia UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION maia (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Maia subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY maia IS

--Maia subtype constructor
CONSTRUCTOR FUNCTION maia (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus function
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name function
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/

--Man subtype
-------------

CREATE OR REPLACE TYPE man UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION man (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--man subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY man IS

--man subtype constructor
CONSTRUCTOR FUNCTION man (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2)
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus function
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name function
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/

--Orc subtype
-------------

CREATE OR REPLACE TYPE orc UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION orc (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Orc subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY orc IS

--Orc subtype constructor
CONSTRUCTOR FUNCTION orc (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus procedure
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name procedure
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/

--Elf subtype
-------------

CREATE OR REPLACE TYPE elf UNDER base_t

( name VARCHAR2(30)
, genus VARCHAR2(20)
, CONSTRUCTOR FUNCTION elf (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
, MEMBER PROCEDURE set_name (name VARCHAR2)
, OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Elf subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY elf IS

--Elf subtype constructor
CONSTRUCTOR FUNCTION elf (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		
    RETURN;

END;

--Logic for the get_genus function
MEMBER FUNCTION get_genus RETURN VARCHAR2 IS
    
	BEGIN

    RETURN self.genus;

END get_genus;

--Logic for the set_genus procedure
MEMBER PROCEDURE set_genus (genus VARCHAR2) IS
    
	BEGIN

    self.genus := genus;

END set_genus;

--Logic for the set_name procedure
MEMBER PROCEDURE set_name (name VARCHAR2) IS
    
	BEGIN

    self.name := name;

END set_name;

--Logic for the overridden get_name function
OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.name;
	
END get_name;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as base_t).to_string || '[' || self.genus || ']';

END to_string;

END;
/

------------------------------------
--PART 4
------------------------------------

--Noldor subtype
----------------

CREATE OR REPLACE TYPE noldor UNDER elf

( elfkind VARCHAR2(20)
, CONSTRUCTOR FUNCTION noldor (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_elfkind RETURN VARCHAR2
, MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Noldor subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY noldor IS

--Noldor subtype constructor
CONSTRUCTOR FUNCTION noldor (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		self.elfkind := elfkind;
		
    RETURN;

END;

--Logic for the set_elfkind procedure
MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
    
	BEGIN

    self.elfkind := elfkind;

END set_elfkind;

--Logic for the get_elfkind function
MEMBER FUNCTION get_elfkind RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.elfkind;
	
END get_elfkind;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as elf).to_string || '[' || self.elfkind || ']';

END to_string;

END;
/

--Nordor subtype
----------------

CREATE OR REPLACE TYPE nordor UNDER elf

( elfkind VARCHAR2(20)
, CONSTRUCTOR FUNCTION nordor (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_elfkind RETURN VARCHAR2
, MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Nordor subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY nordor IS

--Nordor subtype constructor
CONSTRUCTOR FUNCTION nordor (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		self.elfkind := elfkind;
		
    RETURN;

END;

--Logic for the set_elfkind procedure
MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
    
	BEGIN

    self.elfkind := elfkind;

END set_elfkind;

--Logic for the get_elfkind function
MEMBER FUNCTION get_elfkind RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.elfkind;
	
END get_elfkind;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as elf).to_string || '[' || self.elfkind || ']';

END to_string;

END;
/

--Silvan subtype
----------------

CREATE OR REPLACE TYPE silvan UNDER elf

( elfkind VARCHAR2(20)
, CONSTRUCTOR FUNCTION silvan (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_elfkind RETURN VARCHAR2
, MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Silvan subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY silvan IS

--Silvan subtype constructor
CONSTRUCTOR FUNCTION silvan (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		self.elfkind := elfkind;
		
    RETURN;

END;

--Logic for the set_elfkind procedure
MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
    
	BEGIN

    self.elfkind := elfkind;

END set_elfkind;

--Logic for the get_elfkind function
MEMBER FUNCTION get_elfkind RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.elfkind;
	
END get_elfkind;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as elf).to_string || '[' || self.elfkind || ']';

END to_string;

END;
/

--Sindar subtype
----------------

CREATE OR REPLACE TYPE sindar UNDER elf

( elfkind VARCHAR2(20)
, CONSTRUCTOR FUNCTION sindar (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_elfkind RETURN VARCHAR2
, MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Sindar subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY sindar IS

--Sindar subtype constructor
CONSTRUCTOR FUNCTION sindar (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		self.elfkind := elfkind;
		
    RETURN;

END;

--Logic for the set_elfkind procedure
MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
    
	BEGIN

    self.elfkind := elfkind;

END set_elfkind;

--Logic for the get_elfkind function
MEMBER FUNCTION get_elfkind RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.elfkind;
	
END get_elfkind;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as elf).to_string || '[' || self.elfkind || ']';

END to_string;

END;
/

--Teleri subtype
----------------

CREATE OR REPLACE TYPE teleri UNDER elf

( elfkind VARCHAR2(20)
, CONSTRUCTOR FUNCTION teleri (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 ) RETURN SELF AS RESULT
, MEMBER FUNCTION get_elfkind RETURN VARCHAR2
, MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2)
, OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2)

INSTANTIABLE NOT FINAL;

/

--Teleri subtype implementation
-------------------------------

CREATE or REPLACE TYPE BODY teleri IS

--Teleri subtype constructor
CONSTRUCTOR FUNCTION teleri (oid NUMBER, oname VARCHAR2, name VARCHAR2, genus VARCHAR2, elfkind VARCHAR2 )
RETURN SELF AS RESULT IS
    
	BEGIN
    
        self.oid := oid;               --assigns local parameters to self instances, including the new attribute
        self.oname := oname;
        self.name := name;
	    self.genus := genus;
		self.elfkind := elfkind;
		
    RETURN;

END;

--Logic for the set_elfkind procedure
MEMBER PROCEDURE set_elfkind (elfkind VARCHAR2) IS
    
	BEGIN

    self.elfkind := elfkind;

END set_elfkind;

--Logic for the get_elfkind function
MEMBER FUNCTION get_elfkind RETURN VARCHAR2 IS

    BEGIN
	
	RETURN self.elfkind;
	
END get_elfkind;

--Logic for the overridden to_string function
OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    
	BEGIN

    --This first calls the base object's to_string function, to which the new instance variable is added
    RETURN (self as elf).to_string || '[' || self.elfkind || ']';

END to_string;

END;
/

------------------------------------
--PART 5
------------------------------------


--Insert the data into the tolkien table

INSERT ALL
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, man(1, 'Man', 'Boromir', 'Men'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, man(2, 'Man', 'Faramir', 'Men'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, hobbit(3, 'Hobbit', 'Bilbo', 'Hobbits'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, hobbit(4, 'Hobbit', 'Frodo', 'Hobbits'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, hobbit(5, 'Hobbit', 'Merry', 'Hobbits'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, hobbit(6, 'Hobbit', 'Pippin', 'Hobbits'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, hobbit(7, 'Hobbit', 'Samwise', 'Hobbits'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, dwarf(8, 'Dwarf', 'Gimli', 'Dwarves'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, noldor(9, 'Elf', 'Feanor', 'Elves', 'Noldor'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, silvan(10, 'Elf', 'Tauriel', 'Elves', 'Silvan'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, teleri(11, 'Elf', 'Earwen', 'Elves', 'Teleri'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, teleri(12, 'Elf', 'Celeborn', 'Elves', 'Teleri'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, sindar(13, 'Elf', 'Thranduil', 'Elves', 'Sindar'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, sindar(14, 'Elf', 'Legolas', 'Elves', 'Sindar'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, orc(15, 'Orc', 'Azog the Defiler', 'Orcs'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, orc(16, 'Orc', 'Bolg', 'Orcs'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, maia(17, 'Maia', 'Gandalf the Grey', 'Maiar'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, maia(18, 'Maia', 'Radagast the Brown', 'Maiar'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, maia(19, 'Maia', 'Saruman the White', 'Maiar'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, goblin(20, 'Goblin', 'The Great Goblin', 'Goblin'))
    INTO tolkien (tolkien_oid, character) VALUES (tolkien_s1.nextval, man(21, 'Man', 'Aragorn', 'Men'))	
SELECT * FROM DUAL;
CREATE OR REPLACE PACKAGE TABLE_LOC AS
	-- Record Type used to define columns for the pipelined output.
	TYPE rec_loc IS RECORD
	  (loc       loc.loc%TYPE,
	   loc_desc  loc.loc_desc%TYPE);

	-- Table type used to define the table output.
        TYPE tt_rec_loc IS TABLE OF rec_loc;

	-- Function to generate the pipelined output.
        FUNCTION Location_List   (start_range_  loc.loc%TYPE,
                        end_range_    loc.loc%TYPE) RETURN tt_rec_loc PIPELINED;

END TABLE_LOC;
/

CREATE OR REPLACE PACKAGE BODY TABLE_LOC AS
  FUNCTION Location_List(start_range_  loc.loc%TYPE,
                        end_range_    loc.loc%TYPE) RETURN tt_rec_loc PIPELINED  IS

  CURSOR cr_loc IS
    SELECT loc,
          loc_desc
    FROM   loc
    WHERE  loc >= start_range_
    AND loc <= end_range_
    ORDER BY loc;

    l_row  rec_loc;

  BEGIN

	FOR r_loc IN cr_loc LOOP

	   i loc.loc%TYPE;
       	   i := r_loc.loc;

	   -- Build up a new row.
      	   l_row.start_no :=  i;
           l_row.description  := 'The location of ' || i || ' is ' || r_loc.loc_desc;

           -- Pipe the row out.
           PIPE ROW (l_row);
	END LOOP;  

 	-- Perform return.
    RETURN;
  END Location_List;

END TABLE_LOC;
/

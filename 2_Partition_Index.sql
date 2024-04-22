o	CREATE INDEX i_part_dept ON item_loc_soh(dept)
o	   GLOBAL PARTITION BY RANGE(dept)
o	      ( PARTITION p_10 VALUES LESS THAN (10)
o	      , PARTITION p_20 VALUES LESS THAN (20)
o	      , PARTITION p_30 VALUES LESS THAN (30)
o	      , PARTITION p_40 VALUES LESS THAN (40)
o	      , PARTITION p_50 VALUES LESS THAN (50)
o	      , PARTITION p_greater_than_50 VALUES LESS THAN (maxvalue)
o	      );

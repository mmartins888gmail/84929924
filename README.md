# 84929924
oracle test
--Define primary keys, constraints, and indexes for each table
1_Primary_Keys.sql

-- Suggestion to partition large tables like item_loc_soh to improve query performance 
2_Partition_Index.sql

-- To avoid row contention, the suggestion is to optimizing SQL queries, e.g. avoiding bitmap indexed due to its maintaining time

-- Create a view that can be used at screen level to show only the required fields
4_create_view.sql

--Create a new table that associates user to existing dept(s)
5_create_users_table.sql

--Create a package with procedure or function that can be invoked by store or all stores to save the item_loc_soh to a new table that will contain the same information plus the stock value per item/loc (unit_cost*stock_on_hand)
6_package_new_table.sql

--Create a package with a pipeline function to be used in the location list of values (drop down)
8_package_pipelined.sql


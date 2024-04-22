create table new_table(
item varchar2(25) not null,
loc number(10) not null,
dept number(4) not null,
unit_cost number(20,4) not null,
stock_on_hand number(12,4) not null,
calculated_col number(32,4) not null
);

CREATE OR REPLACE PACKAGE item_stock_pkg AS
    PROCEDURE save_item_stock;
END item_stock_pkg;
/
CREATE OR REPLACE PACKAGE BODY item_stock_pkg AS
    PROCEDURE save_item_stock IS
    BEGIN
    INSERT INTO new_table (item, loc, dept, unit_cost, stock_on_hand, calculated_col)
    SELECT item, loc, dept, unit_cost, stock_on_hand, (unit_cost*stock_on_hand)
    FROM item_loc_soh;
    
    COMMIT;

    END save_item_stock;
END item_stock_pkg;
/


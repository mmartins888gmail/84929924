CREATE TABLE user_dept (
    user_id NUMBER PRIMARY KEY,
    item varchar2(25),
    dept_id NUMBER,
    CONSTRAINT fk_item_dept FOREIGN KEY (item) REFERENCES item(item)
);

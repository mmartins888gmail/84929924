ALTER TABLE item ADD CONSTRAINT pk_item PRIMARY KEY (item);
ALTER TABLE loc ADD CONSTRAINT pk_loc PRIMARY KEY (loc);
ALTER TABLE item_loc_soh ADD CONSTRAINT pk_item_loc_soh PRIMARY KEY (item, loc);
ALTER TABLE item_loc_soh ADD CONSTRAINT fk_item FOREIGN KEY (item)  REFERENCES item (item);
ALTER TABLE item_loc_soh ADD CONSTRAINT fk_loc FOREIGN KEY (loc)  REFERENCES loc (loc);
CREATE INDEX "i_item_loc_soh_dept" ON item_loc_soh ("DEPT")

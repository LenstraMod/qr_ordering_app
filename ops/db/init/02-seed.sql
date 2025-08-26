INSERT INTO TABLES(code,name) VALUES ('T-01','Table 1'), ('T-02', 'Table 2'), ('T-02', 'Table 3');

INSERT INTO menu_categories(name, sort_order) VALUES ('Drinks', 1), ('Foods', 2);

INSERT INTO menu_items(category_id,name,price,is_available,description) VALUES
  (1,'Iced Tea',12000,1,'Sweet iced tea'),
  (1,'Latte',25000,1,'Hot or iced'),
  (1,'Mineral Water',8000,1,'Bottled'),
  (2,'Fried Rice',28000,1,'House special'),
  (2,'Chicken Katsu',32000,1,'Crispy'),
  (2,'French Fries',18000,1,'Salted');
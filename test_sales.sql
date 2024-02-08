TRUNCATE TABLE sales_tb;
INSERT INTO sales_tb (customer, amount)
VALUES 
    ('John', 100), 
    ('Jane', 200), 
    ('John', 150), 
    ('Jane', 50), 
    ('Jim', 300);

DELETE FROM sales_tb WHERE amount='100';
DELETE FROM sales_tb WHERE amount='50';

UPDATE sales_tb 
SET
amount='250' WHERE customer='Jane';

UPDATE sales_tb 
SET
amount='250' WHERE customer='John';

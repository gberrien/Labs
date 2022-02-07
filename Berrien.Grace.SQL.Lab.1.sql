#1. Write a query to get Product name and quantity/unit.  
Select northwind.products.product_name, northwind.products.quantity_per_unit FROM northwind.products;

#2. Write a query to get current Product list (Product ID and name).  
Select northwind.products.product_name, northwind.products.id FROM northwind.products;

#3. Write a query to get discontinued Product list (Product ID and name). 
Select northwind.products.product_name, northwind.products.id FROM northwind.products WHERE discontinued = TRUE;

#4. Write a query to get most expense and least expensive Product list (name and unit price). 
#https://stackoverflow.com/questions/54776347/sql-get-min-and-max-value-in-one-column
Select northwind.products.product_name, northwind.products.list_price FROM northwind.products 
WHERE northwind.products.list_price IN ((SELECT MAX(northwind.products.list_price) FROM northwind.products), 
(SELECT MIN(northwind.products.list_price) FROM northwind.products));

#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20. 
Select northwind.products.id, northwind.products.product_name, northwind.products.list_price FROM northwind.products 
WHERE northwind.products.list_price<20;
 
#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25. 
Select northwind.products.id, northwind.products.product_name, northwind.products.list_price FROM northwind.products 
WHERE northwind.products.list_price>15 AND northwind.products.list_price<25;
 
#7. Write a query to get Product list (name, unit price) of above average price.  
Select northwind.products.id, northwind.products.product_name, northwind.products.list_price FROM northwind.products 
WHERE northwind.products.list_price> (SELECT AVG(northwind.products.list_price) FROM northwind.products);

#8. Write a query to get Product list (name, unit price) of ten most expensive products.  
#https://www.w3schools.com/sql/sql_orderby.asp
SELECT northwind.products.product_name, northwind.products.list_price FROM northwind.products 
ORDER BY northwind.products.list_price DESC LIMIT 10;

#9. Write a query to count current and discontinued products. 
#Questionable- have to include discontinued products because I know (?) that it's zero from above?
SELECT COUNT(northwind.products.product_name) FROM northwind.products;

#10. Write a query to get Product list (name, units on order, units in stock) of stock is less than the quantity on order.  
SELECT northwind.products.product_name, northwind.order_details.quantity as unitsOnOrder, northwind.inventory_transactions.quantity as unitsInStock
FROM northwind.products, northwind.order_details, northwind.inventory_transactions WHERE northwind.inventory_transactions.quantity<northwind.order_details.quantity;

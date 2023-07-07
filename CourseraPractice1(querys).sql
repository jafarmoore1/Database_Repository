select orders.order_id , orders.order_date , orders.total , User1.username , order_items.quantity ,product.price , product.productname
FROM orders
JOIN  User1 ON orders.user_id = User1.user_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN product ON order_items.product_id = product.product_id;

select  User1.username , COUNT(orders.user_id) AS totalorders
FROM orders
JOIN User1 ON orders.user_id = User1.user_id
GROUP BY User1.username;

 
SELECT category.categoryname, SUM(product.price * order_items.quantity) AS total_revenue
FROM category
JOIN productcategory ON category.categoryid = productcategory.categoryid
JOIN product ON productcategory.product_id = product.product_id
JOIN order_items ON product.product_id = order_items.product_id
GROUP BY category.categoryname;

/*USERS WHO HAVE NOT PLACED AN ORDER*/

 select User1.username, User1.email 
 FROM User1
 JOIN  orders ON User1.user_id = orders.user_id
 WHERE orders.user_id  IS NULL;
 
/*Retrieve the top 5 bestselling products based on the total quantity sold*/

select product.productname , order_items.quantity 
FROM product
JOIN order_items ON product.product_id = order_items.product_id
GROUP BY order_items.quantity , product.productname



 

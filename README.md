Business questions and SQL solutions
Business question 1: How to know how many companies supply products to Shopee?
SQL solution:

Explain:
In the above SQL query, we use the COUNT(DISTINCT) Function to count the number of unique values in the 'Suppliers_ID' column of the Suppliers table
The query will return results with the ‘total_suppliers’ column containing the number of companies supplying the product

Business question 2: How to know which region has the largest number of customers?
SQL solution:

Explain:
In the above query:
- We use the SELECT TOP 1 statement to only get the area with the largest number of customers.
- We select the "region" column from the "customers" table.
- The COUNT(customer_id) statement is used to count the number of customers in each region.
- The GROUP BY statement is used to group rows by "region".
- The ORDER BY statement is used to sort results by number of customers in descending order.

Business question 3: "How do I see the number of orders placed during a specific period on Shopee?"
SQL solution:

Explain:
In the above query:
- We use the SELECT COUNT(order_id) statement to count the number of orders in the "orders" table.
- The WHERE statement is used to retrieve only orders within a specific time period. Replace 'start_date' and 'end_date' with the start and end date values of the desired time period.

Business question 4: "How to filter out discounted products from the rest?"
SQL solution:

Explain:
- We use the SELECT statement to select the "product_id", "product_name" and "discountined" columns of the product.
- The WHERE statement is used to filter products based on conditions. In the case of filtering discounted products, we use the condition "discounted > 0" to get discounted products. Or if you want to filter products without discounts, change the condition to "discounted = 0".

Business question 5: "How to see which customers place the most orders in a month?"
SQL solution:

In the above query:
- We use the SELECT statement to get information about customers, number of orders and use TOP 1 to only get the top customer.
- Use a JOIN statement to join the "customers" and "orders" tables based on the "customer_id" column.
- The WHERE statement is used to retrieve only orders in the desired month. Replace 'month_value' with the specific month.
- The GROUP BY statement is used to group lines by customer.
- The ORDER BY statement is used to sort results by order number in descending order.

Business Question #6: Find the total number of orders each customer placed.
SQL solution:

Explanation: This SQL statement selects the customer ID and order quantity for each customer from the "Orders" table. The GROUP BY clause groups the results by customer ID, and the COUNT function counts the number of orders for each customer.

Business Question #7: Find the name and quantity of a product that has been ordered at least once.
SQL solution:

Explanation: This statement retrieves the product name and total order quantity for each product from the "Products" and "Order Details" tables. The JOIN clause combines two tables based on product ID, and the GROUP BY clause groups the results by product name. HAVING filters out products that have not been ordered (quantity greater than 0).

Business question #8: List the top 5 customers who order the most.
SQL solution:

Explanation: This statement finds the 5 customers with the most orders. It counts the number of orders per customer, sorts the results in descending order based on total orders, then uses LIMIT 5 to select only the top 5 rows.

Business Question #9: Find the average order value.
SQL solution:

Explanation: This statement calculates the average order value by first calculating the total price for each order in a subquery, then finding the average of those price totals using the AVG function in the query. main issue.

Business Question #10: Find the employee with the highest gross revenue.
SQL solution:

Explanation: This statement finds the employee with the highest total sales by joining the "Employees", "Orders" and "Order Details" tables, calculating the total sales for each employee, Sort the results in descending order based on total sales and limit the results to top employees.

Business Question #12: List customers who have placed orders for more than $10,000.
SQL solution:

Explanation: This statement lists customers who have placed orders for more than $10,000 by combining the "Customers", "Orders", and "Order Details" tables, calculating the total amount spent for per customer and use the HAVING clause to filter results with total spend exceeding $10,000.

Business Question #13: Find the percentage of orders with a discount.
SQL solution:

Explanation: This statement calculates the percentage of orders with discounts by using a CASE statement to count orders with discounts and dividing by the total number of orders in the "OrderDetails" table.

Business question #14: Find customers who place orders consecutively, with the time between consecutive orders being less than 3 days.
SQL solution:

Explanation: This query statement uses a Common Table Expression to identify orders with corresponding order dates and subsequent order dates for the same customer. The final query selects distinct customer IDs along with the first and second order dates for consecutive orders with less than 3 days between them.

Business Question #15: Find products priced above the average price.
SQL solution:

Explanation: This query retrieves products with a price higher than the average price by comparing each product's unit price with the average unit price calculated by the subquery.

Business Question #16: Find the total number of orders in each year.
SQL solution:

Explanation: This query finds the total number of orders placed in each year by extracting the year from the order date and using GROUP BY.

Business question #17: “Find the employee with the highest level of politeness”?
SQL solution:

Explain:
In the above query:
- We use the SELECT statement to get information about employees.
- Use the TOP 1 statement to get only a single result line (employee with the highest title of courtesy).
- Columns "EmployeeID", "FirstName", "LastName" and "Title_Of_Courtesy" are information about the employee.
- The ORDER BY statement is used to sort results by column "Title_Of_Courtesy" in descending order (DESC).

SELECT firstname, lastname, SUM(totalamount) as sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  HAVING SUM(totalamount) = (SELECT MAX(sumtotalamount) 
  FROM (SELECT SUM(totalamount) AS sumtotalamount FROM orders 
     GROUP BY customerid));

	 
SELECT firstname, lastname, orderid, totalamount 
 FROM customers JOIN orders ON customers.customerid = orders.customerid
  WHERE customers.customerid = (SELECT customerid FROM orders GROUP BY customerid
   HAVING SUM(totalamount) = (SELECT MAX(sumtotalamount) 
    FROM (SELECT SUM(totalamount) AS sumtotalamount FROM orders GROUP BY customerid)))
 ORDER BY totalamount DESC;

 SELECT firstname, lastname, SUM(totalamount) AS sumtotalamount 
  FROM customers JOIN orders ON customers.customerid = orders.customerid
  GROUP BY firstname, lastname
  HAVING SUM(totalamount) > (SELECT avg(totalamount) FROM orders) ORDER BY sumtotalamount;



SELECT k.fio AS ФИО_клиента, 
       SUM(m.daily_cost * p.number_of_days) AS Суммарная_стоимость
FROM Клиенты k
JOIN Поездки p ON k.id = p.client_id
JOIN Маршруты m ON p.route_id = m.id
GROUP BY k.fio
ORDER BY Суммарная_стоимость DESC;

SELECT k.fio AS ФИО_клиента, 
       SUM(m.daily_cost * p.number_of_days) AS Суммарная_стоимость,
       SUM(m.daily_cost * p.number_of_days) / SUM(p.number_of_days) AS Средняя_стоимость
FROM Клиенты k
JOIN Поездки p ON k.id = p.client_id
JOIN Маршруты m ON p.route_id = m.id
GROUP BY k.fio
ORDER BY Суммарная_стоимость DESC;

SELECT k.fio AS ФИО_клиента, 
       SUM(m.daily_cost * p.number_of_days) AS Суммарная_стоимость,
       SUM(m.daily_cost * p.number_of_days) / NULLIF(SUM(p.number_of_days), 0) AS Средняя_стоимость
FROM Клиенты k
JOIN Поездки p ON k.id = p.client_id
JOIN Маршруты m ON p.route_id = m.id
GROUP BY k.fio
HAVING SUM(m.daily_cost * p.number_of_days) = (
    SELECT MAX(total_amount)
    FROM (SELECT SUM(m2.daily_cost * p2.number_of_days) AS total_amount
          FROM Клиенты k2
          JOIN Поездки p2 ON k2.id = p2.client_id
          JOIN Маршруты m2 ON p2.route_id = m2.id
          GROUP BY k2.fio) AS subquery
)
ORDER BY Суммарная_стоимость DESC;

SELECT 
    k.id AS ID_клиента,  
    k.fio AS ФИО_клиента,
    SUM(m.daily_cost * p.number_of_days) AS Суммарная_стоимость,
    SUM(m.daily_cost * p.number_of_days) / NULLIF(SUM(p.number_of_days), 0) AS Средняя_стоимость
FROM 
    Клиенты k
JOIN 
    Поездки p ON k.id = p.client_id  
JOIN 
    Маршруты m ON p.route_id = m.id  
GROUP BY 
    k.id, k.fio 
ORDER BY 
    Суммарная_стоимость DESC;

SELECT 
    k.fio AS ФИО_клиента,  
    SUM(m.daily_cost * p.number_of_days) AS Суммарная_стоимость_заказов 
FROM 
    Клиенты k
JOIN 
    Поездки p ON k.id = p.client_id  
JOIN 
    Маршруты m ON p.route_id = m.id  
GROUP BY 
    k.id, k.fio  
HAVING 
    SUM(m.daily_cost * p.number_of_days) > (SELECT AVG(m.daily_cost * p.number_of_days) FROM Поездки p JOIN Маршруты m ON p.route_id = m.id)  -- Сравниваем с средней стоимостью
ORDER BY 
    Суммарная_стоимость_заказов DESC;





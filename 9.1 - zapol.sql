CREATE TABLE Customers(
CustomerID SERIAL PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastNAME VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Orders(
OrderID SERIAL PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate TIMESTAMP NOT NULL DEFAULT NOW(),
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
OrderDetailID SERIAL PRIMARY KEY,
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL CHECK (Quantity > 0),
UnitPrice DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE);

-- Вставка новых клиентов
INSERT INTO Customers (FirstName, LastNAME, Email) VALUES
('Анна', 'Ковалёва', 'anna.kovaleva@example.com'),
('Игорь', 'Семенов', 'igor.semenov@example.com'),
('Елена', 'Сидорова', 'elena.sidorova@example.com'),
('Дмитрий', 'Федосеев', 'dmitry.fedoseev@example.com'),
('Ольга', 'Смирнова', 'olga.smirnova@example.com'),
('Станислав', 'Громов', 'stanislav.gromov@example.com'),
('Ксения', 'Лебедева', 'ksenia.lebedjeva@example.com'),
('Наталья', 'Ромашкина', 'natalia.romashkina@example.com'),
('Максим', 'Тихонов', 'maxim.tikhonov@example.com'),
('Анастасия', 'Григорьева', 'anastasia.grigorieva@example.com'),
('Александр', 'Панфилов', 'alexander.panfilov@example.com'),
('Татьяна', 'Сергеевна', 'tatiana.sergeevna@example.com'),
('Юрий', 'Кузнецов', 'yuri.kuznetsov@example.com'),
('Ирина', 'Морозова', 'irina.morozova@example.com'),
('Виктор', 'Калинин', 'viktor.kalinin@example.com'),
('Кирилл', 'Савельев', 'kirill.savelyev@example.com'),
('Марина', 'Петрова', 'marina.petrovna@example.com'),
('Сергей', 'Ларионов', 'sergey.larionov@example.com'),
('Людмила', 'Зайцева', 'lyudmila.zaytseva@example.com'),
('Роман', 'Алексеев', 'roman.alekseev@example.com');

-- Вставка новых заказов
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-01-15 14:30:00', 50.00),
(2, '2024-02-20 11:00:00', 75.00),
(3, '2024-03-25 16:45:00', 20.00),
(4, '2024-04-30 09:15:00', 100.00),
(5, '2024-05-05 13:00:00', 45.50),
(6, '2024-06-10 10:10:00', 60.00),
(7, '2024-07-15 12:00:00', 80.00),
(8, '2024-08-20 15:30:00', 35.00),
(9, '2024-09-25 10:45:00', 55.00),
(10, '2024-10-30 14:00:00', 90.00),
(11, '2024-11-05 11:30:00', 22.00),
(12, '2024-12-10 13:15:00', 30.00),
(13, '2024-01-12 09:00:00', 70.00),
(14, '2024-02-18 11:20:00', 40.00),
(15, '2024-03-22 12:40:00', 50.50),
(16, '2024-04-28 16:10:00', 25.00),
(17, '2024-05-15 09:30:00', 15.00),
(18, '2024-06-20 14:50:00', 95.00),
(19, '2024-07-25 10:00:00', 35.75),
(20, '2024-08-30 12:15:00', 80.00);

-- Вставка новых деталей заказов
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 50.00),
(1, 2, 1, 0.00),
(2, 3, 2, 37.50),
(2, 4, 1, 37.50),
(3, 1, 1, 20.00),
(3, 5, 1, 20.00),
(4, 2, 2, 50.00),
(4, 3, 1, 50.00),
(5, 4, 1, 45.50),
(5, 5, 1, 45.50),
(6, 1, 2, 30.00),
(6, 2, 1, 30.00),
(7, 3, 3, 40.00),
(8, 5, 1, 35.00),
(9, 1, 1, 55.00),
(10, 2, 1, 90.00),
(11, 3, 1, 22.00),
(12, 4, 1, 30.00),
(13, 5, 1, 70.00),
(14, 1, 1, 40.00);


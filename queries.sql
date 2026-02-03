
create table users(
  user_id int PRIMARY KEY,
  name VARCHAR(100) ,
  email VARCHAR(50),
  phone VARCHAR(100) ,
  role VARCHAR(20)
)



CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    model VARCHAR(50),
    registration_number VARCHAR(50),
    rental_price DECIMAL(10,2),
    status VARCHAR(20)
);




CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    total_cost DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);


INSERT INTO Users (user_id, name, email, phone, role) VALUES
(1, 'Rahim Uddin', 'rahim@example.com', '01711000001', 'customer'),
(2, 'Karim Islam', 'karim@example.com', '01711000002', 'customer'),
(3, 'Admin User', 'admin@example.com', '01711000003', 'admin');

INSERT INTO Vehicles (vehicle_id, name, type, model, registration_number, rental_price, status) VALUES
(1, 'Toyota Corolla', 'Sedan', '2020', 'DHAKA-METRO-12-1234', 2500.00, 'available'),
(2, 'Honda Civic', 'Sedan', '2019', 'DHAKA-METRO-14-4321', 2600.00, 'rented'),
(3, 'Suzuki Gixxer', 'Bike', '2021', 'DHAKA-METRO-BA-9988', 800.00, 'available');


INSERT INTO Bookings (booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost) VALUES
(4, 1, 1, '2024-02-01', '2024-02-03', 'completed', 7500.00),
(5, 2, 2, '2024-02-05', '2024-02-07', 'ongoing', 5200.00),
(6, 1, 3, '2024-02-10', '2024-02-11', 'booked', 1600.00);



INSERT INTO Vehicles VALUES
(5, 'Toyota Axio', 'Sedan', '2020', 'DHAKA-METRO-11-5555', 2400.00, 'available');


SELECT 
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id;

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);



SELECT *
FROM Vehicles
WHERE type = 'Sedan'
AND status = 'available';



SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
JOIN Bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 1;
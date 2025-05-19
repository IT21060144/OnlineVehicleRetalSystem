CREATE DATABASE IF NOT EXISTS ridenest_db;
USE ridenest_db;

CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_name VARCHAR(100),
    brand VARCHAR(50),
    model VARCHAR(50),
    vehicle_type VARCHAR(50),
    cost_per_km DECIMAL(10, 2),
    availability_status VARCHAR(50),
    description VARCHAR(255)
);

INSERT INTO vehicles (vehicle_name, brand, model, vehicle_type, cost_per_km, availability_status, description) VALUES
('Civic Sport', 'Honda', 'Civic', 'Sedan', 30.00, 'Available', 'Stylish sedan with sporty performance'),
('Fortuner 4x4', 'Toyota', 'Fortuner', 'SUV', 55.00, 'Available', 'Powerful SUV for off-road and long drives'),
('Ertiga Tour', 'Maruti Suzuki', 'Ertiga', 'MPV', 28.00, 'Booked', 'Ideal for group travel with good mileage'),
('Pulsar 150', 'Bajaj', 'Pulsar', 'Motorbike', 12.00, 'Available', 'Popular commuter bike for city rides'),
('Activa 6G', 'Honda', 'Activa', 'Scooter', 10.00, 'Unavailable', 'Reliable gearless scooter for urban mobility'),
('i20 Sportz', 'Hyundai', 'i20', 'Hatchback', 25.50, 'Maintenance', 'Premium hatchback with comfort and features');
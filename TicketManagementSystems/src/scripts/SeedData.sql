# Database Initialization Script with Seed Data
# Run this script after creating the database schema

-- =============================================
-- DATABASE: TicketManagement
-- PURPOSE: Initialize with seed data
-- =============================================

USE [TicketManagement];
GO

-- =============================================
-- 1. SEED USERS TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Users WHERE UserId = 1)
BEGIN
    SET IDENTITY_INSERT Users ON;
    
    INSERT INTO Users (UserId, Email, PasswordHash, FirstName, LastName, PhoneNumber, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 'admin@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Admin', 'User', '1001-000-0001', 1, GETDATE(), GETDATE()),
    (2, 'john.smith@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'John', 'Smith', '1001-000-0002', 1, GETDATE(), GETDATE()),
    (3, 'sarah.johnson@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Sarah', 'Johnson', '1001-000-0003', 1, GETDATE(), GETDATE()),
    (4, 'michael.brown@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Michael', 'Brown', '1001-000-0004', 1, GETDATE(), GETDATE()),
    (5, 'emily.davis@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Emily', 'Davis', '1001-000-0005', 1, GETDATE(), GETDATE()),
    (6, 'david.miller@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'David', 'Miller', '1001-000-0006', 1, GETDATE(), GETDATE()),
    (7, 'jessica.wilson@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Jessica', 'Wilson', '1001-000-0007', 1, GETDATE(), GETDATE()),
    (8, 'robert.moore@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Robert', 'Moore', '1001-000-0008', 1, GETDATE(), GETDATE()),
    (9, 'amanda.taylor@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Amanda', 'Taylor', '1001-000-0009', 1, GETDATE(), GETDATE()),
    (10, 'chris.anderson@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Christopher', 'Anderson', '1001-000-0010', 1, GETDATE(), GETDATE()),
    (11, 'rachel.thomas@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Rachel', 'Thomas', '1001-000-0011', 1, GETDATE(), GETDATE()),
    (12, 'james.jackson@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'James', 'Jackson', '1001-000-0012', 1, GETDATE(), GETDATE()),
    (13, 'laura.white@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Laura', 'White', '1001-000-0013', 1, GETDATE(), GETDATE()),
    (14, 'william.harris@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'William', 'Harris', '1001-000-0014', 1, GETDATE(), GETDATE()),
    (15, 'sophia.martin@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Sophia', 'Martin', '1001-000-0015', 1, GETDATE(), GETDATE()),
    (16, 'daniel.garcia@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Daniel', 'Garcia', '1001-000-0016', 1, GETDATE(), GETDATE()),
    (17, 'olivia.rodriguez@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Olivia', 'Rodriguez', '1001-000-0017', 1, GETDATE(), GETDATE()),
    (18, 'matthew.jones@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Matthew', 'Jones', '1001-000-0018', 1, GETDATE(), GETDATE()),
    (19, 'ava.lee@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Ava', 'Lee', '1001-000-0019', 1, GETDATE(), GETDATE()),
    (20, 'ethan.walker@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Ethan', 'Walker', '1001-000-0020', 1, GETDATE(), GETDATE()),
    (21, 'isabella.hall@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Isabella', 'Hall', '1001-000-0021', 1, GETDATE(), GETDATE()),
    (22, 'mason.young@ticketmanagement.local', '$2a$11$K1HZtRYbqLfArclyJ7sZZ.vPrn2JeBT/r2mHmwKdlYJPVQ1CfQlGS', 'Mason', 'Young', '1001-000-0022', 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Users OFF;
END
GO

-- =============================================
-- 2. SEED BUSES TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Buses WHERE BusId = 1)
BEGIN
    SET IDENTITY_INSERT Buses ON;
    
    INSERT INTO Buses (BusId, BusNumber, Model, Manufacturer, Capacity, Year, LicensePlate, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 'BUS001', 'Volvo B11R', 'Volvo', 50, 2020, 'TMS-001', 1, GETDATE(), GETDATE()),
    (2, 'BUS002', 'Mercedes OH1526', 'Mercedes-Benz', 48, 2021, 'TMS-002', 1, GETDATE(), GETDATE()),
    (3, 'BUS003', 'Tata 1518', 'Tata Motors', 45, 2022, 'TMS-003', 1, GETDATE(), GETDATE()),
    (4, 'BUS004', 'Scania K360', 'Scania', 52, 2019, 'TMS-004', 1, GETDATE(), GETDATE()),
    (5, 'BUS005', 'MAN TGX', 'MAN', 46, 2020, 'TMS-005', 1, GETDATE(), GETDATE()),
    (6, 'BUS006', 'Volvo B7R', 'Volvo', 50, 2021, 'TMS-006', 1, GETDATE(), GETDATE()),
    (7, 'BUS007', 'Ashok Leyland', 'Ashok Leyland', 42, 2020, 'TMS-007', 1, GETDATE(), GETDATE()),
    (8, 'BUS008', 'Hyundai Universe', 'Hyundai', 48, 2022, 'TMS-008', 1, GETDATE(), GETDATE()),
    (9, 'BUS009', 'Isuzu Giga', 'Isuzu', 44, 2021, 'TMS-009', 1, GETDATE(), GETDATE()),
    (10, 'BUS010', 'Fuso Super Great', 'Mitsubishi', 40, 2020, 'TMS-010', 1, GETDATE(), GETDATE()),
    (11, 'BUS011', 'Volvo B9R', 'Volvo', 51, 2022, 'TMS-011', 1, GETDATE(), GETDATE()),
    (12, 'BUS012', 'Mercedes Actros', 'Mercedes-Benz', 47, 2021, 'TMS-012', 1, GETDATE(), GETDATE()),
    (13, 'BUS013', 'Tata 1518L', 'Tata Motors', 45, 2020, 'TMS-013', 1, GETDATE(), GETDATE()),
    (14, 'BUS014', 'Scania K410', 'Scania', 53, 2022, 'TMS-014', 1, GETDATE(), GETDATE()),
    (15, 'BUS015', 'MAN TGA', 'MAN', 46, 2019, 'TMS-015', 1, GETDATE(), GETDATE()),
    (16, 'BUS016', 'Volvo B10M', 'Volvo', 50, 2021, 'TMS-016', 1, GETDATE(), GETDATE()),
    (17, 'BUS017', 'Ashok Leyland Viking', 'Ashok Leyland', 43, 2022, 'TMS-017', 1, GETDATE(), GETDATE()),
    (18, 'BUS018', 'Hyundai County', 'Hyundai', 35, 2020, 'TMS-018', 1, GETDATE(), GETDATE()),
    (19, 'BUS019', 'Isuzu ELF', 'Isuzu', 30, 2021, 'TMS-019', 1, GETDATE(), GETDATE()),
    (20, 'BUS020', 'Fuso Canter', 'Mitsubishi', 28, 2020, 'TMS-020', 1, GETDATE(), GETDATE()),
    (21, 'BUS021', 'Volvo FH12', 'Volvo', 50, 2022, 'TMS-021', 1, GETDATE(), GETDATE()),
    (22, 'BUS022', 'Mercedes Setra', 'Mercedes-Benz', 55, 2021, 'TMS-022', 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Buses OFF;
END
GO

-- =============================================
-- 3. SEED ROUTES TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Routes WHERE RouteId = 1)
BEGIN
    SET IDENTITY_INSERT Routes ON;
    
    INSERT INTO Routes (RouteId, RouteName, StartLocation, EndLocation, Distance, BaseFare, Description, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 'New York - Boston', 'New York, NY', 'Boston, MA', 215, 45.00, 'Popular Northeast corridor', 1, GETDATE(), GETDATE()),
    (2, 'Boston - Philadelphia', 'Boston, MA', 'Philadelphia, PA', 305, 55.00, 'Mid-Atlantic connection', 1, GETDATE(), GETDATE()),
    (3, 'Philadelphia - Washington', 'Philadelphia, PA', 'Washington, DC', 140, 35.00, 'Capital connection', 1, GETDATE(), GETDATE()),
    (4, 'Washington - Atlanta', 'Washington, DC', 'Atlanta, GA', 640, 85.00, 'Southeast major route', 1, GETDATE(), GETDATE()),
    (5, 'Atlanta - Miami', 'Atlanta, GA', 'Miami, FL', 660, 95.00, 'Florida connection', 1, GETDATE(), GETDATE()),
    (6, 'Chicago - Detroit', 'Chicago, IL', 'Detroit, MI', 280, 50.00, 'Midwest corridor', 1, GETDATE(), GETDATE()),
    (7, 'Detroit - Toronto', 'Detroit, MI', 'Toronto, ON', 235, 40.00, 'Cross-border route', 1, GETDATE(), GETDATE()),
    (8, 'Toronto - Montreal', 'Toronto, ON', 'Montreal, QC', 335, 60.00, 'Canada major route', 1, GETDATE(), GETDATE()),
    (9, 'Montreal - Boston', 'Montreal, QC', 'Boston, MA', 305, 55.00, 'Northeast international', 1, GETDATE(), GETDATE()),
    (10, 'Los Angeles - San Francisco', 'Los Angeles, CA', 'San Francisco, CA', 383, 75.00, 'California corridor', 1, GETDATE(), GETDATE()),
    (11, 'San Francisco - Seattle', 'San Francisco, CA', 'Seattle, WA', 808, 110.00, 'Pacific coast route', 1, GETDATE(), GETDATE()),
    (12, 'Seattle - Portland', 'Seattle, WA', 'Portland, OR', 174, 40.00, 'Pacific Northwest', 1, GETDATE(), GETDATE()),
    (13, 'Portland - San Francisco', 'Portland, OR', 'San Francisco, CA', 635, 95.00, 'West coast south', 1, GETDATE(), GETDATE()),
    (14, 'Denver - Dallas', 'Denver, CO', 'Dallas, TX', 1040, 130.00, 'Central US route', 1, GETDATE(), GETDATE()),
    (15, 'Dallas - Houston', 'Dallas, TX', 'Houston, TX', 240, 45.00, 'Texas connector', 1, GETDATE(), GETDATE()),
    (16, 'Houston - New Orleans', 'Houston, TX', 'New Orleans, LA', 348, 65.00, 'South Gulf route', 1, GETDATE(), GETDATE()),
    (17, 'New Orleans - Memphis', 'New Orleans, LA', 'Memphis, TN', 450, 75.00, 'Mississippi valley', 1, GETDATE(), GETDATE()),
    (18, 'Memphis - Chicago', 'Memphis, TN', 'Chicago, IL', 450, 75.00, 'Central US north', 1, GETDATE(), GETDATE()),
    (19, 'Las Vegas - Los Angeles', 'Las Vegas, NV', 'Los Angeles, CA', 270, 50.00, 'Nevada corridor', 1, GETDATE(), GETDATE()),
    (20, 'Phoenix - Las Vegas', 'Phoenix, AZ', 'Las Vegas, NV', 300, 55.00, 'Arizona connection', 1, GETDATE(), GETDATE()),
    (21, 'San Diego - Los Angeles', 'San Diego, CA', 'Los Angeles, CA', 120, 25.00, 'Southern California', 1, GETDATE(), GETDATE()),
    (22, 'Miami - Tampa', 'Miami, FL', 'Tampa, FL', 280, 50.00, 'Florida coast', 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Routes OFF;
END
GO

-- =============================================
-- 4. SEED SCHEDULES TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Schedules WHERE ScheduleId = 1)
BEGIN
    SET IDENTITY_INSERT Schedules ON;
    
    INSERT INTO Schedules (ScheduleId, RouteId, BusId, DepartureTime, ArrivalTime, Fare, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 1, 1, '2024-01-10 08:00:00', '2024-01-10 14:30:00', 45.00, 1, GETDATE(), GETDATE()),
    (2, 1, 2, '2024-01-10 10:00:00', '2024-01-10 16:30:00', 48.00, 1, GETDATE(), GETDATE()),
    (3, 1, 3, '2024-01-10 14:00:00', '2024-01-10 20:30:00', 45.00, 1, GETDATE(), GETDATE()),
    (4, 2, 4, '2024-01-10 06:00:00', '2024-01-10 13:00:00', 58.00, 1, GETDATE(), GETDATE()),
    (5, 2, 5, '2024-01-10 12:00:00', '2024-01-10 19:00:00', 55.00, 1, GETDATE(), GETDATE()),
    (6, 3, 6, '2024-01-10 07:00:00', '2024-01-10 10:00:00', 35.00, 1, GETDATE(), GETDATE()),
    (7, 3, 7, '2024-01-10 15:00:00', '2024-01-10 18:00:00', 35.00, 1, GETDATE(), GETDATE()),
    (8, 4, 8, '2024-01-10 08:00:00', '2024-01-10 18:00:00', 85.00, 1, GETDATE(), GETDATE()),
    (9, 4, 9, '2024-01-10 20:00:00', '2024-01-11 06:00:00', 90.00, 1, GETDATE(), GETDATE()),
    (10, 5, 10, '2024-01-10 09:00:00', '2024-01-10 20:00:00', 98.00, 1, GETDATE(), GETDATE()),
    (11, 6, 11, '2024-01-10 06:00:00', '2024-01-10 12:00:00', 52.00, 1, GETDATE(), GETDATE()),
    (12, 6, 12, '2024-01-10 14:00:00', '2024-01-10 20:00:00', 50.00, 1, GETDATE(), GETDATE()),
    (13, 7, 13, '2024-01-10 08:00:00', '2024-01-10 12:00:00', 42.00, 1, GETDATE(), GETDATE()),
    (14, 7, 14, '2024-01-10 16:00:00', '2024-01-10 20:00:00', 42.00, 1, GETDATE(), GETDATE()),
    (15, 8, 15, '2024-01-10 07:00:00', '2024-01-10 14:00:00', 65.00, 1, GETDATE(), GETDATE()),
    (16, 8, 16, '2024-01-10 19:00:00', '2024-01-11 02:00:00', 65.00, 1, GETDATE(), GETDATE()),
    (17, 9, 17, '2024-01-10 09:00:00', '2024-01-10 16:00:00', 58.00, 1, GETDATE(), GETDATE()),
    (18, 10, 18, '2024-01-10 08:00:00', '2024-01-10 15:00:00', 78.00, 1, GETDATE(), GETDATE()),
    (19, 11, 19, '2024-01-10 10:00:00', '2024-01-11 03:00:00', 115.00, 1, GETDATE(), GETDATE()),
    (20, 12, 20, '2024-01-10 07:00:00', '2024-01-10 11:00:00', 42.00, 1, GETDATE(), GETDATE()),
    (21, 13, 21, '2024-01-10 12:00:00', '2024-01-11 00:00:00', 98.00, 1, GETDATE(), GETDATE()),
    (22, 14, 22, '2024-01-10 08:00:00', '2024-01-11 05:00:00', 135.00, 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Schedules OFF;
END
GO

-- =============================================
-- 5. SEED BOOKINGS TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Bookings WHERE BookingId = 1)
BEGIN
    SET IDENTITY_INSERT Bookings ON;
    
    INSERT INTO Bookings (BookingId, ScheduleId, UserId, PassengerName, PassengerEmail, PassengerPhone, Seats, TotalAmount, Status, BookedAt, TravelDate, CreatedAt, UpdatedAt)
    VALUES
    (1, 1, 2, 'John Smith', 'john.smith@example.com', '555-0001', '1,2,3', 135.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (2, 1, 3, 'Sarah Johnson', 'sarah.j@example.com', '555-0002', '4,5', 90.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (3, 2, 4, 'Michael Brown', 'mbrown@example.com', '555-0003', '1', 48.00, 'Pending', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (4, 2, 5, 'Emily Davis', 'edavis@example.com', '555-0004', '2,3,4', 144.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (5, 3, 6, 'David Miller', 'dmiller@example.com', '555-0005', '10,11,12,13,14', 225.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (6, 4, 7, 'Jessica Wilson', 'jwilson@example.com', '555-0006', '1', 58.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (7, 4, 8, 'Robert Moore', 'rmoore@example.com', '555-0007', '2,3', 116.00, 'Pending', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (8, 5, 9, 'Amanda Taylor', 'ataylor@example.com', '555-0008', '1,2,3,4', 220.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (9, 5, 10, 'Christopher Anderson', 'canderson@example.com', '555-0009', '5', 98.00, 'Cancelled', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (10, 6, 11, 'Rachel Thomas', 'rthomas@example.com', '555-0010', '1,2', 70.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (11, 7, 12, 'James Jackson', 'jjackson@example.com', '555-0011', '3,4,5', 105.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (12, 8, 13, 'Laura White', 'lwhite@example.com', '555-0012', '1', 85.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (13, 8, 14, 'William Harris', 'wharris@example.com', '555-0013', '2,3,4,5,6', 425.00, 'Pending', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (14, 9, 15, 'Sophia Martin', 'smartin@example.com', '555-0014', '10', 90.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (15, 10, 16, 'Daniel Garcia', 'dgarcia@example.com', '555-0015', '1,2,3,4', 392.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (16, 11, 17, 'Olivia Rodriguez', 'orodriguez@example.com', '555-0016', '5,6,7', 156.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (17, 12, 18, 'Matthew Jones', 'mjones@example.com', '555-0017', '1', 52.00, 'Pending', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (18, 13, 19, 'Ava Lee', 'alee@example.com', '555-0018', '2,3,4,5,6,7', 588.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (19, 14, 20, 'Ethan Walker', 'ewalker@example.com', '555-0019', '1,2', 270.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (20, 15, 21, 'Isabella Hall', 'ihall@example.com', '555-0020', '3', 65.00, 'Cancelled', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (21, 16, 22, 'Mason Young', 'myoung@example.com', '555-0021', '1,2,3,4,5', 325.00, 'Confirmed', GETDATE(), '2024-01-10', GETDATE(), GETDATE()),
    (22, 17, 2, 'John Smith', 'john.smith@example.com', '555-0001', '1', 58.00, 'Pending', GETDATE(), '2024-01-10', GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Bookings OFF;
END
GO

-- =============================================
-- 6. SEED DRIVERS TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Drivers WHERE DriverId = 1)
BEGIN
    SET IDENTITY_INSERT Drivers ON;
    
    INSERT INTO Drivers (DriverId, FirstName, LastName, LicenseNumber, LicenseExpiry, PhoneNumber, Email, DateOfBirth, Address, City, State, ZipCode, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 'John', 'Driver', 'DL12345001', '2026-12-31', '555-1001', 'john.driver@example.com', '1985-05-15', '123 Main St', 'New York', 'NY', '10001', 1, GETDATE(), GETDATE()),
    (2, 'Michael', 'Johnson', 'DL12345002', '2025-08-15', '555-1002', 'michael.j@example.com', '1988-08-22', '456 Oak Ave', 'Boston', 'MA', '02101', 1, GETDATE(), GETDATE()),
    (3, 'David', 'Smith', 'DL12345003', '2026-06-30', '555-1003', 'david.smith@example.com', '1980-03-10', '789 Elm St', 'Philadelphia', 'PA', '19101', 1, GETDATE(), GETDATE()),
    (4, 'Robert', 'Brown', 'DL12345004', '2025-12-31', '555-1004', 'robert.brown@example.com', '1982-07-18', '321 Pine Rd', 'Washington', 'DC', '20001', 1, GETDATE(), GETDATE()),
    (5, 'James', 'Miller', 'DL12345005', '2026-03-15', '555-1005', 'james.miller@example.com', '1987-11-25', '654 Maple Dr', 'Atlanta', 'GA', '30301', 1, GETDATE(), GETDATE()),
    (6, 'William', 'Wilson', 'DL12345006', '2025-09-20', '555-1006', 'william.w@example.com', '1983-02-14', '987 Cedar Ln', 'Miami', 'FL', '33101', 1, GETDATE(), GETDATE()),
    (7, 'Charles', 'Moore', 'DL12345007', '2026-05-10', '555-1007', 'charles.m@example.com', '1986-09-08', '147 Birch Blvd', 'Chicago', 'IL', '60601', 1, GETDATE(), GETDATE()),
    (8, 'Richard', 'Taylor', 'DL12345008', '2025-11-30', '555-1008', 'richard.t@example.com', '1981-01-22', '258 Spruce Way', 'Detroit', 'MI', '48201', 1, GETDATE(), GETDATE()),
    (9, 'Joseph', 'Anderson', 'DL12345009', '2026-07-14', '555-1009', 'joseph.a@example.com', '1984-04-17', '369 Ash Court', 'Houston', 'TX', '77001', 1, GETDATE(), GETDATE()),
    (10, 'Thomas', 'Thomas', 'DL12345010', '2025-10-25', '555-1010', 'thomas.t@example.com', '1989-06-30', '741 Oak Drive', 'Dallas', 'TX', '75201', 1, GETDATE(), GETDATE()),
    (11, 'Christopher', 'Jackson', 'DL12345011', '2026-04-20', '555-1011', 'christopher.j@example.com', '1982-08-12', '852 Maple Lane', 'Los Angeles', 'CA', '90001', 1, GETDATE(), GETDATE()),
    (12, 'Daniel', 'White', 'DL12345012', '2025-12-15', '555-1012', 'daniel.w@example.com', '1985-10-05', '963 Pine Court', 'San Francisco', 'CA', '94101', 1, GETDATE(), GETDATE()),
    (13, 'Matthew', 'Harris', 'DL12345013', '2026-06-30', '555-1013', 'matthew.h@example.com', '1987-03-19', '159 Cedar Street', 'Seattle', 'WA', '98101', 1, GETDATE(), GETDATE()),
    (14, 'Anthony', 'Martin', 'DL12345014', '2025-09-10', '555-1014', 'anthony.m@example.com', '1983-11-28', '753 Elm Avenue', 'Portland', 'OR', '97201', 1, GETDATE(), GETDATE()),
    (15, 'Mark', 'Garcia', 'DL12345015', '2026-02-14', '555-1015', 'mark.g@example.com', '1986-05-09', '951 Birch Road', 'Las Vegas', 'NV', '89101', 1, GETDATE(), GETDATE()),
    (16, 'Donald', 'Rodriguez', 'DL12345016', '2025-08-20', '555-1016', 'donald.r@example.com', '1984-12-02', '357 Spruce Drive', 'Phoenix', 'AZ', '85001', 1, GETDATE(), GETDATE()),
    (17, 'Steven', 'Lee', 'DL12345017', '2026-01-31', '555-1017', 'steven.l@example.com', '1981-07-16', '654 Ash Lane', 'Denver', 'CO', '80201', 1, GETDATE(), GETDATE()),
    (18, 'Paul', 'Walker', 'DL12345018', '2025-11-05', '555-1018', 'paul.w@example.com', '1988-04-23', '852 Oak Street', 'New Orleans', 'LA', '70112', 1, GETDATE(), GETDATE()),
    (19, 'Andrew', 'Hall', 'DL12345019', '2026-03-28', '555-1019', 'andrew.h@example.com', '1983-09-11', '147 Maple Drive', 'Memphis', 'TN', '37501', 1, GETDATE(), GETDATE()),
    (20, 'Joshua', 'Young', 'DL12345020', '2025-10-10', '555-1020', 'joshua.y@example.com', '1985-06-07', '456 Cedar Lane', 'San Diego', 'CA', '92101', 1, GETDATE(), GETDATE()),
    (21, 'Kenneth', 'Hernandez', 'DL12345021', '2026-04-15', '555-1021', 'kenneth.h@example.com', '1982-02-20', '789 Pine Drive', 'Tampa', 'FL', '33602', 1, GETDATE(), GETDATE()),
    (22, 'Kevin', 'Lopez', 'DL12345022', '2025-12-22', '555-1022', 'kevin.l@example.com', '1987-08-13', '321 Elm Street', 'Toronto', 'ON', 'M1A 1A1', 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Drivers OFF;
END
GO

-- =============================================
-- 7. SEED HOSTESSES TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Hostesses WHERE HostessId = 1)
BEGIN
    SET IDENTITY_INSERT Hostesses ON;
    
    INSERT INTO Hostesses (HostessId, FirstName, LastName, PhoneNumber, Email, EmergencyContactName, EmergencyContactPhone, ShiftPreference, IsActive, CreatedAt, UpdatedAt)
    VALUES
    (1, 'Maria', 'Garcia', '555-2001', 'maria.garcia@example.com', 'Carlos Garcia', '555-2001E', 'Morning', 1, GETDATE(), GETDATE()),
    (2, 'Sofia', 'Rodriguez', '555-2002', 'sofia.r@example.com', 'Miguel Rodriguez', '555-2002E', 'Evening', 1, GETDATE(), GETDATE()),
    (3, 'Elena', 'Martinez', '555-2003', 'elena.m@example.com', 'Juan Martinez', '555-2003E', 'Night', 1, GETDATE(), GETDATE()),
    (4, 'Carmen', 'Lopez', '555-2004', 'carmen.l@example.com', 'Antonio Lopez', '555-2004E', 'Morning', 1, GETDATE(), GETDATE()),
    (5, 'Rosa', 'Gonzalez', '555-2005', 'rosa.g@example.com', 'Diego Gonzalez', '555-2005E', 'Evening', 1, GETDATE(), GETDATE()),
    (6, 'Angela', 'Fernandez', '555-2006', 'angela.f@example.com', 'Pedro Fernandez', '555-2006E', 'Morning', 1, GETDATE(), GETDATE()),
    (7, 'Isabella', 'Sanchez', '555-2007', 'isabella.s@example.com', 'Luis Sanchez', '555-2007E', 'Night', 1, GETDATE(), GETDATE()),
    (8, 'Francesca', 'Ramirez', '555-2008', 'francesca.r@example.com', 'Manuel Ramirez', '555-2008E', 'Morning', 1, GETDATE(), GETDATE()),
    (9, 'Giulia', 'Torres', '555-2009', 'giulia.t@example.com', 'Roberto Torres', '555-2009E', 'Evening', 1, GETDATE(), GETDATE()),
    (10, 'Lucia', 'Rivera', '555-2010', 'lucia.r@example.com', 'Francisco Rivera', '555-2010E', 'Night', 1, GETDATE(), GETDATE()),
    (11, 'Alessandra', 'Cruz', '555-2011', 'alessandra.c@example.com', 'Vicente Cruz', '555-2011E', 'Morning', 1, GETDATE(), GETDATE()),
    (12, 'Valentina', 'Morales', '555-2012', 'valentina.m@example.com', 'Alberto Morales', '555-2012E', 'Evening', 1, GETDATE(), GETDATE()),
    (13, 'Adriana', 'Ortiz', '555-2013', 'adriana.o@example.com', 'Javier Ortiz', '555-2013E', 'Night', 1, GETDATE(), GETDATE()),
    (14, 'Camilla', 'Jimenez', '555-2014', 'camilla.j@example.com', 'Salvador Jimenez', '555-2014E', 'Morning', 1, GETDATE(), GETDATE()),
    (15, 'Emilia', 'Castillo', '555-2015', 'emilia.c@example.com', 'Enrique Castillo', '555-2015E', 'Evening', 1, GETDATE(), GETDATE()),
    (16, 'Olivia', 'Herrera', '555-2016', 'olivia.h@example.com', 'Ricardo Herrera', '555-2016E', 'Night', 1, GETDATE(), GETDATE()),
    (17, 'Sophia', 'Dominguez', '555-2017', 'sophia.d@example.com', 'Miguel Dominguez', '555-2017E', 'Morning', 1, GETDATE(), GETDATE()),
    (18, 'Victoria', 'Vargas', '555-2018', 'victoria.v@example.com', 'Fernando Vargas', '555-2018E', 'Evening', 1, GETDATE(), GETDATE()),
    (19, 'Constanza', 'Medina', '555-2019', 'constanza.m@example.com', 'Sergio Medina', '555-2019E', 'Night', 1, GETDATE(), GETDATE()),
    (20, 'Mariana', 'Soto', '555-2020', 'mariana.s@example.com', 'Jorge Soto', '555-2020E', 'Morning', 1, GETDATE(), GETDATE()),
    (21, 'Catalina', 'Flores', '555-2021', 'catalina.f@example.com', 'Oscar Flores', '555-2021E', 'Evening', 1, GETDATE(), GETDATE()),
    (22, 'Daniela', 'Campos', '555-2022', 'daniela.c@example.com', 'Rafael Campos', '555-2022E', 'Night', 1, GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Hostesses OFF;
END
GO

-- =============================================
-- 8. SEED PAYMENTS TABLE (20+ rows)
-- =============================================
IF NOT EXISTS (SELECT 1 FROM Payments WHERE PaymentId = 1)
BEGIN
    SET IDENTITY_INSERT Payments ON;
    
    INSERT INTO Payments (PaymentId, BookingId, Amount, PaymentMethod, TransactionId, Status, PaymentDate, CreatedAt, UpdatedAt)
    VALUES
    (1, 1, 135.00, 'Credit Card', 'TXN20240110001', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (2, 2, 90.00, 'Debit Card', 'TXN20240110002', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (3, 3, 48.00, 'Net Banking', 'TXN20240110003', 'Pending', GETDATE(), GETDATE(), GETDATE()),
    (4, 4, 144.00, 'Credit Card', 'TXN20240110004', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (5, 5, 225.00, 'UPI', 'TXN20240110005', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (6, 6, 58.00, 'Credit Card', 'TXN20240110006', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (7, 7, 116.00, 'Debit Card', 'TXN20240110007', 'Pending', GETDATE(), GETDATE(), GETDATE()),
    (8, 8, 220.00, 'Net Banking', 'TXN20240110008', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (9, 9, 98.00, 'Credit Card', 'TXN20240110009', 'Refunded', GETDATE(), GETDATE(), GETDATE()),
    (10, 10, 70.00, 'UPI', 'TXN20240110010', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (11, 11, 105.00, 'Credit Card', 'TXN20240110011', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (12, 12, 85.00, 'Debit Card', 'TXN20240110012', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (13, 13, 425.00, 'Net Banking', 'TXN20240110013', 'Pending', GETDATE(), GETDATE(), GETDATE()),
    (14, 14, 90.00, 'Credit Card', 'TXN20240110014', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (15, 15, 392.00, 'UPI', 'TXN20240110015', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (16, 16, 156.00, 'Credit Card', 'TXN20240110016', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (17, 17, 52.00, 'Debit Card', 'TXN20240110017', 'Pending', GETDATE(), GETDATE(), GETDATE()),
    (18, 18, 588.00, 'Net Banking', 'TXN20240110018', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (19, 19, 270.00, 'Credit Card', 'TXN20240110019', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (20, 20, 65.00, 'UPI', 'TXN20240110020', 'Refunded', GETDATE(), GETDATE(), GETDATE()),
    (21, 21, 325.00, 'Credit Card', 'TXN20240110021', 'Completed', GETDATE(), GETDATE(), GETDATE()),
    (22, 22, 58.00, 'Debit Card', 'TXN20240110022', 'Pending', GETDATE(), GETDATE(), GETDATE());
    
    SET IDENTITY_INSERT Payments OFF;
END
GO

-- =============================================
-- VERIFICATION
-- =============================================
SELECT 'Users' AS TableName, COUNT(*) AS RowCount FROM Users
UNION ALL
SELECT 'Buses', COUNT(*) FROM Buses
UNION ALL
SELECT 'Routes', COUNT(*) FROM Routes
UNION ALL
SELECT 'Schedules', COUNT(*) FROM Schedules
UNION ALL
SELECT 'Bookings', COUNT(*) FROM Bookings
UNION ALL
SELECT 'Drivers', COUNT(*) FROM Drivers
UNION ALL
SELECT 'Hostesses', COUNT(*) FROM Hostesses
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
ORDER BY TableName;
GO

PRINT 'Database seed data initialization completed successfully!';
GO

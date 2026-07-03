-- ========================================
-- SEED DATA SCRIPT - 20+ ROWS EACH TABLE
-- Ticket Management System
-- INT Primary Keys (No GUIDs)
-- ========================================

USE [TicketManagement];
GO

-- ========================================
-- SEED USERS (22 rows)
-- ========================================
SET IDENTITY_INSERT [Users] ON;

INSERT INTO [Users] ([UserId], [Email], [PasswordHash], [FullName], [IsActive], [CreatedAt])
VALUES
(1, 'admin@ticketmanagement.local', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Admin User', 1, '2024-01-01'),
(2, 'john.doe@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'John Doe', 1, '2024-01-02'),
(3, 'jane.smith@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Jane Smith', 1, '2024-01-02'),
(4, 'michael.brown@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Michael Brown', 1, '2024-01-03'),
(5, 'emily.davis@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Emily Davis', 1, '2024-01-03'),
(6, 'robert.wilson@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Robert Wilson', 1, '2024-01-04'),
(7, 'sarah.miller@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Sarah Miller', 1, '2024-01-04'),
(8, 'david.moore@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'David Moore', 1, '2024-01-05'),
(9, 'lisa.taylor@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Lisa Taylor', 1, '2024-01-05'),
(10, 'james.anderson@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'James Anderson', 1, '2024-01-06'),
(11, 'jennifer.thomas@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Jennifer Thomas', 1, '2024-01-06'),
(12, 'william.jackson@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'William Jackson', 1, '2024-01-07'),
(13, 'patricia.white@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Patricia White', 1, '2024-01-07'),
(14, 'charles.harris@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Charles Harris', 1, '2024-01-08'),
(15, 'karen.martin@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Karen Martin', 1, '2024-01-08'),
(16, 'richard.garcia@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Richard Garcia', 1, '2024-01-09'),
(17, 'nancy.rodriguez@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Nancy Rodriguez', 1, '2024-01-09'),
(18, 'thomas.lee@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Thomas Lee', 1, '2024-01-10'),
(19, 'dorothy.perez@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Dorothy Perez', 1, '2024-01-10'),
(20, 'christopher.edwards@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Christopher Edwards', 1, '2024-01-11'),
(21, 'margaret.collins@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Margaret Collins', 1, '2024-01-11'),
(22, 'daniel.stewart@email.com', 'AQAAAAEAAYagAAAAEKz+9JzN8K3R5mL2P9K3Q4E+N7R2K9Z8X4V5B6C7D8=', 'Daniel Stewart', 1, '2024-01-12');

SET IDENTITY_INSERT [Users] OFF;
GO

-- ========================================
-- SEED BUSES (22 rows)
-- ========================================
SET IDENTITY_INSERT [Buses] ON;

INSERT INTO [Buses] ([BusId], [BusNo], [Model], [Capacity], [Year], [IsActive], [CreatedAt])
VALUES
(1, 'BUS001', 'Volvo B11R', 55, 2022, 1, '2024-01-01'),
(2, 'BUS002', 'Mercedes-Benz O500', 52, 2022, 1, '2024-01-01'),
(3, 'BUS003', 'Tata Busaco', 45, 2021, 1, '2024-01-01'),
(4, 'BUS004', 'Scania K360', 50, 2021, 1, '2024-01-02'),
(5, 'BUS005', 'MAN TGX', 48, 2021, 1, '2024-01-02'),
(6, 'BUS006', 'Volvo B9R', 55, 2020, 1, '2024-01-02'),
(7, 'BUS007', 'Mercedes-Benz O405', 50, 2020, 1, '2024-01-03'),
(8, 'BUS008', 'Ashok Leyland', 45, 2020, 1, '2024-01-03'),
(9, 'BUS009', 'Hino S500', 42, 2019, 1, '2024-01-03'),
(10, 'BUS010', 'Isuzu Giga', 40, 2019, 1, '2024-01-04'),
(11, 'BUS011', 'Volvo B7R', 50, 2019, 1, '2024-01-04'),
(12, 'BUS012', 'Scania K340', 48, 2019, 1, '2024-01-04'),
(13, 'BUS013', 'Mercedes-Benz O345', 42, 2021, 1, '2024-01-05'),
(14, 'BUS014', 'Tata Busaco Pro', 48, 2022, 1, '2024-01-05'),
(15, 'BUS015', 'MAN TG410', 45, 2020, 1, '2024-01-05'),
(16, 'BUS016', 'Volvo B12B', 52, 2022, 1, '2024-01-06'),
(17, 'BUS017', 'Mercedes-Benz Tourismo', 50, 2021, 1, '2024-01-06'),
(18, 'BUS018', 'Scania K280', 46, 2020, 1, '2024-01-06'),
(19, 'BUS019', 'Ashok Leyland Boss', 42, 2019, 1, '2024-01-07'),
(20, 'BUS020', 'Hino FC1J', 38, 2019, 1, '2024-01-07'),
(21, 'BUS021', 'Isuzu Elf', 35, 2020, 1, '2024-01-07'),
(22, 'BUS022', 'Volvo B10M', 48, 2021, 1, '2024-01-08');

SET IDENTITY_INSERT [Buses] OFF;
GO

-- ========================================
-- SEED ROUTES (22 rows)
-- ========================================
SET IDENTITY_INSERT [Routes] ON;

INSERT INTO [Routes] ([RouteId], [RouteName], [StartLocation], [EndLocation], [Distance], [BaseFare], [IsActive], [CreatedAt])
VALUES
(1, 'New York to Boston', 'New York, NY', 'Boston, MA', 215, 45.00, 1, '2024-01-01'),
(2, 'Chicago to Detroit', 'Chicago, IL', 'Detroit, MI', 280, 55.00, 1, '2024-01-01'),
(3, 'Los Angeles to San Francisco', 'Los Angeles, CA', 'San Francisco, CA', 383, 65.00, 1, '2024-01-01'),
(4, 'Dallas to Houston', 'Dallas, TX', 'Houston, TX', 239, 50.00, 1, '2024-01-02'),
(5, 'Miami to Orlando', 'Miami, FL', 'Orlando, FL', 235, 48.00, 1, '2024-01-02'),
(6, 'Philadelphia to Washington DC', 'Philadelphia, PA', 'Washington, DC', 140, 35.00, 1, '2024-01-02'),
(7, 'Atlanta to Nashville', 'Atlanta, GA', 'Nashville, TN', 250, 52.00, 1, '2024-01-03'),
(8, 'Seattle to Portland', 'Seattle, WA', 'Portland, OR', 174, 42.00, 1, '2024-01-03'),
(9, 'Denver to Salt Lake City', 'Denver, CO', 'Salt Lake City, UT', 525, 85.00, 1, '2024-01-03'),
(10, 'Phoenix to Las Vegas', 'Phoenix, AZ', 'Las Vegas, NV', 296, 60.00, 1, '2024-01-04'),
(11, 'San Diego to Los Angeles', 'San Diego, CA', 'Los Angeles, CA', 120, 28.00, 1, '2024-01-04'),
(12, 'Austin to San Antonio', 'Austin, TX', 'San Antonio, TX', 80, 22.00, 1, '2024-01-04'),
(13, 'Minneapolis to Milwaukee', 'Minneapolis, MN', 'Milwaukee, WI', 340, 62.00, 1, '2024-01-05'),
(14, 'Kansas City to St. Louis', 'Kansas City, MO', 'St. Louis, MO', 250, 50.00, 1, '2024-01-05'),
(15, 'Pittsburgh to Cleveland', 'Pittsburgh, PA', 'Cleveland, OH', 135, 32.00, 1, '2024-01-05'),
(16, 'Louisville to Cincinnati', 'Louisville, KY', 'Cincinnati, OH', 100, 25.00, 1, '2024-01-06'),
(17, 'Charlotte to Atlanta', 'Charlotte, NC', 'Atlanta, GA', 245, 50.00, 1, '2024-01-06'),
(18, 'Raleigh to Richmond', 'Raleigh, NC', 'Richmond, VA', 170, 38.00, 1, '2024-01-06'),
(19, 'Birmingham to Memphis', 'Birmingham, AL', 'Memphis, TN', 400, 75.00, 1, '2024-01-07'),
(20, 'Baltimore to Boston', 'Baltimore, MD', 'Boston, MA', 400, 72.00, 1, '2024-01-07'),
(21, 'Hartford to New York', 'Hartford, CT', 'New York, NY', 100, 28.00, 1, '2024-01-07'),
(22, 'Providence to Philadelphia', 'Providence, RI', 'Philadelphia, PA', 280, 55.00, 1, '2024-01-08');

SET IDENTITY_INSERT [Routes] OFF;
GO

-- ========================================
-- SEED SCHEDULES (22 rows)
-- ========================================
SET IDENTITY_INSERT [Schedules] ON;

INSERT INTO [Schedules] ([ScheduleId], [RouteId], [BusId], [DepartureTime], [ArrivalTime], [Fare], [IsActive], [CreatedAt])
VALUES
(1, 1, 1, '2024-01-10 06:00:00', '2024-01-10 14:00:00', 45.00, 1, '2024-01-01'),
(2, 2, 2, '2024-01-10 07:00:00', '2024-01-10 16:00:00', 55.00, 1, '2024-01-01'),
(3, 3, 3, '2024-01-10 08:00:00', '2024-01-10 18:00:00', 65.00, 1, '2024-01-01'),
(4, 4, 4, '2024-01-10 09:00:00', '2024-01-10 13:00:00', 50.00, 1, '2024-01-02'),
(5, 5, 5, '2024-01-10 10:00:00', '2024-01-10 14:00:00', 48.00, 1, '2024-01-02'),
(6, 6, 6, '2024-01-10 06:30:00', '2024-01-10 09:30:00', 35.00, 1, '2024-01-02'),
(7, 7, 7, '2024-01-10 11:00:00', '2024-01-10 15:00:00', 52.00, 1, '2024-01-03'),
(8, 8, 8, '2024-01-10 12:00:00', '2024-01-10 15:00:00', 42.00, 1, '2024-01-03'),
(9, 9, 9, '2024-01-10 05:00:00', '2024-01-10 14:00:00', 85.00, 1, '2024-01-03'),
(10, 10, 10, '2024-01-10 13:00:00', '2024-01-10 18:00:00', 60.00, 1, '2024-01-04'),
(11, 11, 11, '2024-01-10 14:00:00', '2024-01-10 16:00:00', 28.00, 1, '2024-01-04'),
(12, 12, 12, '2024-01-10 15:00:00', '2024-01-10 16:30:00', 22.00, 1, '2024-01-04'),
(13, 13, 13, '2024-01-10 07:00:00', '2024-01-10 13:00:00', 62.00, 1, '2024-01-05'),
(14, 14, 14, '2024-01-10 08:00:00', '2024-01-10 12:00:00', 50.00, 1, '2024-01-05'),
(15, 15, 15, '2024-01-10 09:00:00', '2024-01-10 11:30:00', 32.00, 1, '2024-01-05'),
(16, 16, 16, '2024-01-10 10:00:00', '2024-01-10 11:40:00', 25.00, 1, '2024-01-06'),
(17, 17, 17, '2024-01-10 11:00:00', '2024-01-10 15:00:00', 50.00, 1, '2024-01-06'),
(18, 18, 18, '2024-01-10 12:00:00', '2024-01-10 14:50:00', 38.00, 1, '2024-01-06'),
(19, 19, 19, '2024-01-10 04:00:00', '2024-01-10 11:00:00', 75.00, 1, '2024-01-07'),
(20, 20, 20, '2024-01-10 05:30:00', '2024-01-10 13:30:00', 72.00, 1, '2024-01-07'),
(21, 21, 21, '2024-01-10 14:00:00', '2024-01-10 15:40:00', 28.00, 1, '2024-01-07'),
(22, 22, 22, '2024-01-10 06:00:00', '2024-01-10 11:00:00', 55.00, 1, '2024-01-08');

SET IDENTITY_INSERT [Schedules] OFF;
GO

-- ========================================
-- SEED BOOKINGS (22 rows - Mixed Status)
-- ========================================
SET IDENTITY_INSERT [Bookings] ON;

INSERT INTO [Bookings] ([BookingId], [ScheduleId], [UserId], [PassengerName], [TotalAmount], [Status], [BookedAt], [TravelDate])
VALUES
(1, 1, 2, 'John Doe', 45.00, 'Confirmed', '2024-01-08 10:00:00', '2024-01-10'),
(2, 2, 3, 'Jane Smith', 110.00, 'Confirmed', '2024-01-08 11:00:00', '2024-01-10'),
(3, 3, 4, 'Michael Brown', 65.00, 'Confirmed', '2024-01-08 12:00:00', '2024-01-10'),
(4, 4, 5, 'Emily Davis', 100.00, 'Confirmed', '2024-01-08 13:00:00', '2024-01-10'),
(5, 5, 6, 'Robert Wilson', 48.00, 'Confirmed', '2024-01-08 14:00:00', '2024-01-10'),
(6, 6, 7, 'Sarah Miller', 70.00, 'Confirmed', '2024-01-08 15:00:00', '2024-01-10'),
(7, 7, 8, 'David Moore', 104.00, 'Confirmed', '2024-01-08 16:00:00', '2024-01-10'),
(8, 8, 9, 'Lisa Taylor', 84.00, 'Confirmed', '2024-01-08 17:00:00', '2024-01-10'),
(9, 9, 10, 'James Anderson', 85.00, 'Pending', '2024-01-09 08:00:00', '2024-01-10'),
(10, 10, 11, 'Jennifer Thomas', 120.00, 'Pending', '2024-01-09 09:00:00', '2024-01-10'),
(11, 11, 12, 'William Jackson', 56.00, 'Pending', '2024-01-09 10:00:00', '2024-01-10'),
(12, 12, 13, 'Patricia White', 44.00, 'Pending', '2024-01-09 11:00:00', '2024-01-10'),
(13, 13, 14, 'Charles Harris', 124.00, 'Confirmed', '2024-01-09 12:00:00', '2024-01-10'),
(14, 14, 15, 'Karen Martin', 100.00, 'Confirmed', '2024-01-09 13:00:00', '2024-01-10'),
(15, 15, 16, 'Richard Garcia', 64.00, 'Confirmed', '2024-01-09 14:00:00', '2024-01-10'),
(16, 16, 17, 'Nancy Rodriguez', 50.00, 'Cancelled', '2024-01-09 15:00:00', '2024-01-10'),
(17, 17, 18, 'Thomas Lee', 100.00, 'Cancelled', '2024-01-09 16:00:00', '2024-01-10'),
(18, 18, 19, 'Dorothy Perez', 76.00, 'Cancelled', '2024-01-09 17:00:00', '2024-01-10'),
(19, 19, 20, 'Christopher Edwards', 150.00, 'Confirmed', '2024-01-09 18:00:00', '2024-01-10'),
(20, 20, 21, 'Margaret Collins', 144.00, 'Confirmed', '2024-01-09 19:00:00', '2024-01-10'),
(21, 21, 22, 'Daniel Stewart', 56.00, 'Confirmed', '2024-01-09 20:00:00', '2024-01-10'),
(22, 22, 2, 'John Doe', 110.00, 'Confirmed', '2024-01-09 21:00:00', '2024-01-10');

SET IDENTITY_INSERT [Bookings] OFF;
GO

-- ========================================
-- SEED DRIVERS (22 rows)
-- ========================================
SET IDENTITY_INSERT [Drivers] ON;

INSERT INTO [Drivers] ([DriverId], [Name], [LicenseNumber], [LicenseExpiryDate], [City], [Phone], [IsActive], [CreatedAt])
VALUES
(1, 'Anthony Garcia', 'DL001', '2025-12-31', 'New York, NY', '555-0001', 1, '2024-01-01'),
(2, 'Marcus Johnson', 'DL002', '2025-12-31', 'Chicago, IL', '555-0002', 1, '2024-01-01'),
(3, 'David Martinez', 'DL003', '2025-12-31', 'Los Angeles, CA', '555-0003', 1, '2024-01-01'),
(4, 'Joseph Robinson', 'DL004', '2026-06-30', 'Dallas, TX', '555-0004', 1, '2024-01-02'),
(5, 'Vincent Lee', 'DL005', '2026-06-30', 'Miami, FL', '555-0005', 1, '2024-01-02'),
(6, 'Frank Rodriguez', 'DL006', '2026-06-30', 'Philadelphia, PA', '555-0006', 1, '2024-01-02'),
(7, 'Brian Young', 'DL007', '2025-12-31', 'Atlanta, GA', '555-0007', 1, '2024-01-03'),
(8, 'Richard White', 'DL008', '2025-12-31', 'Seattle, WA', '555-0008', 1, '2024-01-03'),
(9, 'Samuel Hernandez', 'DL009', '2025-12-31', 'Denver, CO', '555-0009', 1, '2024-01-03'),
(10, 'Jason Green', 'DL010', '2026-06-30', 'Phoenix, AZ', '555-0010', 1, '2024-01-04'),
(11, 'Matthew King', 'DL011', '2026-06-30', 'San Diego, CA', '555-0011', 1, '2024-01-04'),
(12, 'Andrew Scott', 'DL012', '2026-06-30', 'Austin, TX', '555-0012', 1, '2024-01-04'),
(13, 'Gary Ramirez', 'DL013', '2025-12-31', 'Minneapolis, MN', '555-0013', 1, '2024-01-05'),
(14, 'Eric Stewart', 'DL014', '2025-12-31', 'Kansas City, MO', '555-0014', 1, '2024-01-05'),
(15, 'Stephen Sanchez', 'DL015', '2025-12-31', 'Pittsburgh, PA', '555-0015', 1, '2024-01-05'),
(16, 'Paul Bell', 'DL016', '2026-06-30', 'Louisville, KY', '555-0016', 1, '2024-01-06'),
(17, 'Mark Jimenez', 'DL017', '2026-06-30', 'Charlotte, NC', '555-0017', 1, '2024-01-06'),
(18, 'Donald Brewer', 'DL018', '2026-06-30', 'Raleigh, NC', '555-0018', 1, '2024-01-06'),
(19, 'Steven Caldwell', 'DL019', '2025-12-31', 'Birmingham, AL', '555-0019', 1, '2024-01-07'),
(20, 'Paul Curry', 'DL020', '2025-12-31', 'Baltimore, MD', '555-0020', 1, '2024-01-07'),
(21, 'Mark Simmons', 'DL021', '2025-12-31', 'Hartford, CT', '555-0021', 1, '2024-01-07'),
(22, 'Donald Mills', 'DL022', '2026-06-30', 'Providence, RI', '555-0022', 1, '2024-01-08');

SET IDENTITY_INSERT [Drivers] OFF;
GO

-- ========================================
-- SEED HOSTESSES (22 rows)
-- ========================================
SET IDENTITY_INSERT [Hostesses] ON;

INSERT INTO [Hostesses] ([HostessId], [Name], [ShiftPreference], [City], [EmergencyContact], [IsActive], [CreatedAt])
VALUES
(1, 'Angela Martinez', 'Morning', 'New York, NY', '555-1001', 1, '2024-01-01'),
(2, 'Brenda Johnson', 'Evening', 'Chicago, IL', '555-1002', 1, '2024-01-01'),
(3, 'Carla Rodriguez', 'Night', 'Los Angeles, CA', '555-1003', 1, '2024-01-01'),
(4, 'Diana Brown', 'Morning', 'Dallas, TX', '555-1004', 1, '2024-01-02'),
(5, 'Eleanor Davis', 'Evening', 'Miami, FL', '555-1005', 1, '2024-01-02'),
(6, 'Frances Garcia', 'Night', 'Philadelphia, PA', '555-1006', 1, '2024-01-02'),
(7, 'Grace Wilson', 'Morning', 'Atlanta, GA', '555-1007', 1, '2024-01-03'),
(8, 'Helen Anderson', 'Evening', 'Seattle, WA', '555-1008', 1, '2024-01-03'),
(9, 'Ida Taylor', 'Night', 'Denver, CO', '555-1009', 1, '2024-01-03'),
(10, 'Jackie Thompson', 'Morning', 'Phoenix, AZ', '555-1010', 1, '2024-01-04'),
(11, 'Karen Jackson', 'Evening', 'San Diego, CA', '555-1011', 1, '2024-01-04'),
(12, 'Laura White', 'Night', 'Austin, TX', '555-1012', 1, '2024-01-04'),
(13, 'Maria Harris', 'Morning', 'Minneapolis, MN', '555-1013', 1, '2024-01-05'),
(14, 'Nancy Martin', 'Evening', 'Kansas City, MO', '555-1014', 1, '2024-01-05'),
(15, 'Olivia Lee', 'Night', 'Pittsburgh, PA', '555-1015', 1, '2024-01-05'),
(16, 'Pamela Perez', 'Morning', 'Louisville, KY', '555-1016', 1, '2024-01-06'),
(17, 'Quinn Edwards', 'Evening', 'Charlotte, NC', '555-1017', 1, '2024-01-06'),
(18, 'Rachel Collins', 'Night', 'Raleigh, NC', '555-1018', 1, '2024-01-06'),
(19, 'Sandra Stewart', 'Morning', 'Birmingham, AL', '555-1019', 1, '2024-01-07'),
(20, 'Tina Sanchez', 'Evening', 'Baltimore, MD', '555-1020', 1, '2024-01-07'),
(21, 'Ursula Morris', 'Night', 'Hartford, CT', '555-1021', 1, '2024-01-07'),
(22, 'Violet Rogers', 'Morning', 'Providence, RI', '555-1022', 1, '2024-01-08');

SET IDENTITY_INSERT [Hostesses] OFF;
GO

-- ========================================
-- SEED PAYMENTS (22 rows)
-- ========================================
SET IDENTITY_INSERT [Payments] ON;

INSERT INTO [Payments] ([PaymentId], [BookingId], [Amount], [PaymentMethod], [Status], [TransactionId], [PaymentDate])
VALUES
(1, 1, 45.00, 'Credit Card', 'Completed', 'TXN001', '2024-01-08 10:30:00'),
(2, 2, 110.00, 'Debit Card', 'Completed', 'TXN002', '2024-01-08 11:30:00'),
(3, 3, 65.00, 'Net Banking', 'Completed', 'TXN003', '2024-01-08 12:30:00'),
(4, 4, 100.00, 'UPI', 'Completed', 'TXN004', '2024-01-08 13:30:00'),
(5, 5, 48.00, 'Credit Card', 'Completed', 'TXN005', '2024-01-08 14:30:00'),
(6, 6, 70.00, 'Debit Card', 'Completed', 'TXN006', '2024-01-08 15:30:00'),
(7, 7, 104.00, 'Net Banking', 'Completed', 'TXN007', '2024-01-08 16:30:00'),
(8, 8, 84.00, 'UPI', 'Completed', 'TXN008', '2024-01-08 17:30:00'),
(9, 9, 85.00, 'Credit Card', 'Pending', 'TXN009', '2024-01-09 08:30:00'),
(10, 10, 120.00, 'Debit Card', 'Pending', 'TXN010', '2024-01-09 09:30:00'),
(11, 11, 56.00, 'Net Banking', 'Pending', 'TXN011', '2024-01-09 10:30:00'),
(12, 12, 44.00, 'UPI', 'Pending', 'TXN012', '2024-01-09 11:30:00'),
(13, 13, 124.00, 'Credit Card', 'Completed', 'TXN013', '2024-01-09 12:30:00'),
(14, 14, 100.00, 'Debit Card', 'Completed', 'TXN014', '2024-01-09 13:30:00'),
(15, 15, 64.00, 'Net Banking', 'Completed', 'TXN015', '2024-01-09 14:30:00'),
(16, 16, 50.00, 'UPI', 'Refunded', 'TXN016', '2024-01-09 15:30:00'),
(17, 17, 100.00, 'Credit Card', 'Refunded', 'TXN017', '2024-01-09 16:30:00'),
(18, 18, 76.00, 'Debit Card', 'Completed', 'TXN018', '2024-01-09 17:30:00'),
(19, 19, 150.00, 'Net Banking', 'Completed', 'TXN019', '2024-01-09 18:30:00'),
(20, 20, 144.00, 'UPI', 'Completed', 'TXN020', '2024-01-09 19:30:00'),
(21, 21, 56.00, 'Credit Card', 'Completed', 'TXN021', '2024-01-09 20:30:00'),
(22, 22, 110.00, 'Debit Card', 'Completed', 'TXN022', '2024-01-09 21:30:00');

SET IDENTITY_INSERT [Payments] OFF;
GO

PRINT N'========================================'
PRINT N'SEED DATA INSERTED SUCCESSFULLY!'
PRINT N'========================================'
PRINT N''
PRINT N'Data Summary:'
PRINT N'Users: ' + CAST((SELECT COUNT(*) FROM Users) AS NVARCHAR)
PRINT N'Buses: ' + CAST((SELECT COUNT(*) FROM Buses) AS NVARCHAR)
PRINT N'Routes: ' + CAST((SELECT COUNT(*) FROM Routes) AS NVARCHAR)
PRINT N'Schedules: ' + CAST((SELECT COUNT(*) FROM Schedules) AS NVARCHAR)
PRINT N'Bookings: ' + CAST((SELECT COUNT(*) FROM Bookings) AS NVARCHAR)
PRINT N'Drivers: ' + CAST((SELECT COUNT(*) FROM Drivers) AS NVARCHAR)
PRINT N'Hostesses: ' + CAST((SELECT COUNT(*) FROM Hostesses) AS NVARCHAR)
PRINT N'Payments: ' + CAST((SELECT COUNT(*) FROM Payments) AS NVARCHAR)
GO

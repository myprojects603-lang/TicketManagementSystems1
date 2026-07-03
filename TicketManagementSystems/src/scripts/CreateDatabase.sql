-- =============================================
-- DATABASE SCHEMA - TicketManagement
-- Using INT (Identity) Primary Keys Instead of GUID
-- =============================================

USE [master];
GO

-- Drop existing database if it exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'TicketManagement')
BEGIN
    DROP DATABASE [TicketManagement];
END
GO

-- Create database
CREATE DATABASE [TicketManagement]
    ON PRIMARY (
        NAME = N'TicketManagement',
        FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketManagement.mdf',
        SIZE = 100MB,
        MAXSIZE = UNLIMITED,
        FILEGROWTH = 10MB
    )
    LOG ON (
        NAME = N'TicketManagement_log',
        FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketManagement_log.ldf',
        SIZE = 50MB,
        MAXSIZE = UNLIMITED,
        FILEGROWTH = 5MB
    );
GO

USE [TicketManagement];
GO

-- =============================================
-- 1. Users Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Users_Email (Email),
    INDEX IX_Users_IsActive (IsActive)
);
GO

-- =============================================
-- 2. Buses Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Buses')
CREATE TABLE Buses (
    BusId INT PRIMARY KEY IDENTITY(1,1),
    BusNumber NVARCHAR(50) NOT NULL UNIQUE,
    Model NVARCHAR(100) NOT NULL,
    Manufacturer NVARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    Year INT NOT NULL,
    LicensePlate NVARCHAR(50) NOT NULL UNIQUE,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Buses_BusNumber (BusNumber),
    INDEX IX_Buses_IsActive (IsActive),
    INDEX IX_Buses_LicensePlate (LicensePlate)
);
GO

-- =============================================
-- 3. Routes Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Routes')
CREATE TABLE Routes (
    RouteId INT PRIMARY KEY IDENTITY(1,1),
    RouteName NVARCHAR(200) NOT NULL,
    StartLocation NVARCHAR(200) NOT NULL,
    EndLocation NVARCHAR(200) NOT NULL,
    Distance INT NOT NULL,
    BaseFare DECIMAL(10, 2) NOT NULL,
    Description NVARCHAR(MAX),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Routes_RouteName (RouteName),
    INDEX IX_Routes_IsActive (IsActive),
    INDEX IX_Routes_StartLocation (StartLocation),
    INDEX IX_Routes_EndLocation (EndLocation)
);
GO

-- =============================================
-- 4. Schedules Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Schedules')
CREATE TABLE Schedules (
    ScheduleId INT PRIMARY KEY IDENTITY(1,1),
    RouteId INT NOT NULL,
    BusId INT NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    Fare DECIMAL(10, 2) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (RouteId) REFERENCES Routes(RouteId),
    FOREIGN KEY (BusId) REFERENCES Buses(BusId),
    INDEX IX_Schedules_RouteId (RouteId),
    INDEX IX_Schedules_BusId (BusId),
    INDEX IX_Schedules_DepartureTime (DepartureTime),
    INDEX IX_Schedules_IsActive (IsActive)
);
GO

-- =============================================
-- 5. Bookings Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Bookings')
CREATE TABLE Bookings (
    BookingId INT PRIMARY KEY IDENTITY(1,1),
    ScheduleId INT NOT NULL,
    UserId INT NOT NULL,
    PassengerName NVARCHAR(200) NOT NULL,
    PassengerEmail NVARCHAR(255),
    PassengerPhone NVARCHAR(20),
    Seats NVARCHAR(500),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) NOT NULL DEFAULT 'Pending',
    BookedAt DATETIME NOT NULL DEFAULT GETDATE(),
    TravelDate DATE NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (ScheduleId) REFERENCES Schedules(ScheduleId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    INDEX IX_Bookings_ScheduleId (ScheduleId),
    INDEX IX_Bookings_UserId (UserId),
    INDEX IX_Bookings_Status (Status),
    INDEX IX_Bookings_TravelDate (TravelDate),
    INDEX IX_Bookings_BookedAt (BookedAt)
);
GO

-- =============================================
-- 6. Drivers Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Drivers')
CREATE TABLE Drivers (
    DriverId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    LicenseNumber NVARCHAR(50) NOT NULL UNIQUE,
    LicenseExpiry DATE NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255),
    DateOfBirth DATE NOT NULL,
    Address NVARCHAR(500),
    City NVARCHAR(100),
    State NVARCHAR(100),
    ZipCode NVARCHAR(20),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Drivers_LicenseNumber (LicenseNumber),
    INDEX IX_Drivers_IsActive (IsActive),
    INDEX IX_Drivers_Email (Email)
);
GO

-- =============================================
-- 7. Hostesses Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Hostesses')
CREATE TABLE Hostesses (
    HostessId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255),
    EmergencyContactName NVARCHAR(200),
    EmergencyContactPhone NVARCHAR(20),
    ShiftPreference NVARCHAR(50),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Hostesses_IsActive (IsActive),
    INDEX IX_Hostesses_Email (Email)
);
GO

-- =============================================
-- 8. Payments Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Payments')
CREATE TABLE Payments (
    PaymentId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    TransactionId NVARCHAR(100) NOT NULL UNIQUE,
    Status NVARCHAR(50) NOT NULL DEFAULT 'Pending',
    PaymentDate DATETIME,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId),
    INDEX IX_Payments_BookingId (BookingId),
    INDEX IX_Payments_Status (Status),
    INDEX IX_Payments_TransactionId (TransactionId),
    INDEX IX_Payments_PaymentDate (PaymentDate)
);
GO

-- =============================================
-- 9. Roles Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Roles')
CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    INDEX IX_Roles_RoleName (RoleName)
);
GO

-- =============================================
-- 10. UserRoles Table (Junction)
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'UserRoles')
CREATE TABLE UserRoles (
    UserRoleId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    RoleId INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId),
    UNIQUE (UserId, RoleId),
    INDEX IX_UserRoles_UserId (UserId),
    INDEX IX_UserRoles_RoleId (RoleId)
);
GO

-- =============================================
-- 11. RefreshTokens Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'RefreshTokens')
CREATE TABLE RefreshTokens (
    TokenId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Token NVARCHAR(MAX) NOT NULL,
    ExpiryDate DATETIME NOT NULL,
    RevokedAt DATETIME,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    INDEX IX_RefreshTokens_UserId (UserId),
    INDEX IX_RefreshTokens_Token (Token),
    INDEX IX_RefreshTokens_ExpiryDate (ExpiryDate)
);
GO

-- =============================================
-- 12. AuditLogs Table
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditLogs')
CREATE TABLE AuditLogs (
    AuditId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    TableName NVARCHAR(100) NOT NULL,
    Action NVARCHAR(50) NOT NULL,
    RecordId INT,
    OldValues NVARCHAR(MAX),
    NewValues NVARCHAR(MAX),
    Timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    INDEX IX_AuditLogs_UserId (UserId),
    INDEX IX_AuditLogs_TableName (TableName),
    INDEX IX_AuditLogs_Timestamp (Timestamp)
);
GO

PRINT 'Database schema created successfully with INT primary keys!';
GO

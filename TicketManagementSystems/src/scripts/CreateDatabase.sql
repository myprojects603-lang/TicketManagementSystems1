-- ========================================
-- DATABASE INITIALIZATION SCRIPT
-- Ticket Management System
-- INT Primary Keys (No GUIDs)
-- ========================================

USE [master];
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TicketManagement')
BEGIN
    DROP DATABASE [TicketManagement];
END
GO

CREATE DATABASE [TicketManagement];
GO

USE [TicketManagement];
GO

-- ========================================
-- USERS TABLE
-- ========================================
CREATE TABLE [Users] (
    [UserId] INT PRIMARY KEY IDENTITY(1,1),
    [Email] NVARCHAR(256) UNIQUE NOT NULL,
    [PasswordHash] NVARCHAR(MAX) NOT NULL,
    [FullName] NVARCHAR(256) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_Users_Email ON [Users]([Email]);
GO

-- ========================================
-- BUSES TABLE
-- ========================================
CREATE TABLE [Buses] (
    [BusId] INT PRIMARY KEY IDENTITY(1,1),
    [BusNo] NVARCHAR(50) UNIQUE NOT NULL,
    [Model] NVARCHAR(100) NOT NULL,
    [Capacity] INT NOT NULL,
    [Year] INT NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_Buses_BusNo ON [Buses]([BusNo]);
GO

-- ========================================
-- ROUTES TABLE
-- ========================================
CREATE TABLE [Routes] (
    [RouteId] INT PRIMARY KEY IDENTITY(1,1),
    [RouteName] NVARCHAR(256) NOT NULL,
    [StartLocation] NVARCHAR(256) NOT NULL,
    [EndLocation] NVARCHAR(256) NOT NULL,
    [Distance] INT NOT NULL,
    [BaseFare] DECIMAL(10, 2) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_Routes_Name ON [Routes]([RouteName]);
GO

-- ========================================
-- SCHEDULES TABLE
-- ========================================
CREATE TABLE [Schedules] (
    [ScheduleId] INT PRIMARY KEY IDENTITY(1,1),
    [RouteId] INT NOT NULL,
    [BusId] INT NOT NULL,
    [DepartureTime] DATETIME NOT NULL,
    [ArrivalTime] DATETIME NOT NULL,
    [Fare] DECIMAL(10, 2) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Schedules_Route FOREIGN KEY ([RouteId]) REFERENCES [Routes]([RouteId]),
    CONSTRAINT FK_Schedules_Bus FOREIGN KEY ([BusId]) REFERENCES [Buses]([BusId])
);

CREATE INDEX IX_Schedules_RouteId ON [Schedules]([RouteId]);
CREATE INDEX IX_Schedules_BusId ON [Schedules]([BusId]);
GO

-- ========================================
-- BOOKINGS TABLE
-- ========================================
CREATE TABLE [Bookings] (
    [BookingId] INT PRIMARY KEY IDENTITY(1,1),
    [ScheduleId] INT NOT NULL,
    [UserId] INT NOT NULL,
    [PassengerName] NVARCHAR(256) NOT NULL,
    [TotalAmount] DECIMAL(10, 2) NOT NULL,
    [Status] NVARCHAR(50) NOT NULL DEFAULT 'Pending',
    [BookedAt] DATETIME NOT NULL DEFAULT GETUTCDATE(),
    [TravelDate] DATE NOT NULL,
    CONSTRAINT FK_Bookings_Schedule FOREIGN KEY ([ScheduleId]) REFERENCES [Schedules]([ScheduleId]),
    CONSTRAINT FK_Bookings_User FOREIGN KEY ([UserId]) REFERENCES [Users]([UserId])
);

CREATE INDEX IX_Bookings_ScheduleId ON [Bookings]([ScheduleId]);
CREATE INDEX IX_Bookings_UserId ON [Bookings]([UserId]);
CREATE INDEX IX_Bookings_Status ON [Bookings]([Status]);
GO

-- ========================================
-- DRIVERS TABLE
-- ========================================
CREATE TABLE [Drivers] (
    [DriverId] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(256) NOT NULL,
    [LicenseNumber] NVARCHAR(50) UNIQUE NOT NULL,
    [LicenseExpiryDate] DATE NOT NULL,
    [City] NVARCHAR(100) NOT NULL,
    [Phone] NVARCHAR(20) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_Drivers_License ON [Drivers]([LicenseNumber]);
GO

-- ========================================
-- HOSTESSES TABLE
-- ========================================
CREATE TABLE [Hostesses] (
    [HostessId] INT PRIMARY KEY IDENTITY(1,1),
    [Name] NVARCHAR(256) NOT NULL,
    [ShiftPreference] NVARCHAR(50) NOT NULL,
    [City] NVARCHAR(100) NOT NULL,
    [EmergencyContact] NVARCHAR(20) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_Hostesses_City ON [Hostesses]([City]);
GO

-- ========================================
-- PAYMENTS TABLE
-- ========================================
CREATE TABLE [Payments] (
    [PaymentId] INT PRIMARY KEY IDENTITY(1,1),
    [BookingId] INT NOT NULL,
    [Amount] DECIMAL(10, 2) NOT NULL,
    [PaymentMethod] NVARCHAR(50) NOT NULL,
    [Status] NVARCHAR(50) NOT NULL DEFAULT 'Completed',
    [TransactionId] NVARCHAR(100) NULL,
    [PaymentDate] DATETIME NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT FK_Payments_Booking FOREIGN KEY ([BookingId]) REFERENCES [Bookings]([BookingId])
);

CREATE INDEX IX_Payments_BookingId ON [Payments]([BookingId]);
CREATE INDEX IX_Payments_Status ON [Payments]([Status]);
GO

-- ========================================
-- AUDIT LOGS TABLE
-- ========================================
CREATE TABLE [AuditLogs] (
    [AuditId] INT PRIMARY KEY IDENTITY(1,1),
    [UserId] INT NULL,
    [Action] NVARCHAR(256) NOT NULL,
    [TableName] NVARCHAR(100) NOT NULL,
    [RecordId] INT NULL,
    [OldValues] NVARCHAR(MAX) NULL,
    [NewValues] NVARCHAR(MAX) NULL,
    [Timestamp] DATETIME NOT NULL DEFAULT GETUTCDATE()
);

CREATE INDEX IX_AuditLogs_UserId ON [AuditLogs]([UserId]);
CREATE INDEX IX_AuditLogs_Timestamp ON [AuditLogs]([Timestamp]);
GO

-- ========================================
-- SERILOG LOGS TABLE
-- ========================================
CREATE TABLE [SerilogLogs] (
    [Id] INT PRIMARY KEY IDENTITY(1,1),
    [MessageTemplate] NVARCHAR(MAX) NOT NULL,
    [Level] VARCHAR(128) NOT NULL,
    [TimeStamp] DATETIME NOT NULL DEFAULT GETUTCDATE(),
    [Exception] NVARCHAR(MAX) NULL,
    [LogEvent] NVARCHAR(MAX) NULL
);

CREATE INDEX IX_SerilogLogs_Level ON [SerilogLogs]([Level]);
CREATE INDEX IX_SerilogLogs_Timestamp ON [SerilogLogs]([TimeStamp]);
GO

-- ========================================
-- REFRESH TOKENS TABLE
-- ========================================
CREATE TABLE [RefreshTokens] (
    [TokenId] INT PRIMARY KEY IDENTITY(1,1),
    [UserId] INT NOT NULL,
    [Token] NVARCHAR(MAX) NOT NULL,
    [ExpiryDate] DATETIME NOT NULL,
    [CreatedAt] DATETIME NOT NULL DEFAULT GETUTCDATE(),
    [RevokedAt] DATETIME NULL,
    CONSTRAINT FK_RefreshTokens_User FOREIGN KEY ([UserId]) REFERENCES [Users]([UserId])
);

CREATE INDEX IX_RefreshTokens_UserId ON [RefreshTokens]([UserId]);
GO

PRINT N'Database and tables created successfully!';

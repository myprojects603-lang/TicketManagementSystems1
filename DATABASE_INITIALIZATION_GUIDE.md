# Database Initialization Guide

## Overview
This guide explains how to initialize the TicketManagement database with seed data using INT primary keys instead of GUID.

## Files Included

1. **CreateDatabase.sql** - Creates the database schema with all tables
2. **SeedData.sql** - Inserts 20+ rows into each table
3. **InsertRoles.sql** - Creates default roles and assigns them to users

## Setup Steps

### Step 1: Create Database and Schema

```bash
# Using SQL Server Management Studio
1. Open SQL Server Management Studio
2. Connect to your SQL Server instance
3. Open CreateDatabase.sql
4. Execute the script
```

**Or using sqlcmd (Command Line):**

```bash
# Navigate to scripts directory
cd src/scripts

# Execute script
sqlcmd -S localhost -U sa -P YourPassword -i CreateDatabase.sql
```

### Step 2: Insert Seed Data

```bash
# Using SQL Server Management Studio
1. Open SeedData.sql
2. Execute the script
```

**Or using sqlcmd:**

```bash
sqlcmd -S localhost -U sa -P YourPassword -d TicketManagement -i SeedData.sql
```

### Step 3: Create Roles

```bash
# Using SQL Server Management Studio
1. Open InsertRoles.sql
2. Execute the script
```

**Or using sqlcmd:**

```bash
sqlcmd -S localhost -U sa -P YourPassword -d TicketManagement -i InsertRoles.sql
```

## Verification

After executing all scripts, verify the data:

```sql
-- Check row counts
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

-- Expected Output:
-- Bookings	22
-- Buses	22
-- Drivers	22
-- Hostesses	22
-- Payments	22
-- Routes	22
-- Schedules	22
-- Users	22
```

## Data Summary

### Users (22 rows)
- 1 SuperAdmin user: admin@ticketmanagement.local
- 21 Regular users with various roles
- Password (hashed): Admin@123

### Buses (22 rows)
- Various models (Volvo, Mercedes, Tata, etc.)
- Capacity: 28-55 seats
- Year: 2019-2022
- All active

### Routes (22 rows)
- Major US routes (NY-Boston, Chicago-Detroit, etc.)
- Distance: 120-1040 km
- Base fares: $25-$130
- All active

### Schedules (22 rows)
- One schedule per route
- Various departure times throughout the day
- Fares: $25-$135
- All active

### Bookings (22 rows)
- Mix of Confirmed (13), Pending (6), and Cancelled (3) statuses
- Passengers from 1-7 seats
- Total amounts: $25-$588
- Travel date: 2024-01-10

### Drivers (22 rows)
- All active
- License expiry dates: 2025-2026
- Various cities across US and Canada

### Hostesses (22 rows)
- All active
- Shift preferences: Morning, Evening, Night
- Emergency contacts provided

### Payments (22 rows)
- Payment methods: Credit Card, Debit Card, Net Banking, UPI
- Statuses: Completed (16), Pending (5), Refunded (2)
- Total amount: ~$4,500

## Database Connection Strings

### For ASP.NET Core

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=TicketManagement;User Id=sa;Password=YourPassword;Encrypt=false;TrustServerCertificate=true;"
  }
}
```

### For Docker

```yaml
environment:
  - ConnectionStrings__DefaultConnection=Server=sqlserver;Database=TicketManagement;User Id=sa;Password=Admin@123;
```

### For Azure SQL

```
Server=tcp:yourserver.database.windows.net,1433;Initial Catalog=TicketManagement;Persist Security Info=False;User ID=username;Password=password;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
```

## Primary Key Strategy

### Why INT Instead of GUID?

✅ **Benefits of INT:**
- Smaller storage (4 bytes vs 16 bytes)
- Faster queries and joins
- Better index performance
- Natural ordering
- Easier debugging
- Lower memory usage

✅ **Implementation:**
```sql
BusId INT PRIMARY KEY IDENTITY(1,1)
RouteId INT PRIMARY KEY IDENTITY(1,1)
-- etc.
```

### Performance Impact

For a table with 1 million records:
- INT PK: ~4 MB index overhead
- GUID PK: ~16 MB index overhead (4x larger)
- Query performance: INT is 10-15% faster

## Rollback Instructions

If you need to start over:

```sql
-- Drop database
DROP DATABASE [TicketManagement];

-- Then re-run CreateDatabase.sql
```

## Troubleshooting

### Identity Insert Errors

```sql
-- If you get "IDENTITY_INSERT is already ON"
-- Turn it off:
SET IDENTITY_INSERT Users OFF;
```

### Foreign Key Constraint Errors

```sql
-- Check for missing parent records
SELECT * FROM Bookings b
WHERE NOT EXISTS (SELECT 1 FROM Schedules s WHERE s.ScheduleId = b.ScheduleId);
```

### SQL Server Not Running

```bash
# Start SQL Server (Windows)
net start MSSQLSERVER

# Start SQL Server (macOS with Docker)
docker start mssql

# Verify connection
sqlcmd -S localhost -U sa -P YourPassword -Q "SELECT @@VERSION"
```

## Next Steps

1. ✅ Database created with seed data
2. ✅ 20+ rows in each table
3. ✅ INT primary keys implemented
4. ✅ Roles assigned to users
5. Next: Update your ASP.NET models to use INT instead of GUID
6. Next: Update your connection strings
7. Next: Test API endpoints

## Support

For issues or questions:
- Check error logs in SQL Server
- Verify connection strings
- Ensure SQL Server is running
- Check user permissions


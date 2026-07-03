-- =============================================
-- INSERT DEFAULT ROLES
-- =============================================

USE [TicketManagement];
GO

IF NOT EXISTS (SELECT 1 FROM Roles WHERE RoleName = 'SuperAdmin')
BEGIN
    SET IDENTITY_INSERT Roles ON;
    
    INSERT INTO Roles (RoleId, RoleName, Description, IsActive)
    VALUES
    (1, 'SuperAdmin', 'Full system access and management', 1),
    (2, 'Admin', 'Administrative functions and reporting', 1),
    (3, 'Operator', 'Can manage bookings and view reports', 1),
    (4, 'Viewer', 'Read-only access to reports', 1),
    (5, 'Driver', 'Driver portal access', 1),
    (6, 'Hostess', 'Hostess portal access', 1);
    
    SET IDENTITY_INSERT Roles OFF;
END
GO

-- =============================================
-- ASSIGN ROLES TO ADMIN USER
-- =============================================

IF NOT EXISTS (SELECT 1 FROM UserRoles WHERE UserId = 1 AND RoleId = 1)
BEGIN
    INSERT INTO UserRoles (UserId, RoleId)
    VALUES (1, 1); -- Admin user gets SuperAdmin role
END
GO

-- =============================================
-- ASSIGN ROLES TO OTHER USERS
-- =============================================

IF NOT EXISTS (SELECT 1 FROM UserRoles WHERE UserId = 2 AND RoleId = 3)
BEGIN
    INSERT INTO UserRoles (UserId, RoleId)
    SELECT 2, 3 UNION ALL
    SELECT 3, 3 UNION ALL
    SELECT 4, 3 UNION ALL
    SELECT 5, 4 UNION ALL
    SELECT 6, 4 UNION ALL
    SELECT 7, 4 UNION ALL
    SELECT 8, 4 UNION ALL
    SELECT 9, 4 UNION ALL
    SELECT 10, 3 UNION ALL
    SELECT 11, 4 UNION ALL
    SELECT 12, 4 UNION ALL
    SELECT 13, 3 UNION ALL
    SELECT 14, 4 UNION ALL
    SELECT 15, 4 UNION ALL
    SELECT 16, 3 UNION ALL
    SELECT 17, 4 UNION ALL
    SELECT 18, 4 UNION ALL
    SELECT 19, 3 UNION ALL
    SELECT 20, 4 UNION ALL
    SELECT 21, 4 UNION ALL
    SELECT 22, 3;
END
GO

PRINT 'Roles assigned successfully!';
GO

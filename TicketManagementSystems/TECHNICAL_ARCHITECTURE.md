# System Architecture & Technical Overview

## 🏗️ Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Client Layer (Angular)                   │
│  ┌─────────────┬──────────────┬──────────────┬────────────┐ │
│  │  Dashboard  │  Management  │   Bookings   │  Reports   │ │
│  │  Component  │  Components  │  Component   │ Component  │ │
│  └─────────────┴──────────────┴──────────────┴────────────┘ │
└────────────────────────────────────────────────────────────┬─┘
                            │
                 HTTP/HTTPS │ (REST API)
                            ↓
┌────────────────────────────────────────────────────────────┐
│            API Layer (ASP.NET Core 6)                      │
│  ┌────────────┬───────────┬────────────┬──────────────┐   │
│  │Auth        │Management │  Booking   │  Reports     │   │
│  │Controller  │Controller │ Controller │  Controller  │   │
│  └────────────┴───────────┴────────────┴──────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐  │
│  │         Services Layer (Business Logic)             │  │
│  ├─────────────────────────────────────────────────────┤  │
│  │ AuthService │ BusService │ BookingService │ etc.   │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐ │
│  │         Middleware & Interceptors                    │ │
│  │ Auth │ CORS │ Error Handling │ Logging             │ │
│  └──────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────┬───────────────┘
                                             │
                              SQL Commands   ↓
┌────────────────────────────────────────────────────────────┐
│         Data Access Layer (ADO.NET)                        │
│  ┌──────────────────────────────────────────────────────┐ │
│  │  Connection Pool │ Stored Procedures │ Queries     │ │
│  └──────────────────────��───────────────────────────────┘ │
└────────────────────────────────────────────┬───────────────┘
                                             │
                                  Network    ↓
┌────────────────────────────────────────────────────────────┐
│              Database Layer (SQL Server)                   │
│  ┌──────────────────────────────────────────────────────┐ │
│  │ Users │ Buses │ Routes │ Bookings │ Schedules │ etc.│ │
│  └──────────────────────────────────────────────────────┘ │
│  ┌──────────────────────────────────────────────────────┐ │
│  │      Stored Procedures & Business Logic             │ │
│  └──────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────┘
```

## 🔄 Request Flow

```
1. User Login
   └─> Angular Form
       └─> POST /api/auth/login
           └─> AuthController
               └─> AuthService (Validate Credentials)
                   └─> Database (User Table)
                       └─> Generate JWT Token
                           └─> Return Token to Client
                               └─> Store in localStorage
                                   └─> Redirect to Dashboard

2. Protected API Call
   └─> Angular Service
       └─> AuthInterceptor (Attach Token)
           └─> GET /api/buses
               └─> AuthMiddleware (Validate Token)
                   └─> BusController
                       └─> BusService
                           └─> Database
                               └─> Return Data
                                   └─> Display in Component

3. Token Refresh (401 Response)
   └─> AuthInterceptor detects 401
       └─> POST /api/auth/refresh
           └─> New Token Generated
               └─> Retry Original Request
                   └─> Complete Successfully
```

## 📊 Database Schema Summary

```
Users
├── UserId (PK)
├── Email (Unique)
├── PasswordHash
├── FullName
├── IsActive
└── CreatedAt

Buses
├── BusId (PK)
├── BusNo (Unique)
├── Model
├── Capacity
├── IsActive
└── CreatedAt

Routes
├── RouteId (PK)
├── RouteName
├── StartLocation
├── EndLocation
├── Distance
├── BaseFare
└── CreatedAt

Schedules
├── ScheduleId (PK)
├── RouteId (FK)
├── BusId (FK)
├── DepartureTime
├── ArrivalTime
├── Fare
├── IsActive
└── CreatedAt

Bookings
├── BookingId (PK)
├── ScheduleId (FK)
├── UserId (FK)
├── PassengerName
├── TotalAmount
├── Status (Confirmed/Pending/Cancelled)
├── BookedAt
└── TravelDate

RefreshTokens
├── TokenId (PK)
├── UserId (FK)
├── Token
├── ExpiryDate
├── CreatedAt
└── RevokedAt
```

## 🔐 Authentication Flow

```
1. Initial Login
   ├─ Validate credentials
   ├─ Generate JWT (15 min expiry)
   ├─ Generate Refresh Token (7 day expiry)
   ├─ Store refresh token in DB
   └─ Return both tokens to client

2. API Requests
   ├─ Attach JWT in Authorization header
   ├─ Server validates JWT signature
   ├─ Check if token expired
   └─ Process request if valid

3. Token Expiry (15 mins)
   ├─ Client detects 401 response
   ├─ Send refresh token to /api/auth/refresh
   ├─ Server validates refresh token
   ├─ Generate new JWT
   ├─ Return new JWT to client
   ├─ Store new JWT in localStorage
   └─ Retry original request

4. Logout
   ├─ Clear JWT from localStorage
   ├─ Clear refresh token from localStorage
   ├─ Call /api/auth/logout (optional)
   ├─ Revoke refresh token in DB
   └─ Redirect to login
```

## 🛡️ Security Layers

```
┌─────────────────────────────────────────┐
│   1. HTTPS/SSL Encryption (Transport)   │ ← Network
├─────────────────────────────────────────┤
│   2. JWT Token Validation                │ ← Authentication
├─────────────────────────────────────────┤
│   3. Role-Based Access Control (RBAC)   │ ← Authorization
├─────────────────────────────────────────┤
│   4. SQL Injection Prevention            │ ← Database
│      (Parameterized Queries)             │
├─────────────────────────────────────────┤
│   5. XSS Protection                      │ ← Angular
│      (Content Security Policy)           │
├─────────────────────────────────────────┤
│   6. CSRF Tokens                         │ ← Forms
├─────────────────────────────────────────┤
│   7. Rate Limiting                       │ ← API
├─────────────────────────────────────────┤
│   8. Input Validation                    │ ← Forms
├─────────────────────────────────────────┤
│   9. Data Encryption at Rest             │ ← Database
├─────────────────────────────────────────┤
│  10. Audit Logging                       │ ← Compliance
└─────────────────────────────────────────┘
```

## 📈 Performance Optimization

### Frontend
- Lazy loading for components
- Change detection optimization
- Tree shaking for bundle size
- Minification and compression
- Caching strategies

### Backend
- Connection pooling
- Query optimization with indexes
- Response caching
- Async/await for I/O
- Compression middleware

### Database
- Indexed columns for fast queries
- Stored procedures for complex logic
- Query optimization
- Regular maintenance (defrag, stats)
- Archive old records

## 🔍 Monitoring & Logging

```
Logs Collected:
├─ Application Logs (Serilog)
│  ├─ Info (General information)
│  ├─ Warning (Potential issues)
│  ├─ Error (Exception details)
│  └─ Debug (Development debugging)
├─ API Logs
│  ├─ Request/Response
│  ├─ Duration
│  └─ Status codes
├─ Security Logs
│  ├─ Login attempts
│  ├─ Failed authentications
│  └─ Permission denials
└─ Database Logs
   ├─ Query execution time
   ├─ Slow queries
   └─ Connection pool stats

Monitoring:
├─ Application Insights
├─ Performance counters
├─ Error tracking (Sentry)
├─ Uptime monitoring
└─ Alert notifications
```

## 📦 Deployment Architecture

```
┌──────────────────────────────────────────────────┐
│              Azure Cloud Platform                │
│                                                  │
│  ┌─────────────────────────────────────────┐   │
│  │    Frontend (Static Web App)            │   │
│  │    - Angular build files                │   │
│  │    - Nginx serving                      │   │
│  │    - CDN distribution                   │   │
│  └──────────────────┬──────────────────────┘   │
│                     │                           │
│  ┌──────────────────↓──────────────────────┐   │
│  │    Backend (App Service)                │   │
│  │    - ASP.NET Core runtime               │   │
│  │    - Application Insights monitoring    │   │
│  │    - Auto-scaling                       │   │
│  └──────────────────┬──────────────────────┘   │
│                     │                           │
│  ┌──────────────────↓──────────────────────┐   │
│  │    Database (SQL Database)              │   │
│  │    - Managed SQL Server                 │   │
│  │    - Automated backups                  │   │
│  │    - Geo-replication                    │   │
│  └─────────────────────────────────────────┘   │
└──────────────────────────────────────────────────┘
```

---

**Architecture Version**: 1.0  
**Last Updated**: January 2024

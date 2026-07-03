# Quick Start Guide - 5 Minute Setup

## 🚀 Installation in 5 Minutes

### Prerequisites Check
```bash
# Verify Node.js
node --version  # Should be 18+
npm --version   # Should be 8+

# Verify .NET
dotnet --version  # Should be 6.0+
```

### Step 1: Clone & Navigate (1 min)
```bash
git clone https://github.com/mytestprojects001-bit/TicketManagementSystems.git
cd TicketManagementSystems
```

### Step 2: Start Backend (2 min)
```bash
cd src/Api
dotnet restore
dotnet run
# Wait for: "Application started. Press Ctrl+C to shut down."
```

### Step 3: Start Frontend (2 min)
```bash
# New terminal
cd client
npm install
ng serve --open
# Browser opens to http://localhost:4200
```

### Step 4: Login (Instant)
```
Email: admin@ticketmanagement.local
Password: Admin@123
```

✅ **You're In!** Dashboard loads with your data.

---

## 📋 Common First Tasks

### Add Your First Bus
1. Click **Management → Buses**
2. Click **"Add Bus"**
3. Fill:
   - Bus No: `BUS001`
   - Model: `Volvo`
   - Capacity: `50`
4. Click **Save**

### Add Your First Route
1. Click **Management → Routes**
2. Click **"Add Route"**
3. Fill:
   - Name: `New York to Boston`
   - Start: `New York`
   - End: `Boston`
   - Distance: `215`
4. Click **Save**

### Create First Schedule
1. Click **Management → Schedules**
2. Click **"Add Schedule"**
3. Select Bus & Route
4. Set departure time
5. Click **Save**

---

## 🆘 Troubleshooting

### Backend won't start
```bash
# Check if port 5001 is busy
lsof -i :5001  # macOS/Linux
netstat -ano | findstr :5001  # Windows

# Kill the process or use different port
dotnet run --urls "https://localhost:5002"
```

### Frontend won't compile
```bash
cd client
rm -rf node_modules package-lock.json
npm install
ng serve
```

### CORS Error
- Update `appsettings.json`
- Add frontend URL to `CorsOrigins`
- Restart backend

### Login fails
- Check backend is running on https://localhost:5001
- Verify database connection
- Check credentials: admin@ticketmanagement.local / Admin@123

---

## 📚 Next Steps

1. Read **USER_MANUAL.md** for detailed guide
2. Review **DEPLOYMENT_GUIDE.md** for production setup
3. Check **ENVIRONMENT_CONFIG.md** for configurations
4. Explore **API documentation** in code

---

**Need Help?** → support@ticketmanagement.local

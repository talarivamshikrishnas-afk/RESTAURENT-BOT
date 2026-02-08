# RSV Restaurant Reservation Bot - Documentation Index

Welcome! This is your complete restaurant reservation chatbot project. Everything is built, tested, and ready to run.

## 📖 Documentation Guide

Read these files in order based on your needs:

### 🚀 **Getting Started** (Start Here)
1. **[QUICKSTART.md](QUICKSTART.md)** ⭐ **START HERE**
   - 5-minute setup guide
   - Quick start commands
   - Basic troubleshooting
   - Example interactions
   - **Time to run**: 5 minutes

2. **[README.md](README.md)**
   - Complete feature overview
   - Installation instructions
   - API endpoint reference
   - Database schema details
   - Usage examples
   - **Time to read**: 20 minutes

### 🏗️ **Architecture & Overview**
3. **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**
   - Complete project overview
   - File structure explanation
   - Technology stack
   - Capabilities matrix
   - Statistics and metrics
   - **Time to read**: 15 minutes

### ⚙️ **Configuration & Customization**
4. **[CONFIGURATION.md](CONFIGURATION.md)**
   - All configurable parameters
   - How to customize settings
   - File locations for each setting
   - Quick reference table
   - **Time to read**: 10 minutes

### 💻 **Code Documentation**
- Each Python file has detailed docstrings
- JavaScript has inline comments
- HTML is well-structured with comments
- SQL is generated from SQLAlchemy models

---

## 🎯 Quick Navigation

### "I want to..."

**Run the app immediately**
→ Read [QUICKSTART.md](QUICKSTART.md)
- Windows: Run `setup.bat` then `python app.py`
- Mac/Linux: Run `setup.sh` then `python app.py`

**Understand the project**
→ Read [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)
- Overview of all components
- File structure explanation
- Technology choices

**Learn all features**
→ Read [README.md](README.md)
- Complete feature list
- API documentation
- Database schema
- Usage examples

**Customize the app**
→ Read [CONFIGURATION.md](CONFIGURATION.md)
- Change operating hours
- Add menu items
- Configure chat behavior
- Customize UI colors

**Modify the code**
→ Read the docstrings in:
- `chatbot/` - Bot logic
- `database/` - Database models
- `api/` - API endpoints
- `static/` - Frontend code

**Run tests**
→ Execute in terminal:
```bash
pytest tests/test_availability.py -v
```

**Use the API**
→ See examples in [README.md](README.md)
- Chat endpoint
- Reservation endpoints
- Menu endpoints
- Availability checking

---

## 📁 Project Structure at a Glance

```
rsv-restaurant-bot/
├── 📄 Documentation (START WITH QUICKSTART.md)
│   ├── QUICKSTART.md           ← 5-minute setup
│   ├── README.md               ← Complete guide
│   ├── PROJECT_SUMMARY.md      ← Overview
│   └── CONFIGURATION.md        ← Settings reference
│
├── 🚀 Main Application
│   └── app.py                  ← Run this file
│
├── 💬 Chatbot Engine
│   ├── chatbot/intent_model.py        ← ML classifier
│   ├── chatbot/entity_parser.py       ← Extract data
│   └── chatbot/dialog_manager.py      ← Conversation
│
├── 🗄️ Database Layer
│   ├── database/models.py             ← Database schema
│   ├── database/db.py                 ← Connection
│   └── database/seed.py               ← Initial data
│
├── 🔌 API Endpoints
│   ├── api/routes.py                  ← All endpoints
│   └── api/availability.py            ← Table logic
│
├── 🎨 Frontend
│   ├── templates/index.html           ← Main page
│   ├── static/css/style.css           ← Styling
│   └── static/js/script.js            ← Interactions
│
├── 📊 Data Files
│   ├── data/intents.json              ← Chat patterns
│   └── data/menu.json                 ← 56 menu items
│
├── 🧪 Tests
│   └── tests/test_availability.py     ← Unit tests
│
├── ⚙️ Setup
│   ├── setup.bat                      ← Windows setup
│   ├── setup.sh                       ← Mac/Linux setup
│   └── requirements.txt               ← Dependencies
```

---

## ✅ What You Get

### ✨ Features
- [x] AI-powered chatbot with natural language understanding
- [x] Real-time table availability checking
- [x] Complete reservation system (create/modify/cancel)
- [x] 56-item menu with categories and search
- [x] Beautiful responsive web UI
- [x] Dark/light theme support
- [x] Sentiment-aware responses
- [x] Coupon code support
- [x] Chef's special recommendations
- [x] Customer feedback system
- [x] Admin statistics dashboard
- [x] SQLite database with seed data
- [x] 12+ REST API endpoints
- [x] Unit tests for critical logic

### 🛠️ Technology
- Python 3.8+
- FastAPI (modern, fast API framework)
- SQLAlchemy (database ORM)
- scikit-learn (machine learning)
- TextBlob (sentiment analysis)
- SQLite (lightweight database)
- Vanilla JavaScript (no dependencies)
- HTML5 & CSS3

### 📊 Code Statistics
- ~4,500 lines of code
- 15 source files
- 10 unit tests
- 1,000+ lines of documentation
- 56 menu items pre-loaded
- 10 restaurant tables
- 8 intent types
- 46 training patterns

---

## 🚀 Getting Started (The Easy Way)

### Step 1: Choose Your OS

**Windows:**
```bash
cd e:\4rth sem\NEW\rsv-restaurant-bot
setup.bat
python app.py
```

**Mac/Linux:**
```bash
cd rsv-restaurant-bot
chmod +x setup.sh
./setup.sh
python3 app.py
```

### Step 2: Open Your Browser
```
http://localhost:8000
```

### Step 3: Start Chatting!
Try: "Book a table for 4 tomorrow at 7 PM"

---

## 📚 Learning Path

### 5 Minutes
- Read QUICKSTART.md
- Run setup and start server
- Open http://localhost:8000
- Try the chat interface

### 15 Minutes
- Try booking a table
- Check menu items
- Check availability
- Toggle dark theme

### 30 Minutes
- Read PROJECT_SUMMARY.md
- Understand architecture
- Review file structure
- Explore the code

### 1 Hour
- Read README.md completely
- Review database schema
- Check API endpoints
- Try API calls with curl

### 2 Hours
- Read CONFIGURATION.md
- Customize settings
- Modify menu items
- Change UI colors

### 3+ Hours
- Dig into the code
- Run unit tests
- Extend functionality
- Deploy to cloud

---

## 🆘 Help & Support

### Having Issues?

1. **Setup failed?**
   → See QUICKSTART.md troubleshooting section

2. **App won't start?**
   → Check:
   - Python is installed: `python --version`
   - Dependencies installed: `pip list`
   - Port 8000 is free: `netstat -an | findstr 8000`

3. **Chat not working?**
   → Check:
   - Browser console (F12)
   - Server logs in terminal
   - Network tab in DevTools

4. **Database issues?**
   → Reset:
   ```bash
   rm rsv_restaurant.db
   python database/seed.py
   ```

5. **Can't find something?**
   → Use Ctrl+F to search in documentation

### Getting Help
- Check README.md FAQ section
- Look at CONFIGURATION.md for customization
- Review code comments
- Check test files for examples
- See API examples in README.md

---

## 🎯 Common Tasks

### Change Operating Hours
→ [CONFIGURATION.md](CONFIGURATION.md) - "Operating Hours" section

### Add Menu Item
→ Edit `data/menu.json` and reseed database

### Change Chat Behavior
→ Edit `chatbot/dialog_manager.py`

### Modify UI Colors
→ Edit `static/css/style.css` `:root` section

### Add More Tables
→ Edit `database/seed.py` tables_data

### Deploy to Production
→ See [README.md](README.md) - "Deployment" section

### Add New Intent
→ Add to `data/intents.json`, then retrain model

---

## 📞 API Quick Reference

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/chat` | POST | Chat with bot |
| `/menu` | GET | Get all menu items |
| `/menu/search` | POST | Search menu |
| `/availability` | POST | Check table availability |
| `/reservation` | POST | Create booking |
| `/reservation/{id}` | PUT | Modify booking |
| `/reservation/{id}` | DELETE | Cancel booking |
| `/feedback` | POST | Submit review |
| `/admin/stats` | GET | View statistics |

Full details in [README.md](README.md)

---

## 🎓 Project as Learning Resource

This project demonstrates:
- ✅ Full-stack web development
- ✅ REST API design with FastAPI
- ✅ Database design with SQLAlchemy
- ✅ Machine learning pipeline setup
- ✅ Responsive web design
- ✅ Real-time communication
- ✅ Testing best practices
- ✅ Clean code architecture
- ✅ Production-ready patterns

Perfect for learning or portfolio building!

---

## 📋 Checklist for First Run

- [ ] Python 3.8+ installed
- [ ] Read QUICKSTART.md
- [ ] Run setup.bat or setup.sh
- [ ] Run `python app.py`
- [ ] Open http://localhost:8000
- [ ] Try chatting with the bot
- [ ] Test booking a table
- [ ] Check menu items
- [ ] Toggle dark theme
- [ ] Read README.md

---

## 🎉 You're All Set!

Everything is built, configured, and ready to use. No additional setup needed beyond running `setup.bat` or `setup.sh`.

**Next Step**: Open [QUICKSTART.md](QUICKSTART.md) and start in 5 minutes!

---

## 📝 File Reference

| File | Purpose | Read Time |
|------|---------|-----------|
| QUICKSTART.md | Fast setup guide | 5 min |
| README.md | Complete documentation | 20 min |
| PROJECT_SUMMARY.md | Architecture overview | 15 min |
| CONFIGURATION.md | Settings reference | 10 min |
| app.py | Main server file | - |
| requirements.txt | Dependencies | - |
| setup.bat | Windows setup | - |
| setup.sh | Mac/Linux setup | - |

---

**Version**: 1.0.0  
**Status**: ✅ Complete & Production Ready  
**Last Updated**: 2024

Start with [QUICKSTART.md](QUICKSTART.md) →

# RSV Restaurant Configuration Reference

# This file documents all configurable parameters

## 🍽️ Restaurant Settings

### Operating Hours
Location: `api/availability.py` (line ~20)
```python
self.restaurant_hours = {
    'open': '11:00',    # Opens at 11 AM
    'close': '23:00'    # Closes at 11 PM
}
```
Change these times to adjust when the restaurant is open.

### Reservation Slot Duration
Location: `api/availability.py` (line ~13)
```python
def __init__(self, slot_duration_minutes=60):
```
Default: 60 minutes per reservation. Change to 30, 45, 90, etc.

### Search Window for Alternatives
Location: `api/availability.py` (line ~125)
```python
def find_alternative_slots(self, ..., search_window_hours=3):
```
How many hours before/after to suggest alternatives.

## 🤖 Chatbot Settings

### Intent Confidence Threshold
Location: `chatbot/intent_model.py` (line ~80)
```python
def predict(self, text, confidence_threshold=0.3):
```
Predictions below this score trigger fallback responses.
- Lower (0.1) = more permissive, more mistakes
- Higher (0.5+) = more restrictive, more fallbacks

### Intent Training Patterns
Location: `data/intents.json`
Add more patterns to improve accuracy:
```json
{
  "tag": "greeting",
  "patterns": [
    "hello",
    "hi",
    "hey",
    "your new pattern here"
  ]
}
```

### Sentiment Polarity Thresholds
Location: `chatbot/dialog_manager.py` (line ~35)
```python
if polarity > 0.1:
    return "positive"
elif polarity < -0.1:
    return "negative"
```
Adjust 0.1 threshold to make sentiment detection more/less sensitive.

### Coupon Codes
Location: `chatbot/dialog_manager.py` (line ~33)
```python
self.coupon_codes = {
    "WELCOME10": 0.10,  # 10% discount
    "PROMO20": 0.20,    # 20% discount
    "RSV50": 0.50       # 50% discount
}
```
Add/remove coupon codes and their discount rates here.

### Chef Specials
Location: `chatbot/dialog_manager.py` (line ~44)
```python
self.chef_specials = [
    "Butter Chicken - A rich, creamy classic!",
    "Grilled Salmon - Fresh and perfectly seared!",
    "Panna Cotta - Silky and divine!"
]
```
Edit today's specials.

## 🗄️ Database Settings

### Database URL
Location: `database/db.py` (line ~7)
```python
DATABASE_URL = "sqlite:///./rsv_restaurant.db"
```
- SQLite: `sqlite:///./filename.db`
- PostgreSQL: `postgresql://user:password@localhost/dbname`
- MySQL: `mysql+pymysql://user:password@localhost/dbname`

### Database Location
The database file is created in the project root.
To store elsewhere, use absolute path:
```python
DATABASE_URL = "sqlite:////var/data/rsv_restaurant.db"
```

## 🍽️ Menu Configuration

### Menu Items
Location: `data/menu.json`
Each item has:
```json
{
  "id": 1,
  "name": "Samosa Trio",
  "category": "starters",  # starters, veg_mains, nonveg_mains, desserts, drinks
  "price": 8.99,
  "veg": true,            # Vegetarian flag
  "popularity": 5,        # 1-5 star rating
  "chef_special": false,
  "image": "https://..."
}
```

### Categories
Current categories in system:
- `starters` - Appetizers
- `veg_mains` - Vegetarian main courses
- `nonveg_mains` - Non-vegetarian main courses
- `desserts` - Sweets and desserts
- `drinks` - Beverages

To add new category:
1. Add items with new category to menu.json
2. Add filter button in templates/index.html
3. Update static/js/script.js filterMenu() function

## 🏪 Table Settings

### Restaurant Tables
Location: `database/seed.py` (line ~10)
```python
tables_data = [
    {"table_number": 1, "capacity": 2, "location": "window"},
    {"table_number": 2, "capacity": 2, "location": "window"},
    # ...
]
```

Available capacities: 2, 4, 6, 8 (or customize as needed)
Available locations: window, corner, center, main, patio (or customize)

To add more tables, add entries to this list:
```python
{"table_number": 11, "capacity": 4, "location": "patio"}
```

## 🎨 Frontend Configuration

### Color Scheme
Location: `static/css/style.css` (line ~13)
```css
:root {
    --primary-color: #d4473d;      /* Restaurant red */
    --secondary-color: #f39c12;    /* Orange accent */
    --dark-bg: #1a1a1a;            /* Dark theme background */
    --light-bg: #f5f5f5;           /* Light theme background */
}
```

### Fonts
Location: `static/css/style.css` (line ~20)
```css
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
```

### Chat Settings
Location: `static/js/script.js` (line ~1)
- Session timeout
- Message animation duration
- Auto-scroll behavior
- Typing speed

### API Base URL
Location: `static/js/script.js` (line ~5)
```javascript
const API_BASE = '/';  // Change to your API domain
```

For production:
```javascript
const API_BASE = 'https://your-domain.com/api/';
```

## 🔧 Server Settings

### Server Port
Location: `app.py` (line ~50)
```python
uvicorn.run("app:app", host="0.0.0.0", port=8000)
```

To change:
```bash
python app.py  # Uses port 8000
# or
uvicorn app:app --port 8001  # Uses port 8001
```

### Server Host
Location: `app.py` (line ~50)
```python
host="0.0.0.0"  # Accessible from any IP
```

- `0.0.0.0` - Accessible externally (default)
- `127.0.0.1` - Localhost only
- `localhost` - Local access only

### Reload Behavior
Location: `app.py` (line ~50)
```python
reload=False  # Set True for development
```

## 📊 Admin Settings

### Admin Statistics
Location: `api/routes.py` (line ~300)
The `/admin/stats` endpoint shows:
- Total reservations
- Total customers
- Total menu items
- Average rating
- Top 5 dishes

No configuration needed - automatically aggregated.

## 🔐 Security Settings

### CORS (Cross-Origin)
To enable CORS for external requests:
```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Change to specific domains
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

Add to app.py after creating FastAPI instance.

### Rate Limiting
To add rate limiting:
```bash
pip install slowapi
```

Then add to app.py:
```python
from slowapi import Limiter
from slowapi.util import get_remote_address

limiter = Limiter(key_func=get_remote_address)
app.state.limiter = limiter

@app.post("/chat")
@limiter.limit("10/minute")
async def chat(request: ChatRequest):
    ...
```

## 🚀 Environment Variables

For production, create a `.env` file:
```
DATABASE_URL=postgresql://user:pass@localhost/db
API_HOST=0.0.0.0
API_PORT=8000
DEBUG=false
LOG_LEVEL=info
```

Load in app.py:
```python
from dotenv import load_dotenv
import os

load_dotenv()
DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///./rsv_restaurant.db")
API_PORT = int(os.getenv("API_PORT", 8000))
```

## 📝 Logging Configuration

### Enable Debug Logging
Location: `app.py` (top)
```python
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Use in code:
logger.info("Message")
logger.error("Error")
```

### Log to File
```python
import logging.handlers

handler = logging.handlers.RotatingFileHandler(
    'app.log', maxBytes=1000000, backupCount=5
)
logging.root.addHandler(handler)
```

## 🧪 Testing Configuration

### Test Database
Location: `tests/test_availability.py` (line ~10)
```python
TEST_DATABASE_URL = "sqlite:///:memory:"
```

Uses in-memory DB for fast tests. Change to:
```python
TEST_DATABASE_URL = "sqlite:///test_rsv.db"
```

To use a file-based test DB.

### Test Fixtures
Customizable in `tests/test_availability.py`:
- Number of test tables
- Table capacities
- Test dates
- Test times
- Guest counts

## 📱 Mobile Configuration

### Responsive Breakpoints
Location: `static/css/style.css` (line ~680)
```css
@media (max-width: 768px) { ... }   /* Tablet */
@media (max-width: 480px) { ... }   /* Mobile */
```

Adjust breakpoints if needed.

### Chat Box Height
Location: `static/css/style.css` (line ~130)
```css
.chat-box {
    height: 600px;  /* Desktop height */
}

@media (max-width: 768px) {
    .chat-box {
        height: 500px;  /* Mobile height */
    }
}
```

## 🎯 Summary of Key Files

| Setting | File | Line |
|---------|------|------|
| Operating Hours | api/availability.py | ~20 |
| Slot Duration | api/availability.py | ~13 |
| Intent Threshold | chatbot/intent_model.py | ~80 |
| Intent Patterns | data/intents.json | All |
| Coupon Codes | chatbot/dialog_manager.py | ~33 |
| Chef Specials | chatbot/dialog_manager.py | ~44 |
| Menu Items | data/menu.json | All |
| Tables | database/seed.py | ~10 |
| Database URL | database/db.py | ~7 |
| Colors | static/css/style.css | ~13 |
| Server Port | app.py | ~50 |
| API Base | static/js/script.js | ~5 |

## ✅ Quick Configuration Checklist

- [ ] Set restaurant operating hours
- [ ] Adjust reservation slot duration
- [ ] Configure chat confidence threshold
- [ ] Add coupon codes if needed
- [ ] Update chef specials
- [ ] Customize menu items
- [ ] Add/remove restaurant tables
- [ ] Change color scheme
- [ ] Update server port (if needed)
- [ ] Add additional intents (if needed)
- [ ] Configure database location
- [ ] Set up logging (optional)
- [ ] Configure CORS (if needed)
- [ ] Add rate limiting (if needed)

---

For any configuration not listed here, refer to the code comments in the respective files.

import json
import sqlite3

# Step 1: Read JSON
with open('C:/Users/Admin/Desktop/Daily_Prep/Python-Scripting/JSON_SQLite3_ETL/user.json', 'r') as f:
    users = json.load(f)

# Step 2: Connect to SQLite DB
conn = sqlite3.connect('users.db')
cur = conn.cursor()

# Step 3: Create Table
cur.execute('''
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
)
''')

# Step 4: Insert Data
for user in users:
    try:
        cur.execute('INSERT INTO users (id, name, email) VALUES (?, ?, ?)',
        (user['id'], user['name'], user['email']))
    except sqlite3.IntegrityError as e:
        print(f"Skipping duplicate or invalid entry: {e}")

conn.commit()

# Step 5: Verify
cur.execute('SELECT * FROM users')
for row in cur.fetchall():
    print(row)

conn.close()
